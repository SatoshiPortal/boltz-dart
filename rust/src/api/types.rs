use std::{str::FromStr, time::Duration};

use flutter_rust_bridge::frb;
// network
// preimage
//
use boltz_client::{
    network::Chain as BChain,
    swaps::{
        boltz::{BoltzApiClient, SwapType as BoltzSwapType},
        boltzv2::BoltzApiClientV2,
        magic_routing,
    },
    util::secrets::SwapKey,
    Address, Bolt11Invoice, BtcSwapScriptV2, ElementsAddress, Hash, Keypair, LBtcSwapScriptV2,
    PublicKey, Secp256k1, ZKKeyPair,
};
use serde::{Deserialize, Serialize};

use crate::util::check_protocol;

use super::error::BoltzError;

#[derive(Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
#[frb(dart_metadata=("freezed"))]
pub enum SwapType {
    Submarine,
    Reverse,
}

impl Into<BoltzSwapType> for SwapType {
    fn into(self) -> BoltzSwapType {
        match self {
            SwapType::Submarine => BoltzSwapType::Submarine,
            SwapType::Reverse => BoltzSwapType::ReverseSubmarine,
        }
    }
}
impl From<BoltzSwapType> for SwapType {
    fn from(boltz_swap_type: BoltzSwapType) -> Self {
        match boltz_swap_type {
            BoltzSwapType::Submarine => SwapType::Submarine,
            BoltzSwapType::ReverseSubmarine => SwapType::Reverse,
        }
    }
}

#[derive(Clone, Copy, Serialize, Deserialize, PartialEq)]
#[frb(dart_metadata=("freezed"))]
pub enum Chain {
    Bitcoin,
    BitcoinTestnet,
    Liquid,
    LiquidTestnet,
}

impl Into<BChain> for Chain {
    fn into(self) -> BChain {
        match self {
            Chain::Bitcoin => BChain::Bitcoin,
            Chain::BitcoinTestnet => BChain::BitcoinTestnet,
            Chain::Liquid => BChain::Liquid,
            Chain::LiquidTestnet => BChain::LiquidTestnet,
        }
    }
}

#[derive(Clone, Serialize, Deserialize)]
#[frb(dart_metadata=("freezed"))]
pub struct KeyPair {
    pub secret_key: String,
    pub public_key: String,
}

impl Into<Keypair> for KeyPair {
    fn into(self) -> Keypair {
        let secp = Secp256k1::new();
        Keypair::from_seckey_str(&secp, &self.secret_key).unwrap()
    }
}

impl KeyPair {
    #[frb(sync)]
    pub fn new(secret_key: String, public_key: String) -> Self {
        KeyPair {
            secret_key,
            public_key,
        }
    }

    pub fn generate(
        mnemonic: String,
        network: Chain,
        index: u64,
        swap_type: SwapType,
    ) -> Result<Self, BoltzError> {
        match swap_type {
            SwapType::Submarine => {
                let child_keys =
                    SwapKey::from_submarine_account(&mnemonic, "", network.into(), index)?;
                Ok(KeyPair {
                    secret_key: child_keys.keypair.display_secret().to_string(),
                    public_key: child_keys.keypair.public_key().to_string(),
                })
            }
            SwapType::Reverse => {
                let child_keys =
                    SwapKey::from_reverse_account(&mnemonic, "", network.into(), index)?;
                Ok(KeyPair {
                    secret_key: child_keys.keypair.display_secret().to_string(),
                    public_key: child_keys.keypair.public_key().to_string(),
                })
            }
        }
    }
}

use boltz_client::util::secrets::Preimage;

#[derive(Debug, Clone, Serialize, Deserialize)]
#[frb(dart_metadata=("freezed"))]
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
    #[frb(sync)]
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

#[derive(Debug, Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct AllFees {
    pub btc_limits: Limits,
    pub lbtc_limits: Limits,
    pub btc_submarine: SubmarineSwapFees,
    pub btc_reverse: ReverseSwapFees,
    pub lbtc_submarine: SubmarineSwapFees,
    pub lbtc_reverse: ReverseSwapFees,
    pub btc_pair_hash: String,
    pub lbtc_pair_hash: String,
}

impl AllFees {
    pub fn fetch(boltz_url: String) -> Result<Self, BoltzError> {
        let boltz_client = BoltzApiClient::new(&check_protocol(&boltz_url));
        let boltz_pairs = match boltz_client.get_pairs() {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };

        let btc_pair = match boltz_pairs.get_btc_pair() {
            Some(result) => result,
            None => {
                return Err(BoltzError::new(
                    "BoltzApi".to_owned(),
                    "Could not get BTC pair".to_owned(),
                ))
            }
        };
        let btc_limits = Limits {
            minimal: btc_pair.limits.minimal as u64,
            maximal: btc_pair.limits.maximal as u64,
        };
        let btc_submarine = SubmarineSwapFees {
            boltz_fees_rate: btc_pair.fees.percentage_swap_in,
            lockup_fees_estimate: btc_pair.fees.submarine_lockup_estimate(),
            claim_fees: btc_pair.fees.submarine_claim(),
        };
        let btc_reverse = ReverseSwapFees {
            boltz_fees_rate: btc_pair.fees.percentage,
            lockup_fees: btc_pair.fees.reverse_lockup(),
            claim_fees_estimate: btc_pair.fees.reverse_claim_estimate(),
        };

        let lbtc_pair = match boltz_pairs.get_lbtc_pair() {
            Some(result) => result,
            None => {
                return Err(BoltzError::new(
                    "BoltzApi".to_owned(),
                    "Could not get L-BTC pair".to_owned(),
                ))
            }
        };
        let lbtc_limits = Limits {
            minimal: lbtc_pair.limits.minimal as u64,
            maximal: lbtc_pair.limits.maximal as u64,
        };
        let lbtc_submarine = SubmarineSwapFees {
            boltz_fees_rate: lbtc_pair.fees.percentage_swap_in,
            lockup_fees_estimate: lbtc_pair.fees.submarine_lockup_estimate(),
            claim_fees: lbtc_pair.fees.submarine_claim(),
        };
        let lbtc_reverse = ReverseSwapFees {
            boltz_fees_rate: lbtc_pair.fees.percentage,
            lockup_fees: lbtc_pair.fees.reverse_lockup(),
            claim_fees_estimate: lbtc_pair.fees.reverse_claim_estimate(),
        };
        let btc_pair_hash = btc_pair.hash;
        let lbtc_pair_hash = lbtc_pair.hash;

        Ok(AllFees {
            btc_limits,
            lbtc_limits,
            btc_submarine,
            btc_reverse,
            lbtc_submarine,
            lbtc_reverse,
            btc_pair_hash,
            lbtc_pair_hash,
        })
    }
}

#[derive(Debug, Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct Limits {
    pub minimal: u64,
    pub maximal: u64,
}

// 1. lockup (client) 2. [claim (boltz) | refund (client)]
#[frb(dart_metadata=("freezed"))]
#[derive(Debug, Clone)]
pub struct SubmarineSwapFees {
    pub boltz_fees_rate: f64,
    pub claim_fees: u64,
    pub lockup_fees_estimate: u64,
}

// 1. lockup (boltz) 2. [claim (client) | refund (boltz)]
#[frb(dart_metadata=("freezed"))]
#[derive(Debug, Clone)]
pub struct ReverseSwapFees {
    pub boltz_fees_rate: f64,
    pub lockup_fees: u64,
    pub claim_fees_estimate: u64,
}

#[frb(dart_metadata=("freezed"))]
#[derive(Debug, Clone)]
pub struct DecodedInvoice {
    pub msats: u64,
    pub expiry: u64,
    pub expires_in: u64,
    pub expires_at: u64,
    pub is_expired: bool,
    pub network: String,
    pub cltv_exp_delta: u64,
    /// (address, btc_amount)
    pub mrh_address: Option<String>,
    pub mrh_amount: Option<f64>,
}
impl DecodedInvoice {
    /// Add boltz_url & chain for route hint check
    pub fn from_string(
        s: String,
        boltz_url: Option<String>,
        chain: Option<Chain>,
    ) -> Result<Self, BoltzError> {
        // Attempt to parse the string to a Bolt11Invoice
        let invoice = match Bolt11Invoice::from_str(&s) {
            Ok(result) => result,
            Err(e) => return Err(BoltzError::new("Input".to_string(), e.to_string())),
        };

        let route_hint = if boltz_url.is_some() && chain.is_some() {
            let boltz_client = BoltzApiClientV2::new(&check_protocol(&boltz_url.unwrap()));
            match magic_routing::check_for_mrh(&boltz_client, &s, chain.unwrap().into())? {
                Some(r) => Some(r),
                None => None,
            }
        } else {
            None
        };

        Ok(DecodedInvoice {
            expiry: invoice.expiry_time().as_secs(),
            expires_in: invoice.duration_until_expiry().as_secs(),
            expires_at: invoice
                .expires_at()
                .unwrap_or(Duration::from_secs(0))
                .as_secs(),
            is_expired: invoice.is_expired(),
            msats: invoice.amount_milli_satoshis().unwrap_or(0),
            cltv_exp_delta: invoice.min_final_cltv_expiry_delta(),
            network: invoice.network().to_string(),
            mrh_address: route_hint.as_ref().map(|r| r.0.clone()),
            mrh_amount: route_hint.as_ref().map(|r| r.1),
        })
    }
}

#[derive(Clone, PartialEq, Eq, Serialize, Deserialize)]
#[frb(dart_metadata=("freezed"))]
pub struct BtcSwapScriptV2Str {
    pub swap_type: SwapType,
    pub funding_addrs: Option<String>,
    pub hashlock: String,
    pub receiver_pubkey: String,
    pub locktime: u32,
    pub sender_pubkey: String,
}

impl BtcSwapScriptV2Str {
    #[frb(sync)]
    pub fn new(
        swap_type: SwapType,
        funding_addrs: Option<String>,
        hashlock: String,
        receiver_pubkey: String,
        locktime: u32,
        sender_pubkey: String,
    ) -> Self {
        BtcSwapScriptV2Str {
            swap_type,
            funding_addrs,
            hashlock,
            receiver_pubkey,
            locktime,
            sender_pubkey,
        }
    }
}

impl TryInto<BtcSwapScriptV2> for BtcSwapScriptV2Str {
    type Error = BoltzError; // Use a more specific error type in a real application

    fn try_into(self) -> Result<BtcSwapScriptV2, Self::Error> {
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
        Ok(BtcSwapScriptV2 {
            swap_type: self.swap_type.clone().into(),
            funding_addrs: address,
            hashlock: hashlock,
            receiver_pubkey: receiver_pubkey,
            locktime: locktime,
            sender_pubkey: sender_pubkey,
        })
    }
}

impl From<BtcSwapScriptV2> for BtcSwapScriptV2Str {
    fn from(swap: BtcSwapScriptV2) -> Self {
        BtcSwapScriptV2Str {
            swap_type: swap.swap_type.into(),
            funding_addrs: swap.funding_addrs.map(|addr| addr.to_string()),
            hashlock: swap.hashlock.to_string(),
            receiver_pubkey: swap.receiver_pubkey.to_string(),
            locktime: swap.locktime.to_consensus_u32(),
            sender_pubkey: swap.sender_pubkey.to_string(),
        }
    }
}

#[derive(Clone, PartialEq, Eq, Serialize, Deserialize)]
#[frb(dart_metadata=("freezed"))]
pub struct LBtcSwapScriptV2Str {
    pub swap_type: SwapType,
    pub funding_addrs: Option<String>,
    pub hashlock: String,
    pub receiver_pubkey: String,
    pub locktime: u32,
    pub sender_pubkey: String,
    pub blinding_key: String,
}
impl LBtcSwapScriptV2Str {
    #[frb(sync)]
    pub fn new(
        swap_type: SwapType,
        funding_addrs: Option<String>,
        hashlock: String,
        receiver_pubkey: String,
        locktime: u32,
        sender_pubkey: String,
        blinding_key: String,
    ) -> Self {
        LBtcSwapScriptV2Str {
            swap_type,
            funding_addrs,
            hashlock,
            receiver_pubkey,
            locktime,
            sender_pubkey,
            blinding_key,
        }
    }
}
impl TryInto<LBtcSwapScriptV2> for LBtcSwapScriptV2Str {
    type Error = BoltzError; // Use a more specific error type in a real application

    fn try_into(self) -> Result<LBtcSwapScriptV2, Self::Error> {
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

        Ok(LBtcSwapScriptV2 {
            swap_type: self.swap_type.clone().into(),
            funding_addrs: address,
            hashlock: hashlock,
            receiver_pubkey: receiver_pubkey,
            locktime: locktime,
            sender_pubkey: sender_pubkey,
            blinding_key: blinding_key,
        })
    }
}

impl From<LBtcSwapScriptV2> for LBtcSwapScriptV2Str {
    fn from(swap: LBtcSwapScriptV2) -> Self {
        LBtcSwapScriptV2Str {
            swap_type: swap.swap_type.into(),
            funding_addrs: swap.funding_addrs.map(|addr| addr.to_string()),
            hashlock: swap.hashlock.to_string(),
            receiver_pubkey: swap.receiver_pubkey.inner.to_string(),
            locktime: swap.locktime.to_consensus_u32(),
            sender_pubkey: swap.sender_pubkey.inner.to_string(),
            blinding_key: swap.blinding_key.display_secret().to_string(),
        }
    }
}

#[cfg(test)]
mod tests {
    use boltz_client::swaps::boltz::BOLTZ_TESTNET_URL;

    use super::*;
    #[test]
    fn test_fetch_all_fees() {
        let fees = AllFees::fetch(BOLTZ_TESTNET_URL.to_owned());
        println!("{:#?}", fees);
    }
}
