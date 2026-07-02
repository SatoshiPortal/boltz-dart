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
        BoltzSwapMasterKey::from_mnemonic(&self.mnemonic, None, boltz_network)
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

impl TryInto<Preimage> for PreImage {
    type Error = BoltzError;

    fn try_into(self) -> Result<Preimage, Self::Error> {
        Preimage::from_str(&self.value)
            .map_err(|e| BoltzError::new("Preimage".to_string(), e.to_string()))
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

#[cfg(test)]
mod tests {
    use super::*;
    use boltz_client::ToHex;

    const WALLET_MNEMONIC: &str = "bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon";

    #[test]
    fn derives_index0_preimage_and_key_via_wrapper() {
        let smk = SwapMasterKey::create(WALLET_MNEMONIC.to_string(), None, Network::Mainnet)
            .expect("create master key");

        assert_eq!(
            smk.mnemonic,
            "velvet engage shaft effort clarify annual protect client only surround sock gain",
        );

        let inner: BoltzSwapMasterKey = smk.clone().try_into().expect("try_into");
        let keypair = inner.derive_swapkey(0).expect("derive index 0");
        let preimage = Preimage::from_swap_key(&keypair);

        assert_eq!(
            preimage.bytes.unwrap().to_hex(),
            "f19d42c70bf00267b6c5dcfe6e1094386f8c72389f1ced91e0132d1502bbd244",
        );

        let wrapped: PreImage = preimage.into();
        assert_eq!(
            wrapped.value,
            "f19d42c70bf00267b6c5dcfe6e1094386f8c72389f1ced91e0132d1502bbd244",
        );
    }

    #[test]
    fn swap_key_pubkey_matches_master_xpub_child() {
        use boltz_client::bitcoin::bip32::{ChildNumber, Xpub};
        use boltz_client::bitcoin::secp256k1::Secp256k1;

        let smk = SwapMasterKey::create(WALLET_MNEMONIC.to_string(), None, Network::Mainnet)
            .expect("create master key");
        let inner: BoltzSwapMasterKey = smk.clone().try_into().expect("try_into");
        let xpub = Xpub::from_str(&smk.xpub).expect("parse master xpub");
        let secp = Secp256k1::new();

        for index in [0u64, 1, 7, 100] {
            let swap_key = inner.derive_swapkey(index).expect("derive swap key");
            let child = xpub
                .derive_pub(
                    &secp,
                    &[ChildNumber::from_normal_idx(index as u32).unwrap()],
                )
                .expect("derive xpub child");
            assert_eq!(swap_key.public_key(), child.public_key,);
        }
    }

    #[test]
    fn distinct_indices_yield_distinct_keys_and_preimages() {
        let smk = SwapMasterKey::create(WALLET_MNEMONIC.to_string(), None, Network::Mainnet)
            .expect("create master key");
        let inner: BoltzSwapMasterKey = smk.try_into().expect("try_into");

        let k0 = inner.derive_swapkey(0).expect("k0");
        let k1 = inner.derive_swapkey(1).expect("k1");
        assert_ne!(k0.secret_key(), k1.secret_key());

        let p0 = Preimage::from_swap_key(&k0).bytes.unwrap();
        let p1 = Preimage::from_swap_key(&k1).bytes.unwrap();
        assert_ne!(p0, p1);
    }
}
