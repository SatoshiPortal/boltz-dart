use boltz::api::types::{Chain, Network};
use boltz_client::network::{BitcoinChain, Chain as CoreChain, LiquidChain};

#[test]
fn regtest_core_chains_round_trip_without_panicking() {
    for core in [
        CoreChain::Bitcoin(BitcoinChain::BitcoinRegtest),
        CoreChain::Liquid(LiquidChain::LiquidRegtest),
    ] {
        let chain = Chain::from(core.clone());
        assert!(Network::from(chain) == Network::Regtest);
        let restored: CoreChain = chain.into();
        assert!(restored == core);
    }
}

use boltz::api::secrets::KeyPair;
use boltz::api::types::{BtcSwapScriptStr, LBtcSwapScriptStr, PreImage};
use boltz::api::{
    btc_ln::BtcLnSwap,
    chain_swap::ChainSwap,
    lbtc_ln::LbtcLnSwap,
    secrets::SwapMasterKey,
    types::{ChainSwapDirection, RegtestNetworkProfile},
};
use boltz::util::ensure_network_url;
use serde::Deserialize;
#[derive(Clone, PartialEq, Eq, serde::Serialize, serde::Deserialize)]
struct Ce7ChainSwap {
    pub id: String,
    pub is_testnet: bool,
    pub direction: ChainSwapDirection,
    pub refund_keys: KeyPair,
    pub refund_index: u64,
    pub claim_keys: KeyPair,
    pub claim_index: u64,
    pub preimage: PreImage,
    pub btc_script_str: BtcSwapScriptStr,
    pub lbtc_script_str: LBtcSwapScriptStr,
    pub script_address: String,
    pub out_amount: u64,
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub expected_onchain_amount: Option<u64>,
    pub btc_electrum_url: String,
    pub lbtc_electrum_url: String,
    pub boltz_url: String,
    pub referral_id: Option<String>,
    pub blinding_key: String,
}

use serde_json::Value;

const MAINNET: &str = include_str!("fixtures/chain_swap_mainnet.json");
const TESTNET: &str = include_str!("fixtures/chain_swap_testnet.json");

#[derive(Deserialize)]
struct LegacyNetwork {
    is_testnet: bool,
}

#[tokio::test]
async fn production_chain_json_read_and_rewrite_matches_ce7_golden() {
    for (blob, network) in [(MAINNET, Network::Mainnet), (TESTNET, Network::Testnet)] {
        let legacy_blob: Ce7ChainSwap = serde_json::from_str(blob).unwrap();
        assert!(serde_json::to_string(&legacy_blob).unwrap().as_bytes() == blob.as_bytes());
        let swap = ChainSwap::from_json(blob).await.unwrap();
        assert!(swap.network == network);
        let encoded = swap.to_json().await.unwrap();
        assert!(encoded.as_bytes() == blob.as_bytes());
        let legacy: LegacyNetwork = serde_json::from_str(&encoded).unwrap();
        assert!(legacy.is_testnet == (network == Network::Testnet));
        assert!(
            serde_json::from_str::<Value>(&encoded).unwrap()
                == serde_json::from_str::<Value>(blob).unwrap()
        );
    }
}

fn regtest_blob() -> Value {
    let mut blob: Value = serde_json::from_str(MAINNET).unwrap();
    blob.as_object_mut().unwrap().remove("is_testnet");
    blob["network"] = "Regtest".into();
    let profile = RegtestNetworkProfile::localhost();
    blob["boltz_url"] = profile.boltz_url.clone().into();
    blob["btc_electrum_url"] = profile.btc_electrum_url.clone().into();
    blob["lbtc_electrum_url"] = profile.lbtc_electrum_url.clone().into();
    blob["regtest_profile"] = serde_json::to_value(&profile).unwrap();
    blob
}

#[tokio::test]
async fn regtest_json_round_trips_and_legacy_reader_refuses_it() {
    let blob = regtest_blob().to_string();
    let swap = ChainSwap::from_json(&blob).await.unwrap();
    assert!(swap.network == Network::Regtest);
    let encoded = swap.to_json().await.unwrap();
    assert!(serde_json::from_str::<LegacyNetwork>(&encoded).is_err());
    assert!(ChainSwap::from_json(&encoded).await.unwrap().network == Network::Regtest);
}

#[tokio::test]
async fn ambiguous_or_missing_network_json_is_rejected() {
    let mut blob = regtest_blob();
    blob["is_testnet"] = false.into();
    assert!(ChainSwap::from_json(&blob.to_string()).await.is_err());
    blob.as_object_mut().unwrap().remove("is_testnet");
    blob["network"] = "Testnet".into();
    assert!(ChainSwap::from_json(&blob.to_string()).await.is_err());
    blob.as_object_mut().unwrap().remove("network");
    assert!(ChainSwap::from_json(&blob.to_string()).await.is_err());
    for network in ["null", "false", "\"Unknown\""] {
        let mut blob = regtest_blob();
        blob["network"] = serde_json::from_str(network).unwrap();
        assert!(ChainSwap::from_json(&blob.to_string()).await.is_err());
    }
}

#[test]
fn local_profile_has_current_ports_and_tcp_electrum() {
    let profile = RegtestNetworkProfile::localhost();
    assert!(profile.boltz_url == "http://127.0.0.1:9001/v2");
    assert!(profile.btc_explorer_url == "http://127.0.0.1:3000");
    assert!(profile.lbtc_explorer_url == "http://127.0.0.1:3001");
    for (chain, port) in [
        (Chain::BitcoinRegtest, 50000),
        (Chain::LiquidRegtest, 50001),
    ] {
        let settings = profile.electrum_settings(chain).unwrap();
        assert!(settings.url == format!("127.0.0.1:{port}"));
        assert!(!settings.tls && !settings.validate_domain);
    }
    assert!(profile.electrum_settings(Chain::BitcoinTestnet).is_err());
    let mut remote = profile;
    remote.btc_electrum_url = "electrum.example:50000".into();
    assert!(remote.electrum_settings(Chain::BitcoinRegtest).is_err());
}

#[test]
fn regtest_http_requires_the_exact_explicit_profile_and_production_policy_is_unchanged() {
    for host in ["127.0.0.1", "localhost", "::1", "regtest.example"] {
        let profile = RegtestNetworkProfile::for_host(host.into()).unwrap();
        assert!(ensure_network_url(&profile.boltz_url, Network::Regtest, Some(&profile)).is_ok());
        assert!(
            ensure_network_url(&profile.btc_explorer_url, Network::Regtest, Some(&profile))
                .is_err()
        );
        assert!(ensure_network_url(
            &format!("{}/wrong", profile.boltz_url),
            Network::Regtest,
            Some(&profile)
        )
        .is_err());
    }
    for url in [
        "http://example.com/v2",
        "https://api.boltz.exchange/v2",
        "http://localhost.example/v2",
        "http://localhost@remote.example/v2",
        "http://127.0.0.1:9001/v2?redirect=remote",
        "http://127.0.0.1:9001/v2#fragment",
        "ftp://localhost/v2",
    ] {
        assert!(ensure_network_url(url, Network::Regtest, None).is_err());
    }
    for host in [
        "http://regtest.example",
        "regtest.example/path",
        "user@regtest.example",
        "regtest.example:9001",
        "",
        "bad..host",
    ] {
        assert!(RegtestNetworkProfile::for_host(host.into()).is_err());
    }
    assert!(ensure_network_url("http://example.com/v2", Network::Testnet, None).is_ok());
    assert!(ensure_network_url("http://127.0.0.1:9001/v2", Network::Mainnet, None).is_err());
    assert!(
        ensure_network_url("api.boltz.exchange/v2", Network::Mainnet, None).unwrap()
            == "https://api.boltz.exchange/v2"
    );
}

fn invalid_key(network: Network) -> SwapMasterKey {
    SwapMasterKey {
        xprv: String::new(),
        xpub: String::new(),
        mnemonic: String::new(),
        fingerprint: String::new(),
        network,
    }
}

#[tokio::test]
async fn six_swap_pairs_reject_cross_network_keys_before_derivation_or_io() {
    let p = RegtestNetworkProfile::localhost();
    let key = invalid_key(Network::Testnet);
    let btc_sub = BtcLnSwap::new_submarine(
        key.clone(),
        0,
        String::new(),
        Chain::BitcoinRegtest,
        p.btc_electrum_url.clone(),
        p.boltz_url.clone(),
        None,
        None,
    )
    .await;
    let lbtc_sub = LbtcLnSwap::new_submarine(
        key.clone(),
        0,
        String::new(),
        Chain::LiquidRegtest,
        p.lbtc_electrum_url.clone(),
        p.boltz_url.clone(),
        None,
        None,
    )
    .await;
    let btc_rev = BtcLnSwap::new_reverse(
        key.clone(),
        0,
        1000,
        None,
        Chain::BitcoinRegtest,
        p.btc_electrum_url.clone(),
        p.boltz_url.clone(),
        None,
        None,
        None,
    )
    .await;
    let lbtc_rev = LbtcLnSwap::new_reverse(
        key.clone(),
        0,
        1000,
        None,
        Chain::LiquidRegtest,
        p.lbtc_electrum_url.clone(),
        p.boltz_url.clone(),
        None,
        None,
        None,
    )
    .await;
    assert!(btc_sub.err().unwrap().kind == "Network");
    assert!(lbtc_sub.err().unwrap().kind == "Network");
    assert!(btc_rev.err().unwrap().kind == "Network");
    assert!(lbtc_rev.err().unwrap().kind == "Network");
    for direction in [ChainSwapDirection::BtcToLbtc, ChainSwapDirection::LbtcToBtc] {
        let result = ChainSwap::new_swap(
            direction,
            key.clone(),
            0,
            1000,
            Network::Regtest,
            p.btc_electrum_url.clone(),
            p.lbtc_electrum_url.clone(),
            p.boltz_url.clone(),
            None,
            None,
        )
        .await;
        assert!(result.err().unwrap().kind == "Network");
    }
}

#[tokio::test]
async fn rehydrated_regtest_cannot_contact_production_endpoint() {
    let mut blob = regtest_blob();
    blob["boltz_url"] = "https://api.boltz.exchange/v2".into();
    let swap = ChainSwap::from_json(&blob.to_string()).await.unwrap();
    assert!(swap.get_user_lockup().await.err().unwrap().kind == "Network");
    assert!(swap.get_server_lockup().await.err().unwrap().kind == "Network");
}

#[tokio::test]
async fn typed_quotes_validate_the_local_profile_on_each_call() {
    use boltz::api::fees::Fees;
    let profile = RegtestNetworkProfile::localhost();
    let mut quotes = Fees::for_regtest(profile.clone()).unwrap();
    assert!(quotes.regtest_profile.is_some());
    quotes.boltz_url = "https://api.boltz.exchange/v2".into();
    assert!(quotes.submarine().await.err().unwrap().kind == "Network");
    assert!(quotes.reverse().await.err().unwrap().kind == "Network");
    assert!(quotes.chain().await.err().unwrap().kind == "Network");
    let mut invalid_profile = profile;
    invalid_profile.boltz_url = "http://remote.example/v2".into();
    assert!(Fees::for_regtest(invalid_profile).is_err());
    assert!(Fees::new("http://example.com/v2".into())
        .regtest_profile
        .is_none());
}

#[tokio::test]
async fn duplicate_network_fields_are_rejected_in_raw_json() {
    let duplicate_legacy = MAINNET.replace(
        "\"is_testnet\":false",
        "\"is_testnet\":false,\"is_testnet\":false",
    );
    assert!(ChainSwap::from_json(&duplicate_legacy).await.is_err());
    let regtest = regtest_blob().to_string();
    let duplicate_concrete = regtest.replace(
        "\"network\":\"Regtest\"",
        "\"network\":\"Regtest\",\"network\":\"Regtest\"",
    );
    assert!(ChainSwap::from_json(&duplicate_concrete).await.is_err());
    let legacy_and_null = MAINNET.replacen('{', "{\"network\":null,", 1);
    assert!(ChainSwap::from_json(&legacy_and_null).await.is_err());
}

fn invoice_for(currency: boltz_client::lightning_invoice::Currency) -> String {
    use boltz_client::{
        bitcoin::{
            hashes::{sha256, Hash},
            secp256k1::{Secp256k1, SecretKey},
        },
        lightning_invoice::{InvoiceBuilder, PaymentSecret},
    };
    let key = SecretKey::from_slice(&[7u8; 32]).unwrap();
    InvoiceBuilder::new(currency)
        .description("Synthetic network validation".into())
        .payment_hash(sha256::Hash::hash(&[1u8; 32]))
        .payment_secret(PaymentSecret([2u8; 32]))
        .duration_since_epoch(std::time::Duration::from_secs(1))
        .min_final_cltv_expiry_delta(18)
        .build_signed(|hash| Secp256k1::new().sign_ecdsa_recoverable(hash, &key))
        .unwrap()
        .to_string()
}

#[tokio::test]
async fn submarine_currency_and_reverse_destination_are_checked_before_key_parsing() {
    use boltz_client::lightning_invoice::Currency;
    let p = RegtestNetworkProfile::localhost();
    for currency in [
        Currency::Bitcoin,
        Currency::BitcoinTestnet,
        Currency::Regtest,
    ] {
        let invoice = invoice_for(currency.clone());
        let error = BtcLnSwap::new_submarine(
            invalid_key(Network::Regtest),
            0,
            invoice.clone(),
            Chain::BitcoinRegtest,
            p.btc_electrum_url.clone(),
            p.boltz_url.clone(),
            None,
            None,
        )
        .await
        .err()
        .unwrap();
        assert!((error.kind == "Network") == (currency != Currency::Regtest));
        let error = LbtcLnSwap::new_submarine(
            invalid_key(Network::Regtest),
            0,
            invoice,
            Chain::LiquidRegtest,
            p.lbtc_electrum_url.clone(),
            p.boltz_url.clone(),
            None,
            None,
        )
        .await
        .err()
        .unwrap();
        assert!((error.kind == "Network") == (currency != Currency::Regtest));
    }
    let error = BtcLnSwap::new_reverse(
        invalid_key(Network::Regtest),
        0,
        1000,
        Some("malformed".into()),
        Chain::BitcoinRegtest,
        p.btc_electrum_url.clone(),
        p.boltz_url.clone(),
        None,
        None,
        None,
    )
    .await
    .err()
    .unwrap();
    assert!(error.kind == "Network");
    let error = LbtcLnSwap::new_reverse(
        invalid_key(Network::Regtest),
        0,
        1000,
        Some("malformed".into()),
        Chain::LiquidRegtest,
        p.lbtc_electrum_url.clone(),
        p.boltz_url.clone(),
        None,
        None,
        None,
    )
    .await
    .err()
    .unwrap();
    assert!(error.kind == "Network");
}

#[tokio::test]
async fn host_profile_rejects_another_host_before_key_parsing() {
    let profile = RegtestNetworkProfile::for_host("regtest.example".into()).unwrap();
    let other = RegtestNetworkProfile::for_host("other.example".into()).unwrap();
    let error = BtcLnSwap::new_reverse(
        invalid_key(Network::Regtest),
        0,
        1000,
        None,
        Chain::BitcoinRegtest,
        profile.btc_electrum_url.clone(),
        other.boltz_url,
        None,
        None,
        Some(profile.clone()),
    )
    .await
    .err()
    .unwrap();
    assert!(error.kind == "Network");
    let error = BtcLnSwap::new_reverse(
        invalid_key(Network::Regtest),
        0,
        1000,
        None,
        Chain::BitcoinRegtest,
        profile.btc_electrum_url.clone(),
        profile.boltz_url.clone(),
        None,
        None,
        Some(profile),
    )
    .await
    .err()
    .unwrap();
    assert!(error.kind != "Network");
}

#[tokio::test]
async fn restore_validates_electrum_profile_before_contacting_boltz() {
    use boltz::api::restore::{restore_chain_swaps, restore_ln_btc_swaps, restore_ln_lbtc_swaps};
    let p = RegtestNetworkProfile::for_host("regtest.example".into()).unwrap();
    let key = invalid_key(Network::Regtest);
    let error = restore_ln_btc_swaps(
        key.clone(),
        "wrong.example:50000".into(),
        p.boltz_url.clone(),
        Some(p.clone()),
    )
    .await
    .err()
    .unwrap();
    assert!(error.kind == "Network");
    let error = restore_ln_lbtc_swaps(
        key.clone(),
        p.btc_electrum_url.clone(),
        p.boltz_url.clone(),
        Some(p.clone()),
    )
    .await
    .err()
    .unwrap();
    assert!(error.kind == "Network");
    let error = restore_chain_swaps(
        key,
        p.btc_electrum_url.clone(),
        "wrong.example:50001".into(),
        p.boltz_url.clone(),
        Some(p),
    )
    .await
    .err()
    .unwrap();
    assert!(error.kind == "Network");
}

#[tokio::test]
async fn invoice_mrh_lookup_cannot_escape_the_captured_profile() {
    use boltz::api::invoice::DecodedInvoice;
    use boltz_client::lightning_invoice::Currency;
    let p = RegtestNetworkProfile::for_host("regtest.example".into()).unwrap();
    let error = DecodedInvoice::from_string(
        invoice_for(Currency::Regtest),
        Some("http://other.example:9001/v2".into()),
        Some(p.clone()),
    )
    .await
    .err()
    .unwrap();
    assert!(error.kind == "Network");
    let error = DecodedInvoice::from_string(
        invoice_for(Currency::BitcoinTestnet),
        Some(p.boltz_url.clone()),
        Some(p.clone()),
    )
    .await
    .err()
    .unwrap();
    assert!(error.kind == "Network");
    assert!(
        DecodedInvoice::from_string(invoice_for(Currency::Regtest), None, Some(p))
            .await
            .is_ok()
    );
}

#[tokio::test]
async fn custom_host_profile_round_trip_preserves_every_endpoint() {
    let profile = RegtestNetworkProfile::for_host("regtest.example".into()).unwrap();
    let mut blob = regtest_blob();
    blob["boltz_url"] = profile.boltz_url.clone().into();
    blob["btc_electrum_url"] = profile.btc_electrum_url.clone().into();
    blob["lbtc_electrum_url"] = profile.lbtc_electrum_url.clone().into();
    blob["regtest_profile"] = serde_json::to_value(&profile).unwrap();
    let swap = ChainSwap::from_json(&blob.to_string()).await.unwrap();
    assert!(swap.regtest_profile.as_ref() == Some(&profile));
    let encoded = swap.to_json().await.unwrap();
    let restored = ChainSwap::from_json(&encoded).await.unwrap();
    assert!(restored.regtest_profile.as_ref() == Some(&profile));
}
