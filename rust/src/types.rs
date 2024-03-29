// network
// preimage
//
use boltz_client::{
    network::Chain as BChain, swaps::boltz::SwapType as BoltzSwapType, util::{error::{ErrorKind, S5Error}, secrets::{Preimage as BoltzPreImage, SwapKey}}, Bolt11Invoice, Keypair, Secp256k1, ZKKeyPair, ZKSecp256k1
};
// use crate::types::{KeyPair, PreImage, Network, SwapType};

#[frb(dart_metadata=("freezed"))]
#[derive(Clone)]
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
    pub fn new(
        mnemonic: String,
        network: Chain,
        index: u64,
        swap_type: SwapType,
    ) -> Result<Self, S5Error> {
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

// Impl into secp256k1::KeyPair
use boltz_client::util::secrets::Preimage;
use flutter_rust_bridge::frb;
use std::{convert::TryInto, string::ParseError, time::Duration};

#[frb(dart_metadata=("freezed"))]
#[derive(Clone)]
pub struct PreImage {
    pub value: String,
    pub sha256: String,
    pub hash160: String,
}

impl TryInto<Preimage> for PreImage {
    type Error = S5Error; // Use a more specific error type in a real application

    fn try_into(self) -> Result<Preimage, Self::Error> {
        if !self.value.is_empty() {
            Preimage::from_str(&self.value)
        } else {
            Preimage::from_sha256_str(&self.sha256)
        }
    }
}

impl PreImage {
    pub(crate) fn _new() -> Self {
        let preimage = BoltzPreImage::new();
        PreImage {
            value: preimage.to_string().unwrap(),
            sha256: preimage.sha256.to_string(),
            hash160: preimage.hash160.to_string(),
        }
    }
}

impl Into<PreImage> for BoltzPreImage {
    fn into(self) -> PreImage {
        PreImage {
            value: self.to_string().unwrap_or("".to_string()),
            sha256: self.sha256.to_string(),
            hash160: self.hash160.to_string(),
        }
    }
}

pub struct DecodedInvoice {
    pub msats: u64,
    pub expiry: u64, 
    pub expires_in: u64, 
    pub expires_at: u64, 
    pub is_expired: bool,
    pub network: String,
    pub cltv_exp_delta: u64
}
impl From<Bolt11Invoice> for DecodedInvoice {
    fn from(invoice: Bolt11Invoice) -> DecodedInvoice {
        DecodedInvoice {
            expiry: invoice.expiry_time().as_secs(),
            expires_in: invoice.duration_until_expiry().as_secs(), 
            expires_at: invoice.expires_at().unwrap_or(Duration::from_secs(0)).as_secs(), 
            is_expired: invoice.is_expired(),
            msats: invoice.amount_milli_satoshis().unwrap_or(0),
            cltv_exp_delta: invoice.min_final_cltv_expiry_delta(),
            network: invoice.network().to_string(),
        }
    }
}
#[frb(dart_metadata=("freezed"))]
#[derive(Clone, Copy, PartialEq, Eq)]
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

#[frb(dart_metadata=("freezed"))]
#[derive(Clone, Copy)]
pub enum Chain {
    Testnet,
    LiquidTestnet,
}

impl Into<BChain> for Chain {
    fn into(self) -> BChain {
        match self {
            Chain::Testnet => BChain::BitcoinTestnet,
            Chain::LiquidTestnet => BChain::LiquidTestnet,
        }
    }
}

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

#[frb(dart_metadata=("freezed"))]
pub struct Limits {
    pub minimal: u64,
    pub maximal: u64,
}

// 1. lockup (client) 2. [claim (boltz) | refund (client)]
#[frb(dart_metadata=("freezed"))]
pub struct SubmarineSwapFees {
    pub boltz_fees: u64,
    pub claim_fees: u64,
    pub lockup_fees_estimate: u64,
}

// 1. lockup (boltz) 2. [claim (client) | refund (boltz)]
#[frb(dart_metadata=("freezed"))]
pub struct ReverseSwapFees {
    pub boltz_fees: u64,
    pub lockup_fees: u64,
    pub claim_fees_estimate: u64,
}

#[frb(dart_metadata=("freezed"))]
pub struct BtcLnSwap {
    pub id: String,
    pub kind: SwapType,
    pub network: Chain,
    pub keys: KeyPair,
    pub preimage: PreImage,
    pub redeem_script: String,
    pub invoice: String,
    pub script_address: String,
    pub out_amount: u64,
    pub electrum_url: String,
    pub boltz_url: String,
}

impl BtcLnSwap {
    pub fn new(
        id: String,
        kind: SwapType,
        network: Chain,
        keys: KeyPair,
        preimage: PreImage,
        redeem_script: String,
        invoice: String,
        script_address: String,
        out_amount: u64,
        electrum_url: String,
        boltz_url: String,
    ) -> BtcLnSwap {
        BtcLnSwap {
            id,
            kind,
            network,
            keys,
            preimage,
            redeem_script,
            invoice,
            electrum_url,
            boltz_url,
            script_address,
            out_amount,
        }
    }
}

#[frb(dart_metadata=("freezed"))]
pub struct LbtcLnSwap {
    pub id: String,
    pub kind: SwapType,
    pub network: Chain,
    pub keys: KeyPair,
    pub preimage: PreImage,
    pub redeem_script: String,
    pub invoice: String,
    pub out_amount: u64,
    pub script_address: String,
    pub blinding_key: String,
    pub electrum_url: String,
    pub boltz_url: String,
}

impl LbtcLnSwap {
    pub fn new(
        id: String,
        kind: SwapType,
        network: Chain,
        keys: KeyPair,
        preimage: PreImage,
        redeem_script: String,
        invoice: String,
        out_amount: u64,
        out_address: String,
        blinding_key: String,
        electrum_url: String,
        boltz_url: String,
    ) -> LbtcLnSwap {
        LbtcLnSwap {
            id,
            kind,
            network,
            keys,
            preimage,
            redeem_script,
            invoice,
            electrum_url,
            boltz_url,
            out_amount,
            blinding_key,
            script_address: out_address,
        }
    }
}

#[frb(dart_metadata=("freezed"))]
pub struct BoltzError {
    pub kind: String,
    pub message: String,
}

impl BoltzError {
    pub fn _new(kind: String, message: String) -> Self {
        BoltzError {
            kind: kind.to_string(),
            message: message,
        }
    }
}

impl From<S5Error> for BoltzError {
    fn from(value: S5Error) -> Self {
        BoltzError {
            kind: value.kind.to_string(),
            message: value.message,
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn test_secrets() {
        let mnemonic = "bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon".to_string();
        let kps = KeyPair::new(mnemonic.clone(), Chain::Testnet, 0, SwapType::Submarine).unwrap();
        let expected_seckey = "9b496356fbb59d95656acc879a5d7a9169eb3d77e5b7c511aeb827925e5b49e9";
        assert_eq!(&kps.secret_key, expected_seckey);
        let kps = KeyPair::new(mnemonic.clone(), Chain::Testnet, 1, SwapType::Submarine).unwrap();
        let expected_seckey = "5416f1e024c191605502017d066786e294f841e711d3d437d13e9d27e40e066e";
        assert_eq!(&kps.secret_key, expected_seckey);
        let kps = KeyPair::new(mnemonic.clone(), Chain::Testnet, 0, SwapType::Reverse).unwrap();
        let expected_seckey = "a0a62dd7225288f41a741c293a3220035b4c71686dc34c01ec84cbe6ab11b4e1";
        assert_eq!(&kps.secret_key, expected_seckey);
        let kps = KeyPair::new(mnemonic.clone(), Chain::Testnet, 1, SwapType::Reverse).unwrap();
        let expected_seckey = "aecbc2bddfcd3fa6953d257a9f369dc20cdc66f2605c73efb4c91b90703506b6";
        assert_eq!(&kps.secret_key, expected_seckey);
    }
}
