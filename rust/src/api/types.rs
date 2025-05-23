use std::{
    str::FromStr,
    time::{Duration, SystemTime, UNIX_EPOCH},
};

use boltz_client::{
    fees::Fee,
    network::BitcoinChain,
    network::Chain as AllChains,
    network::LiquidChain,
    swaps::boltz::{
        BoltzApiClientV2, Side as BoltzSide, SwapTxKind as BoltzSwapTxKind,
        SwapType as BoltzSwapType,
    },
    util::secrets::SwapKey,
    Address, Bolt11Invoice, BtcSwapScript, ElementsAddress, Hash, Keypair, LBtcSwapScript,
    PublicKey, Secp256k1, ZKKeyPair,
};
use serde::{Deserialize, Serialize};

use crate::util::ensure_http_prefix;

use super::error::BoltzError;
#[derive(Clone, Copy, PartialEq, Serialize, Deserialize)]
pub enum TxFee {
    Absolute(u64),
    Relative(f64),
}

impl Into<Fee> for TxFee {
    fn into(self) -> Fee {
        match self {
            TxFee::Absolute(x) => Fee::Absolute(x),
            TxFee::Relative(x) => Fee::Relative(x),
        }
    }
}

/// Used for chain-swaps only. The side is based on which transaction is being made by the user.
/// When a swap is created the user must first make a Lockup.
/// Once the swap is completed, the user must make a Claim.
#[derive(Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
pub enum Side {
    Lockup,
    Claim,
}

impl Into<BoltzSide> for Side {
    fn into(self) -> BoltzSide {
        match self {
            Side::Lockup => BoltzSide::Lockup,
            Side::Claim => BoltzSide::Claim,
        }
    }
}
impl From<BoltzSide> for Side {
    fn from(boltz_side: BoltzSide) -> Self {
        match boltz_side {
            BoltzSide::Lockup => Side::Lockup,
            BoltzSide::Claim => Side::Claim,
        }
    }
}

#[derive(Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
pub enum SwapTxKind {
    Claim,
    Refund,
}

impl Into<BoltzSwapTxKind> for SwapTxKind {
    fn into(self) -> BoltzSwapTxKind {
        match self {
            SwapTxKind::Refund => BoltzSwapTxKind::Refund,
            SwapTxKind::Claim => BoltzSwapTxKind::Claim,
        }
    }
}
impl From<BoltzSwapTxKind> for SwapTxKind {
    fn from(kind: BoltzSwapTxKind) -> Self {
        match kind {
            BoltzSwapTxKind::Refund => SwapTxKind::Refund,
            BoltzSwapTxKind::Claim => SwapTxKind::Claim,
        }
    }
}

#[derive(Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
pub enum SwapType {
    Submarine,
    Reverse,
    Chain,
}

impl Into<BoltzSwapType> for SwapType {
    fn into(self) -> BoltzSwapType {
        match self {
            SwapType::Submarine => BoltzSwapType::Submarine,
            SwapType::Reverse => BoltzSwapType::ReverseSubmarine,
            SwapType::Chain => BoltzSwapType::Chain,
        }
    }
}
impl From<BoltzSwapType> for SwapType {
    fn from(boltz_swap_type: BoltzSwapType) -> Self {
        match boltz_swap_type {
            BoltzSwapType::Submarine => SwapType::Submarine,
            BoltzSwapType::ReverseSubmarine => SwapType::Reverse,
            BoltzSwapType::Chain => SwapType::Chain,
        }
    }
}

#[derive(Clone, Copy, Eq, Serialize, Deserialize, PartialEq)]
pub enum Chain {
    Bitcoin,
    BitcoinTestnet,
    Liquid,
    LiquidTestnet,
}

impl Into<AllChains> for Chain {
    fn into(self) -> AllChains {
        match self {
            Chain::Bitcoin => AllChains::Bitcoin(BitcoinChain::Bitcoin),
            Chain::BitcoinTestnet => AllChains::Bitcoin(BitcoinChain::BitcoinTestnet),
            Chain::Liquid => AllChains::Liquid(LiquidChain::Liquid),
            Chain::LiquidTestnet => AllChains::Liquid(LiquidChain::LiquidTestnet),
        }
    }
}
// implement from AllChains
impl From<AllChains> for Chain {
    fn from(chain: AllChains) -> Self {
        match chain {
            AllChains::Bitcoin(BitcoinChain::Bitcoin) => Chain::Bitcoin,
            AllChains::Bitcoin(BitcoinChain::BitcoinTestnet) => Chain::BitcoinTestnet,
            AllChains::Liquid(LiquidChain::Liquid) => Chain::Liquid,
            AllChains::Liquid(LiquidChain::LiquidTestnet) => Chain::LiquidTestnet,
            _ => panic!("Invalid chain"),
        }
    }
}

impl Into<BitcoinChain> for Chain {
    fn into(self) -> BitcoinChain {
        match self {
            Chain::Bitcoin => BitcoinChain::Bitcoin,
            Chain::BitcoinTestnet => BitcoinChain::BitcoinTestnet,
            _ => panic!("Invalid chain"),
        }
    }
}
impl Into<LiquidChain> for Chain {
    fn into(self) -> LiquidChain {
        match self {
            Chain::Liquid => LiquidChain::Liquid,
            Chain::LiquidTestnet => LiquidChain::LiquidTestnet,
            _ => panic!("Invalid chain"),
        }
    }
}

#[derive(Clone, Copy, Serialize, Deserialize, PartialEq, Eq)]
pub enum ChainSwapDirection {
    BtcToLbtc,
    LbtcToBtc,
}

#[derive(Clone, PartialEq, Eq, Serialize, Deserialize)]
pub struct KeyPair {
    pub secret_key: String,
    pub public_key: String,
}

impl TryInto<Keypair> for KeyPair {
    type Error = BoltzError;
    fn try_into(self) -> Result<Keypair, Self::Error> {
        let secp = Secp256k1::new();
        match Keypair::from_seckey_str(&secp, &self.secret_key) {
            Ok(keypair) => Ok(keypair),
            Err(e) => Err(BoltzError::new("Key".to_string(), e.to_string())),
        }
    }
}

/// Used internally to create a KeyPair for swaps
impl KeyPair {
    pub fn new(secret_key: String, public_key: String) -> Self {
        KeyPair {
            secret_key,
            public_key,
        }
    }

    pub fn generate(
        mnemonic: String,
        passphrase: Option<String>,
        network: Chain,
        index: u64,
        swap_type: SwapType,
    ) -> Result<Self, BoltzError> {
        let passphrase = if passphrase.is_some() {
            passphrase.unwrap()
        } else {
            "".to_string()
        };
        match swap_type {
            SwapType::Submarine => {
                let child_keys =
                    SwapKey::from_submarine_account(&mnemonic, &passphrase, network.into(), index)?;
                Ok(KeyPair {
                    secret_key: child_keys.keypair.display_secret().to_string(),
                    public_key: child_keys.keypair.public_key().to_string(),
                })
            }
            SwapType::Reverse => {
                let child_keys =
                    SwapKey::from_reverse_account(&mnemonic, &passphrase, network.into(), index)?;
                Ok(KeyPair {
                    secret_key: child_keys.keypair.display_secret().to_string(),
                    public_key: child_keys.keypair.public_key().to_string(),
                })
            }
            SwapType::Chain => {
                let child_keys =
                    SwapKey::from_chain_account(&mnemonic, &passphrase, network.into(), index)?;
                Ok(KeyPair {
                    secret_key: child_keys.keypair.display_secret().to_string(),
                    public_key: child_keys.keypair.public_key().to_string(),
                })
            }
        }
    }
}

use boltz_client::util::secrets::Preimage;

/// Used internally to create a secret - PreImage for swaps
#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
pub struct PreImage {
    pub value: String,
    pub sha256: String,
    pub hash160: String,
}

impl TryInto<Preimage> for PreImage {
    type Error = BoltzError; // Use a more specific error type in a real application

    fn try_into(self) -> Result<Preimage, Self::Error> {
        if !self.value.is_empty() {
            Ok(Preimage::from_str(&self.value)?)
        } else {
            Ok(Preimage::from_sha256_str(&self.sha256)?)
        }
    }
}

impl PreImage {
    pub fn new(value: String, sha256: String, hash160: String) -> Self {
        PreImage {
            value,
            sha256,
            hash160,
        }
    }
    pub fn generate() -> Self {
        let preimage = Preimage::new();
        PreImage {
            value: preimage.to_string().unwrap(),
            sha256: preimage.sha256.to_string(),
            hash160: preimage.hash160.to_string(),
        }
    }
}

impl Into<PreImage> for Preimage {
    fn into(self) -> PreImage {
        PreImage {
            value: self.to_string().unwrap_or("".to_string()),
            sha256: self.sha256.to_string(),
            hash160: self.hash160.to_string(),
        }
    }
}

/// Helper to handle Lightning invoices
#[derive(Debug, Clone)]
pub struct DecodedInvoice {
    pub msats: u64,
    pub expiry: u64,
    pub expires_in: u64,
    pub expires_at: u64,
    pub is_expired: bool,
    pub network: String,
    pub cltv_exp_delta: u64,
    // / (address, btc_amount)
    pub bip21: Option<String>,
    pub preimage_hash: String,
    pub description: String,
}
impl DecodedInvoice {
    /// Add boltz_url & chain for route hint check
    pub async fn from_string(s: String, boltz_url: Option<String>) -> Result<Self, BoltzError> {
        // Attempt to parse the string to a Bolt11Invoice
        let invoice = match Bolt11Invoice::from_str(&s) {
            Ok(result) => result,
            Err(e) => return Err(BoltzError::new("Input".to_string(), e.to_string())),
        };
        let bip21 = if boltz_url.is_some() {
            let mrh = match boltz_client::swaps::magic_routing::find_magic_routing_hint(&s) {
                Ok(s) => s,
                Err(_) => None,
            };
            if mrh.is_none() {
                None
            } else {
                let boltz_client =
                    BoltzApiClientV2::new(ensure_http_prefix(&boltz_url.unwrap()), None);
                match boltz_client.get_mrh_bip21(&s).await {
                    Ok(r) => Some(r.bip21),
                    Err(_) => None,
                }
            }
        } else {
            None
        };
        let now = SystemTime::now();
        let duration_since_epoch = now.duration_since(UNIX_EPOCH).expect("Time went backwards");
        let current_secs = duration_since_epoch.as_secs();
        let expires_at = invoice
            .expires_at()
            .unwrap_or(Duration::from_secs(0))
            .as_secs();

        Ok(DecodedInvoice {
            expiry: invoice.expiry_time().as_secs(),
            expires_in: invoice
                .expiration_remaining_from_epoch(duration_since_epoch)
                .as_secs(),
            expires_at: expires_at,
            is_expired: if current_secs >= expires_at {
                true
            } else {
                false
            },
            msats: invoice.amount_milli_satoshis().unwrap_or(0),
            cltv_exp_delta: invoice.min_final_cltv_expiry_delta(),
            network: invoice.network().to_string(),
            bip21: bip21,
            preimage_hash: invoice.payment_hash().to_string(),
            description: invoice.description().to_string(),
        })
    }
}

/// Helper to store a BtcSwapScript and convert to a BtcSwapScript
#[derive(Clone, PartialEq, Eq, Serialize, Deserialize)]
pub struct BtcSwapScriptStr {
    pub swap_type: SwapType,
    pub funding_addrs: Option<String>,
    pub hashlock: String,
    pub receiver_pubkey: String,
    pub locktime: u32,
    pub sender_pubkey: String,
    pub side: Option<Side>,
}

impl BtcSwapScriptStr {
    pub fn new(
        swap_type: SwapType,
        funding_addrs: Option<String>,
        hashlock: String,
        receiver_pubkey: String,
        locktime: u32,
        sender_pubkey: String,
        side: Option<Side>,
    ) -> Self {
        BtcSwapScriptStr {
            swap_type,
            funding_addrs,
            hashlock,
            receiver_pubkey,
            locktime,
            sender_pubkey,
            side,
        }
    }
}

impl TryInto<BtcSwapScript> for BtcSwapScriptStr {
    type Error = BoltzError; // Use a more specific error type in a real application

    fn try_into(self) -> Result<BtcSwapScript, Self::Error> {
        let address: Option<Address> = if self.funding_addrs.is_some() {
            let address = match Address::from_str(&self.funding_addrs.unwrap()) {
                Ok(r) => r.assume_checked(),
                Err(_) => {
                    return Err(BoltzError::new(
                        "Input".to_string(),
                        "Could not parse elements address".to_string(),
                    ))
                }
            };
            Some(address)
        } else {
            None
        };
        let hashlock = match Hash::from_str(&self.hashlock) {
            Ok(r) => r,
            Err(_) => {
                return Err(BoltzError::new(
                    "Input".to_string(),
                    "Could not parse hash value".to_string(),
                ))
            }
        };
        let receiver_pubkey = match PublicKey::from_str(&self.receiver_pubkey) {
            Ok(r) => r,
            Err(_) => {
                return Err(BoltzError::new(
                    "Input".to_string(),
                    "Could not receiver pubkey value".to_string(),
                ))
            }
        };
        let sender_pubkey = match PublicKey::from_str(&self.sender_pubkey) {
            Ok(r) => r,
            Err(_) => {
                return Err(BoltzError::new(
                    "Input".to_string(),
                    "Could not sender pubkey value".to_string(),
                ))
            }
        };
        let locktime = match boltz_client::LockTime::from_height(self.locktime) {
            Ok(r) => r,
            Err(_) => {
                return Err(BoltzError::new(
                    "Input".to_string(),
                    "Could not locktime value".to_string(),
                ))
            }
        };
        Ok(BtcSwapScript {
            swap_type: self.swap_type.clone().into(),
            funding_addrs: address,
            hashlock: hashlock,
            receiver_pubkey: receiver_pubkey,
            locktime: locktime,
            sender_pubkey: sender_pubkey,
            side: if self.side.is_some() {
                Some(self.side.unwrap().into())
            } else {
                None
            },
        })
    }
}

impl From<BtcSwapScript> for BtcSwapScriptStr {
    fn from(swap: BtcSwapScript) -> Self {
        BtcSwapScriptStr {
            swap_type: swap.swap_type.into(),
            funding_addrs: swap.funding_addrs.map(|addr| addr.to_string()),
            hashlock: swap.hashlock.to_string(),
            receiver_pubkey: swap.receiver_pubkey.to_string(),
            locktime: swap.locktime.to_consensus_u32(),
            sender_pubkey: swap.sender_pubkey.to_string(),
            side: if swap.side.is_some() {
                Some(swap.side.unwrap().into())
            } else {
                None
            },
        }
    }
}
/// Helper to store a LBtcSwapScript and convert to a LBtcSwapScript
#[derive(Clone, PartialEq, Eq, Serialize, Deserialize)]
pub struct LBtcSwapScriptStr {
    pub swap_type: SwapType,
    pub funding_addrs: Option<String>,
    pub hashlock: String,
    pub receiver_pubkey: String,
    pub locktime: u32,
    pub sender_pubkey: String,
    pub blinding_key: String,
    pub side: Option<Side>,
}
impl LBtcSwapScriptStr {
    pub fn new(
        swap_type: SwapType,
        funding_addrs: Option<String>,
        hashlock: String,
        receiver_pubkey: String,
        locktime: u32,
        sender_pubkey: String,
        blinding_key: String,
        side: Option<Side>,
    ) -> Self {
        LBtcSwapScriptStr {
            swap_type,
            funding_addrs,
            hashlock,
            receiver_pubkey,
            locktime,
            sender_pubkey,
            blinding_key,
            side,
        }
    }
}
impl TryInto<LBtcSwapScript> for LBtcSwapScriptStr {
    type Error = BoltzError; // Use a more specific error type in a real application

    fn try_into(self) -> Result<LBtcSwapScript, Self::Error> {
        let address: Option<ElementsAddress> = if self.funding_addrs.is_some() {
            let address = match ElementsAddress::from_str(&self.funding_addrs.unwrap()) {
                Ok(r) => r,
                Err(_) => {
                    return Err(BoltzError::new(
                        "Input".to_string(),
                        "Could not parse elements address".to_string(),
                    ))
                }
            };
            Some(address)
        } else {
            None
        };
        let hashlock = match Hash::from_str(&self.hashlock) {
            Ok(r) => r,
            Err(_) => {
                return Err(BoltzError::new(
                    "Input".to_string(),
                    "Could not parse hashlock value".to_string(),
                ))
            }
        };
        let receiver_pubkey = match PublicKey::from_str(&self.receiver_pubkey) {
            Ok(r) => r,
            Err(_) => {
                return Err(BoltzError::new(
                    "Input".to_string(),
                    "Could not parse receiver pubkey value".to_string(),
                ))
            }
        };
        let sender_pubkey = match PublicKey::from_str(&self.sender_pubkey) {
            Ok(r) => r,
            Err(_) => {
                return Err(BoltzError::new(
                    "Input".to_string(),
                    "Could not parse sender pubkey value".to_string(),
                ))
            }
        };
        let locktime = match boltz_client::ElementsLockTime::from_height(self.locktime) {
            Ok(r) => r,
            Err(_) => {
                return Err(BoltzError::new(
                    "Input".to_string(),
                    "Could not parse locktime value".to_string(),
                ))
            }
        };
        let blinding_key = match ZKKeyPair::from_str(&self.blinding_key) {
            Ok(r) => r,
            Err(_) => {
                return Err(BoltzError::new(
                    "Input".to_string(),
                    "Could not parse blinding key value".to_string(),
                ))
            }
        };
        Ok(LBtcSwapScript {
            swap_type: self.swap_type.clone().into(),
            funding_addrs: address,
            hashlock: hashlock,
            receiver_pubkey: receiver_pubkey,
            locktime: locktime,
            sender_pubkey: sender_pubkey,
            blinding_key: blinding_key,
            side: if self.side.is_some() {
                Some(self.side.unwrap().into())
            } else {
                None
            },
        })
    }
}

impl From<LBtcSwapScript> for LBtcSwapScriptStr {
    fn from(swap: LBtcSwapScript) -> Self {
        LBtcSwapScriptStr {
            swap_type: swap.swap_type.into(),
            funding_addrs: swap.funding_addrs.map(|addr| addr.to_string()),
            hashlock: swap.hashlock.to_string(),
            receiver_pubkey: swap.receiver_pubkey.inner.to_string(),
            locktime: swap.locktime.to_consensus_u32(),
            sender_pubkey: swap.sender_pubkey.inner.to_string(),
            blinding_key: swap.blinding_key.display_secret().to_string(),
            side: if swap.side.is_some() {
                Some(swap.side.unwrap().into())
            } else {
                None
            },
        }
    }
}
