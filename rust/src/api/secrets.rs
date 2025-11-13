use boltz_client::{
    network::Network as BoltzNetwork,
    util::secrets::{Preimage, SwapMasterKey as BoltzSwapMasterKey},
    Keypair, Secp256k1, ToHex,
};
use serde::{Deserialize, Serialize};
use std::str::FromStr;

use super::error::BoltzError;
use super::types::Network;

#[derive(Clone, PartialEq, Eq, Serialize, Deserialize)]
pub struct KeyPair {
    pub secret_key: String,
    pub public_key: String,
}

impl From<Keypair> for KeyPair {
    fn from(keypair: Keypair) -> Self {
        KeyPair {
            secret_key: keypair.display_secret().to_string(),
            public_key: keypair.public_key().to_string(),
        }
    }
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
#[derive(Clone, PartialEq, Eq, Serialize, Deserialize)]
pub struct SwapMasterKey {
    pub xprv: String,
    pub xpub: String,
    pub network: Network,
    pub mnemonic: String,
    pub fingerprint: String,
}

impl SwapMasterKey {
    pub fn create(
        wallet_mnemonic: String,
        wallet_passphrase: Option<String>,
        network: Network,
    ) -> Result<SwapMasterKey, BoltzError> {
        let boltz_network: BoltzNetwork = network.into();
        let boltz_swap_master_key = BoltzSwapMasterKey::new(
            &wallet_mnemonic,
            wallet_passphrase.as_deref(),
            boltz_network,
        )
        .map_err(|e| BoltzError::new("SwapMasterKey".to_string(), e.to_string()))?;
        Ok(SwapMasterKey {
            xprv: boltz_swap_master_key.xprv.to_string(),
            xpub: boltz_swap_master_key.get_master_xpub().to_string(),
            network,
            mnemonic: boltz_swap_master_key.mnemonic.to_string(),
            fingerprint: boltz_swap_master_key.fingerprint.to_string(),
        })
    }
}

impl TryInto<BoltzSwapMasterKey> for SwapMasterKey {
    type Error = BoltzError;

    fn try_into(self) -> Result<BoltzSwapMasterKey, Self::Error> {
        let boltz_network: BoltzNetwork = self.network.into();
        BoltzSwapMasterKey::new(&self.mnemonic, None, boltz_network)
            .map_err(|e| BoltzError::new("BoltzSwapMasterKey".to_string(), e.to_string()))
    }
}

#[derive(Clone, PartialEq, Eq, Serialize, Deserialize)]
pub struct PreImage {
    pub value: String,
    pub sha256: String,
    pub hash160: String,
}

impl PreImage {
    pub fn new(value: String, sha256: String, hash160: String) -> Self {
        PreImage {
            value,
            sha256,
            hash160,
        }
    }

    pub fn from_invoice_str(invoice: &str) -> Result<Self, BoltzError> {
        let boltz_preimage = Preimage::from_invoice_str(invoice)
            .map_err(|e| BoltzError::new("Preimage".to_string(), e.to_string()))?;
        Ok(PreImage {
            value: boltz_preimage.bytes.map(|b| b.to_hex()).unwrap_or_default(),
            sha256: boltz_preimage.sha256.to_string(),
            hash160: boltz_preimage.hash160.to_string(),
        })
    }
}

impl Into<Preimage> for PreImage {
    fn into(self) -> Preimage {
        Preimage::from_str(&self.value).expect("Failed to convert Preimage to BoltzPreimage")
    }
}

impl From<Preimage> for PreImage {
    fn from(boltz_preimage: Preimage) -> Self {
        PreImage {
            value: boltz_preimage.bytes.map(|b| b.to_hex()).unwrap_or_default(),
            sha256: boltz_preimage.sha256.to_string(),
            hash160: boltz_preimage.hash160.to_string(),
        }
    }
}
