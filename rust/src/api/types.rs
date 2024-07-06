use std::{str::FromStr, time::Duration};

use flutter_rust_bridge::frb;
// network
// preimage
//
use boltz_client::{
    boltz, error::Error as LibError, network::Chain as BChain, swaps::boltz::{
        BoltzApiClientV2, ChainFees, GetChainPairsResponse, GetReversePairsResponse, GetSubmarinePairsResponse, PairMinerFees, ReverseFees, Side as BoltzSide, SubmarineFees, SwapType as BoltzSwapType
    }, util::secrets::SwapKey, Address, Bolt11Invoice, BtcSwapScript, ElementsAddress, Hash, Keypair, LBtcSwapScript, PublicKey, Secp256k1, ZKKeyPair
};
use serde::{Deserialize, Serialize};

use crate::util::check_protocol;

use super::error::BoltzError;

#[derive(Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
#[frb(dart_metadata=("freezed"))]
pub enum Side {
    Lockup,
    Claim,
}

impl Into<BoltzSide> for Side {
    fn into(self) -> BoltzSide {
        match self {
            Side::Lockup => BoltzSide::Lockup,
            Side::Claim => BoltzSide::Claim
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
#[frb(dart_metadata=("freezed"))]
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

#[derive(Clone, Copy, Serialize, Deserialize, PartialEq)]
pub enum ChainSwapDirection {
    BtcToLbtc,
    LbtcToBtc,
}

#[derive(Clone, Serialize, Deserialize)]
#[frb(dart_metadata=("freezed"))]
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
            Err(e) => Err(boltz_client::error::Error::Key(e.into()).into()),
        }
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
            SwapType::Chain => {
                let child_keys = SwapKey::from_chain_account(&mnemonic, "", network.into(), index)?;
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

pub struct SwapLimits {
    pub minimal: u64,
    pub maximal: u64,
}

impl Into<SwapLimits> for boltz_client::swaps::boltz::PairLimits {
    fn into(self) -> SwapLimits {
        SwapLimits {
            minimal: self.minimal as u64,
            maximal: self.maximal as u64,
        }
    }
}
impl Into<SwapLimits> for boltz_client::swaps::boltz::ReverseLimits {
    fn into(self) -> SwapLimits {
        SwapLimits {
            minimal: self.minimal as u64,
            maximal: self.maximal as u64,
        }
    }
}
#[derive(Debug, Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct SubSwapFees {
    pub percentage: f64,
    pub miner_fees: u64,
}

impl Into<SubSwapFees> for SubmarineFees {
    fn into(self) -> SubSwapFees {
        SubSwapFees {
            percentage: self.percentage,
            miner_fees: self.miner_fees as u64,
        }
    }
}
#[derive(Debug, Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct SubmarineFeesAndLimits {
    pub btc_limits: SwapLimits,
    pub lbtc_limits: SwapLimits,
    pub btc_fees: SubSwapFees,
    pub lbtc_fees: SubSwapFees,
}
impl TryInto<SubmarineFeesAndLimits> for GetSubmarinePairsResponse {
    type Error = BoltzError; // Use a more specific error type in a real application

    fn try_into(self) -> Result<SubmarineFeesAndLimits, Self::Error> {
        let btc_pair = match self.get_btc_to_btc_pair() {
            Some(result) => result,
            None => return Err(LibError::Protocol("Could Not find BTC Pair".to_string()).into()),
        };
        let btc_limits: SwapLimits = btc_pair.limits.into();
        let btc_fees = btc_pair.fees.into();
        let lbtc_pair = match self.get_lbtc_to_btc_pair() {
            Some(result) => result,
            None => return Err(LibError::Protocol("Could Not find L-BTC Pair".to_string()).into()),
        };
        let lbtc_limits = lbtc_pair.limits.into();
        let lbtc_fees = lbtc_pair.fees.into();
        Ok(SubmarineFeesAndLimits {
            btc_limits,
            lbtc_limits,
            btc_fees,
            lbtc_fees,
        })
    }
}

#[derive(Debug, Clone)]
#[frb(dart_metadata=("freezed"))]

pub struct MinerFees {
    pub lockup: u64,
    pub claim: u64,
}
impl Into<MinerFees> for PairMinerFees {
    fn into(self) -> MinerFees {
        MinerFees {
            lockup: self.lockup,
            claim: self.claim,
        }
    }
}

#[derive(Debug, Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct RevSwapFees {
    pub percentage: f64,
    pub miner_fees: MinerFees,
}

impl Into<RevSwapFees> for ReverseFees {
    fn into(self) -> RevSwapFees {
        RevSwapFees {
            percentage: self.percentage,
            miner_fees: self.miner_fees.into(),
        }
    }
}

#[derive(Debug, Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct ReverseFeesAndLimits {
    pub btc_limits: SwapLimits,
    pub lbtc_limits: SwapLimits,
    pub btc_fees: RevSwapFees,
    pub lbtc_fees: RevSwapFees,
}

impl TryInto<ReverseFeesAndLimits> for GetReversePairsResponse {
    type Error = BoltzError; // Use a more specific error type in a real application

    fn try_into(self) -> Result<ReverseFeesAndLimits, Self::Error> {
        let btc_pair = match self.get_btc_to_btc_pair() {
            Some(result) => result,
            None => return Err(LibError::Protocol("Could Not find BTC Pair".to_string()).into()),
        };
        let btc_limits = btc_pair.limits.into();
        let btc_reverse = btc_pair.fees.into();
        let lbtc_pair = match self.get_btc_to_lbtc_pair() {
            Some(result) => result,
            None => return Err(LibError::Protocol("Could Not find L-BTC Pair".to_string()).into()),
        };
        let lbtc_limits = lbtc_pair.limits.into();
        let lbtc_reverse = lbtc_pair.fees.into();
        Ok(ReverseFeesAndLimits {
            btc_limits,
            lbtc_limits,
            btc_fees: btc_reverse,
            lbtc_fees: lbtc_reverse,
        })
    }
}

#[derive(Debug, Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct ChainSwapFees {
    pub percentage: f64,
    pub user_lockup: u64,
    pub user_claim: u64,
    pub server: u64,
}

impl From<ChainFees> for ChainSwapFees {
    fn from(cf: ChainFees) -> Self {
        Self {
            percentage: cf.percentage,
            user_lockup: cf.lockup(),
            user_claim: cf.claim_estimate(),
            server: cf.server(),
        }
    }
}

#[derive(Debug, Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct ChainFeesAndLimits {
    pub btc_limits: SwapLimits,
    pub lbtc_limits: SwapLimits,
    pub btc_fees: ChainSwapFees,  // we lockup (send) btc, we claim lbtc
    pub lbtc_fees: ChainSwapFees, // we lockup (send) lbtc, we claim btc
}
impl TryInto<ChainFeesAndLimits> for GetChainPairsResponse {
    type Error = BoltzError; // Use a more specific error type in a real application

    fn try_into(self) -> Result<ChainFeesAndLimits, Self::Error> {
        let btc_pair = match self.get_lbtc_to_btc_pair() {
            Some(result) => result,
            None => return Err(LibError::Protocol("Could Not find BTC Pair".to_string()).into()),
        };
        let btc_limits = btc_pair.limits.into();
        let btc_chain = btc_pair.fees.into();
        let lbtc_pair = match self.get_btc_to_lbtc_pair() {
            Some(result) => result,
            None => return Err(LibError::Protocol("Could Not find BTC Pair".to_string()).into()),
        };
        let lbtc_limits = lbtc_pair.limits.into();
        let lbtc_chain = lbtc_pair.fees.into();
        Ok(ChainFeesAndLimits {
            btc_limits,
            lbtc_limits,
            btc_fees: btc_chain,
            lbtc_fees: lbtc_chain,
        })
    }
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
    // / (address, btc_amount)
    pub bip21: Option<String>,
    pub preimage_hash: String,
}
impl DecodedInvoice {
    /// Add boltz_url & chain for route hint check
    pub fn from_string(s: String, boltz_url: Option<String>) -> Result<Self, BoltzError> {
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
                let boltz_client = BoltzApiClientV2::new(&check_protocol(&boltz_url.unwrap()));
                match boltz_client.get_mrh_bip21(&s) {
                    Ok(r) => Some(r.bip21),
                    Err(_) => None,
                }
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
            bip21: bip21,
            preimage_hash: invoice.payment_hash().to_string(),
        })
    }
}

#[derive(Clone, PartialEq, Eq, Serialize, Deserialize)]
#[frb(dart_metadata=("freezed"))]
pub struct BtcSwapScriptStr {
    pub swap_type: SwapType,
    pub funding_addrs: Option<String>,
    pub hashlock: String,
    pub receiver_pubkey: String,
    pub locktime: u32,
    pub sender_pubkey: String,
    pub side: Option<Side>
}

impl BtcSwapScriptStr {
    #[frb(sync)]
    pub fn new(
        swap_type: SwapType,
        funding_addrs: Option<String>,
        hashlock: String,
        receiver_pubkey: String,
        locktime: u32,
        sender_pubkey: String,
        side: Option<Side>
    ) -> Self {
        BtcSwapScriptStr {
            swap_type,
            funding_addrs,
            hashlock,
            receiver_pubkey,
            locktime,
            sender_pubkey,
            side
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
            side: if self.side.is_some() {Some(self.side.unwrap().into())} else {None}
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
            side: if swap.side.is_some() {Some(swap.side.unwrap().into())} else {None}
        }
    }
}

#[derive(Clone, PartialEq, Eq, Serialize, Deserialize)]
#[frb(dart_metadata=("freezed"))]
pub struct LBtcSwapScriptStr {
    pub swap_type: SwapType,
    pub funding_addrs: Option<String>,
    pub hashlock: String,
    pub receiver_pubkey: String,
    pub locktime: u32,
    pub sender_pubkey: String,
    pub blinding_key: String,
    pub side: Option<Side>
}
impl LBtcSwapScriptStr {
    #[frb(sync)]
    pub fn new(
        swap_type: SwapType,
        funding_addrs: Option<String>,
        hashlock: String,
        receiver_pubkey: String,
        locktime: u32,
        sender_pubkey: String,
        blinding_key: String,
        side: Option<Side>
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
            side: if self.side.is_some() {Some(self.side.unwrap().into())} else {None}
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
            side: if swap.side.is_some() {Some(swap.side.unwrap().into())} else {None}
        }
    }
}

// #[cfg(test)]
// mod tests {
//     use boltz_client::swaps::boltz::BOLTZ_MAINNET_URL_V2;

//     use super::*;
//     #[test]
//     fn test_fetch_all_fees() {
//         let fees = AllFees::fetch(BOLTZ_MAINNET_URL_V2.to_owned());
//         println!("{:#?}", fees);
//     }
// }
