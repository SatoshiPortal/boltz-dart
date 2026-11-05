use boltz_client::{
    bitcoin::{bip32::Xpriv, Network as BitcoinNetwork},
    network::Network as BoltzNetwork,
    util::secrets::{Preimage, SwapMasterKey as BoltzSwapMasterKey},
    Keypair, Secp256k1, ToHex,
};
use serde::{Deserialize, Serialize};
use std::str::FromStr;
use zeroize::Zeroizing;

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

/// BIP85 index of the swap mnemonic; must match boltz-client's `SwapMasterKey::new`.
const SWAP_MNEMONIC_BIP85_INDEX: u32 = 26589;
/// Word count of the BIP85 swap mnemonic; must match boltz-client's `SwapMasterKey::new`.
const SWAP_MNEMONIC_WORD_COUNT: u32 = 12;
/// BIP32 seed length bounds, in bytes (128 to 512 bits).
const MIN_SEED_LEN: usize = 16;
const MAX_SEED_LEN: usize = 64;

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
        Ok(Self::from_boltz(boltz_swap_master_key, network))
    }

    /// Same swap master key as `create`, from the wallet's BIP39 seed
    /// (`mnemonic.to_seed(passphrase)`) instead of its words, so mnemonics in
    /// any BIP39 language work. The passphrase is already part of the seed.
    /// The seed is zeroized once used; the returned swap mnemonic stays English.
    pub fn create_from_seed(
        wallet_seed: Vec<u8>,
        network: Network,
    ) -> Result<SwapMasterKey, BoltzError> {
        let wallet_seed = Zeroizing::new(wallet_seed);
        if !(MIN_SEED_LEN..=MAX_SEED_LEN).contains(&wallet_seed.len()) {
            return Err(BoltzError::new(
                "InvalidSeedLength".to_string(),
                format!(
                    "wallet seed must be {MIN_SEED_LEN} to {MAX_SEED_LEN} bytes, got {}",
                    wallet_seed.len()
                ),
            ));
        }
        let boltz_network: BoltzNetwork = network.into();
        let secp = Secp256k1::new();
        let root = Xpriv::new_master(BitcoinNetwork::from(boltz_network), &wallet_seed)
            .map_err(|e| BoltzError::new("SwapMasterKey".to_string(), e.to_string()))?;
        let swap_mnemonic = Zeroizing::new(
            bip85_extended::mnemonic::to_mnemonic(
                &secp,
                &root,
                SWAP_MNEMONIC_WORD_COUNT,
                SWAP_MNEMONIC_BIP85_INDEX,
            )
            .map_err(|e| BoltzError::new("SwapMasterKey".to_string(), e.to_string()))?
            .to_string(),
        );
        let boltz_swap_master_key =
            BoltzSwapMasterKey::from_mnemonic(&swap_mnemonic, None, boltz_network)
                .map_err(|e| BoltzError::new("SwapMasterKey".to_string(), e.to_string()))?;
        Ok(Self::from_boltz(boltz_swap_master_key, network))
    }

    fn from_boltz(boltz_swap_master_key: BoltzSwapMasterKey, network: Network) -> SwapMasterKey {
        SwapMasterKey {
            xprv: boltz_swap_master_key.xprv.to_string(),
            xpub: boltz_swap_master_key.get_master_xpub().to_string(),
            network,
            mnemonic: boltz_swap_master_key.mnemonic.to_string(),
            fingerprint: boltz_swap_master_key.fingerprint.to_string(),
        }
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

    const ENGLISH_VECTOR_MNEMONIC: &str =
        "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about";

    fn seed_of(mnemonic: &str, passphrase: &str) -> Vec<u8> {
        bip39::Mnemonic::parse_normalized(mnemonic)
            .expect("parse english mnemonic")
            .to_seed(passphrase)
            .to_vec()
    }

    #[test]
    fn create_from_seed_matches_create_for_english_mnemonics() {
        let cases = [
            (WALLET_MNEMONIC, None),
            (ENGLISH_VECTOR_MNEMONIC, None),
            (ENGLISH_VECTOR_MNEMONIC, Some("TREZOR")),
        ];
        for network in [Network::Mainnet, Network::Testnet, Network::Regtest] {
            for (mnemonic, passphrase) in cases {
                let from_words = SwapMasterKey::create(
                    mnemonic.to_string(),
                    passphrase.map(str::to_string),
                    network,
                )
                .expect("create from words");
                let from_seed = SwapMasterKey::create_from_seed(
                    seed_of(mnemonic, passphrase.unwrap_or("")),
                    network,
                )
                .expect("create from seed");
                assert!(from_words == from_seed, "{mnemonic} / {passphrase:?}");
            }
        }
    }

    #[test]
    fn create_from_seed_keeps_the_documented_swap_mnemonic() {
        let smk = SwapMasterKey::create_from_seed(seed_of(WALLET_MNEMONIC, ""), Network::Mainnet)
            .expect("create from seed");
        assert_eq!(
            smk.mnemonic,
            "velvet engage shaft effort clarify annual protect client only surround sock gain",
        );
    }

    // Official BIP39 Japanese vector (entropy 0x00 * 16, passphrase
    // "㍍ガバヴァぱばぐゞちぢ十人十色"), as checked by rust-bip39's own tests.
    const JAPANESE_VECTOR_MNEMONIC: &str = "あいこくしん　あいこくしん　あいこくしん　あいこくしん　あいこくしん　あいこくしん　あいこくしん　あいこくしん　あいこくしん　あいこくしん　あいこくしん　あおぞら";
    const JAPANESE_VECTOR_SEED: &str = "a262d6fb6122ecf45be09c50492b31f92e9beb7d9a845987a02cefda57a15f9c467a17872029a9e92299b5cbdf306e3a0ee620245cbd508959b6cb7ca637bd55";

    #[test]
    fn create_from_seed_accepts_a_non_english_wallet() {
        // The words entry point only knows English.
        assert!(SwapMasterKey::create(
            JAPANESE_VECTOR_MNEMONIC.to_string(),
            Some("㍍ガバヴァぱばぐゞちぢ十人十色".to_string()),
            Network::Mainnet,
        )
        .is_err());

        let seed = hex::decode(JAPANESE_VECTOR_SEED).expect("hex seed");
        let smk = SwapMasterKey::create_from_seed(seed.clone(), Network::Mainnet)
            .expect("create from japanese seed");
        let again = SwapMasterKey::create_from_seed(seed, Network::Mainnet).expect("create again");
        assert!(smk == again);
        // Cross-checked once against `create` with the Japanese words, built
        // with the `japanese` features of bip39 and bip85_extended enabled.
        assert_eq!(
            smk.mnemonic,
            "lounge narrow slow notice pistol pond brush tool blind begin narrow wedding",
        );
        assert_eq!(
            smk.xpub,
            "xpub6EawzQcjWfaU1Mqa332QtMDRZ24t6MMWoxVdjVwAcjF5HCsBiuNzfN87DoRfuyqf4HG9jEGAsxNoYDhPiN4DhxvMx9Q2BeDeiH4eH1gFY1K",
        );

        let inner: BoltzSwapMasterKey = smk.clone().try_into().expect("try_into");
        assert_eq!(inner.get_master_xpub().to_string(), smk.xpub);
    }

    #[test]
    fn create_from_seed_rejects_out_of_range_lengths() {
        for len in [0usize, 15, 65, 128] {
            let err = SwapMasterKey::create_from_seed(vec![7u8; len], Network::Mainnet)
                .err()
                .expect("length must be rejected");
            assert_eq!(err.kind, "InvalidSeedLength", "len {len}");
        }
        for len in [16usize, 32, 64] {
            assert!(
                SwapMasterKey::create_from_seed(vec![7u8; len], Network::Mainnet).is_ok(),
                "len {len}"
            );
        }
    }
}
