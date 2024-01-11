// network
// preimage
// 
use boltz_client::{
    swaps::boltz::SwapType as BoltzSwapType,
    util::{derivation::ChildKeys, error::S5Error},
    util::preimage::Preimage as BoltzPreImage, network::electrum::BitcoinNetwork,
};
// use crate::types::{KeyPair, PreImage, Network, SwapType};

#[derive(Clone)]
pub struct KeyPair {
    pub secret_key: String,
    pub public_key: String,
}

impl KeyPair {
    pub fn new(mnemonic: String, network: Network, index: u64, swap_type: SwapType) -> Result<Self, S5Error> {
        match swap_type {
            SwapType::Submarine => {
                let child_keys = ChildKeys::from_submarine_account(&mnemonic, network.into(), index)?;
                Ok(KeyPair {
                    secret_key: child_keys.keypair.display_secret().to_string(),
                    public_key: child_keys.keypair.public_key().to_string(),
                })
            }
            SwapType::Reverse => {
                let child_keys = ChildKeys::from_reverse_account(&mnemonic, network.into(), index)?;
                Ok(KeyPair {
                    secret_key: child_keys.keypair.display_secret().to_string(),
                    public_key: child_keys.keypair.public_key().to_string(),
                })
            }
        }
    }
}

// Impl into secp256k1::KeyPair


#[derive(Clone)]
pub struct PreImage {
    pub value: String,
    pub sha256: String,
    pub hash160: String
}

impl PreImage {
    pub(crate) fn new() -> Self {
        let preimage = BoltzPreImage::new();
        PreImage{
            value: preimage.to_string().unwrap(),
            sha256: preimage.sha256.to_string(),
            hash160: preimage.hash160.to_string(),
        }
        
    }
}

impl Into<PreImage> for BoltzPreImage {
    fn into(self) -> PreImage {
        PreImage{
            value: self.to_string().unwrap_or("".to_string()),
            sha256: self.sha256.to_string(),
            hash160: self.hash160.to_string()
        }
    }
}


#[derive(Clone, PartialEq,Eq)]
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

#[derive(Clone)]
pub enum Network {
    Testnet,
    LiquidTestnet,
}

impl Into<BitcoinNetwork> for Network {
    fn into(self) -> BitcoinNetwork {
        match self {
            Network::Testnet => BitcoinNetwork::BitcoinTestnet,
            Network::LiquidTestnet => BitcoinNetwork::LiquidTestnet,
        }
    }
}

pub struct BtcLnSwap {
    pub id: String,
    pub kind: SwapType,
    pub network: Network,
    pub keys: KeyPair,
    pub preimage: PreImage,
    pub redeem_script:String,
    pub invoice: String,
    pub out_amount: u64,
    pub out_address: String,
    pub electrum_url: String,
    pub boltz_url: String,
}

impl BtcLnSwap {
    pub fn new(
        id: String,
        kind: SwapType,
        network: Network,
        keys: KeyPair,
        preimage: PreImage,
        redeem_script: String,
        invoice: String,
        out_amount: u64,
        out_address: String,
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
            out_amount,
            out_address,
        }
    }
}

pub struct LbtcLnSwap {
    pub id: String,
    pub kind: SwapType,
    pub network: Network,
    pub keys: KeyPair,
    pub preimage: PreImage,
    pub redeem_script:String,
    pub invoice: String,
    pub out_amount: u64,
    pub out_address: String,
    pub blinding_key: String,
    pub electrum_url: String,
    pub boltz_url: String,
}

impl LbtcLnSwap {
    pub fn new(
        id: String,
        kind: SwapType,
        network: Network,
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
            out_address,
        }
    }
}

pub struct BoltzError {
    pub kind: String,
    pub message: String,
}

impl BoltzError {
    pub fn new(kind: String, message: String) -> Self {
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
        let kps = KeyPair::new(mnemonic.clone(), Network::Testnet, 0, SwapType::Submarine).unwrap();
        let expected_seckey = "9b496356fbb59d95656acc879a5d7a9169eb3d77e5b7c511aeb827925e5b49e9";
        assert_eq!(&kps.secret_key, expected_seckey);
        let kps = KeyPair::new(mnemonic.clone(), Network::Testnet, 1, SwapType::Submarine).unwrap();
        let expected_seckey = "5416f1e024c191605502017d066786e294f841e711d3d437d13e9d27e40e066e";
        assert_eq!(&kps.secret_key, expected_seckey);
        let kps = KeyPair::new(mnemonic.clone(), Network::Testnet, 0, SwapType::Reverse).unwrap();
        let expected_seckey = "a0a62dd7225288f41a741c293a3220035b4c71686dc34c01ec84cbe6ab11b4e1";
        assert_eq!(&kps.secret_key, expected_seckey);
        let kps = KeyPair::new(mnemonic.clone(), Network::Testnet, 1, SwapType::Reverse).unwrap();
        let expected_seckey = "aecbc2bddfcd3fa6953d257a9f369dc20cdc66f2605c73efb4c91b90703506b6";
        assert_eq!(&kps.secret_key, expected_seckey);
    }
}
