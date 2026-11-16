use std::sync::Once;

static CRYPTO_PROVIDER_INIT: Once = Once::new();

/// Installs the `ring` rustls crypto provider once, before any electrum TLS
/// connection is opened. Both `ring` and `aws-lc-rs` can be linked transitively
/// (notably in the bull_sdk aggregate), and rustls 0.23 aborts the process when
/// it can't auto-pick a default provider. Installing `ring` explicitly avoids
/// that. Safe to call repeatedly and from multiple threads.
pub(crate) fn ensure_crypto_provider() {
    CRYPTO_PROVIDER_INIT.call_once(|| {
        let _ = rustls::crypto::ring::default_provider().install_default();
    });
}

// Mempool API URLs for checking transaction outspends
pub const MEMPOOL_BITCOIN_URL: &str = "https://mempool.space/api";
pub const MEMPOOL_BITCOIN_TESTNET_URL: &str = "https://mempool.space/testnet/api";
pub const MEMPOOL_LIQUID_URL: &str = "https://liquid.network/api";
pub const MEMPOOL_LIQUID_TESTNET_URL: &str = "https://liquid.network/liquidtestnet/api";

/// Plaintext (http://) Boltz URLs are a local-development affordance and
/// are only accepted for test networks; on mainnet an https connection is
/// mandatory.
pub fn ensure_boltz_url(url: &str, is_testnet: bool) -> Result<String, String> {
    let full = ensure_http_prefix(url);
    if !is_testnet && full.starts_with("http://") {
        return Err(format!(
            "plaintext boltz url ({full}) is only allowed on test networks"
        ));
    }
    Ok(full)
}

/// Upgrades a plaintext scheme to https without failing — for infallible
/// recovery constructors that cannot return an error.
pub fn force_https(url: &str) -> String {
    let full = ensure_http_prefix(url);
    match full.strip_prefix("http://") {
        Some(rest) => format!("https://{rest}"),
        None => full,
    }
}

pub fn ensure_http_prefix(url: &str) -> String {
    let protocols = ["http://", "https://"];
    for protocol in protocols.iter() {
        if url.starts_with(protocol) {
            return url.to_string();
        }
    }
    format!("https://{}", url)
}

pub fn strip_protocol_prefix(url: &str) -> String {
    let protocols = ["tcp://", "ssl://"];
    for protocol in protocols.iter() {
        if url.starts_with(protocol) {
            return url.split("://").last().unwrap_or(url).to_string();
        }
    }
    url.to_string()
}

pub fn get_electrum_configs(
    electrum_settings: Option<crate::api::types::ElectrumSettings>,
    default_electrum_url: &str,
) -> (String, bool, bool, u8) {
    // Single funnel that every electrum client construction passes through, so
    // this is the one place guaranteed to run before an electrum TLS handshake.
    ensure_crypto_provider();
    if let Some(settings) = electrum_settings {
        (
            strip_protocol_prefix(&settings.url),
            settings.validate_domain,
            settings.tls,
            settings.timeout,
        )
    } else {
        (default_electrum_url.to_string(), true, true, 10)
    }
}

#[cfg(test)]
mod tests {
    use super::{ensure_boltz_url, force_https};

    #[test]
    fn plaintext_url_is_testnet_only() {
        assert_eq!(
            ensure_boltz_url("http://127.0.0.1:9001", true).unwrap(),
            "http://127.0.0.1:9001"
        );
        assert!(ensure_boltz_url("http://127.0.0.1:9001", false).is_err());
        assert_eq!(
            ensure_boltz_url("api.boltz.exchange/v2", false).unwrap(),
            "https://api.boltz.exchange/v2"
        );
        assert_eq!(
            ensure_boltz_url("https://api.boltz.exchange/v2", false).unwrap(),
            "https://api.boltz.exchange/v2"
        );
    }

    #[test]
    fn force_https_upgrades_plaintext() {
        assert_eq!(force_https("http://host:9001"), "https://host:9001");
        assert_eq!(force_https("https://host"), "https://host");
        assert_eq!(force_https("host"), "https://host");
    }
}

pub(crate) fn regtest_profile(
    profile: Option<&crate::api::types::RegtestNetworkProfile>,
) -> Result<crate::api::types::RegtestNetworkProfile, crate::api::error::BoltzError> {
    let profile = profile
        .cloned()
        .unwrap_or_else(crate::api::types::RegtestNetworkProfile::localhost);
    profile.validate()?;
    Ok(profile)
}

pub(crate) fn capture_regtest_profile(
    network: crate::api::types::Network,
    profile: Option<crate::api::types::RegtestNetworkProfile>,
) -> Result<Option<crate::api::types::RegtestNetworkProfile>, crate::api::error::BoltzError> {
    if network == crate::api::types::Network::Regtest {
        return Ok(Some(regtest_profile(profile.as_ref())?));
    }
    if profile.is_some() {
        return Err(crate::api::error::BoltzError::new(
            "Network".into(),
            "A regtest profile requires the regtest network".into(),
        ));
    }
    Ok(None)
}

/// Production keeps its historical policy; regtest accepts the exact captured endpoint.
pub fn ensure_network_url(
    url: &str,
    network: crate::api::types::Network,
    profile: Option<&crate::api::types::RegtestNetworkProfile>,
) -> Result<String, String> {
    use crate::api::types::Network;
    if network != Network::Regtest {
        if profile.is_some() {
            return Err("A regtest profile requires the regtest network".into());
        }
        return ensure_boltz_url(url, network == Network::Testnet);
    }
    let profile = regtest_profile(profile).map_err(|e| e.message)?;
    if url != profile.boltz_url {
        return Err("Boltz endpoint does not match the regtest profile".into());
    }
    Ok(url.to_owned())
}

pub(crate) fn explorer_url(
    url: &str,
    chain: crate::api::types::Chain,
    profile: Option<&crate::api::types::RegtestNetworkProfile>,
) -> Result<String, crate::api::error::BoltzError> {
    use crate::api::{
        error::BoltzError,
        types::{Chain, Network},
    };
    if Network::from(chain) != Network::Regtest {
        return ensure_network_url(url, chain.into(), profile)
            .map_err(|e| BoltzError::new("Network".into(), e));
    }
    let profile = regtest_profile(profile)?;
    let expected = if chain == Chain::BitcoinRegtest {
        profile.btc_explorer_url
    } else {
        profile.lbtc_explorer_url
    };
    if url != expected {
        return Err(BoltzError::new(
            "Network".into(),
            "Explorer endpoint does not match the regtest chain profile".into(),
        ));
    }
    Ok(url.to_owned())
}

/// Main/test hydrated objects retain their existing transport behavior.
pub(crate) fn swap_url(
    url: &str,
    network: crate::api::types::Network,
    profile: Option<&crate::api::types::RegtestNetworkProfile>,
) -> Result<String, crate::api::error::BoltzError> {
    if network == crate::api::types::Network::Regtest {
        ensure_network_url(url, network, profile)
            .map_err(|e| crate::api::error::BoltzError::new("Network".into(), e))
    } else {
        if profile.is_some() {
            return Err(crate::api::error::BoltzError::new(
                "Network".into(),
                "A regtest profile requires the regtest network".into(),
            ));
        }
        Ok(ensure_http_prefix(url))
    }
}

/// Arguments in Electrum core constructor order. Keep the existing main/test
/// boolean mapping; regtest passes TLS and domain validation explicitly.
pub(crate) fn get_network_electrum_configs(
    settings: Option<crate::api::types::ElectrumSettings>,
    default_url: &str,
    chain: crate::api::types::Chain,
    profile: Option<&crate::api::types::RegtestNetworkProfile>,
) -> Result<(String, bool, bool, u8), crate::api::error::BoltzError> {
    use crate::api::{
        error::BoltzError,
        types::{Chain, Network},
    };
    if Network::from(chain) != Network::Regtest {
        if profile.is_some() {
            return Err(BoltzError::new(
                "Network".into(),
                "A regtest profile requires the regtest network".into(),
            ));
        }
        return Ok(get_electrum_configs(settings, default_url));
    }
    ensure_crypto_provider();
    let profile = regtest_profile(profile)?;
    let expected = if chain == Chain::BitcoinRegtest {
        profile.btc_electrum_url
    } else {
        profile.lbtc_electrum_url
    };
    if strip_protocol_prefix(default_url) != expected {
        return Err(BoltzError::new(
            "Network".into(),
            "Electrum endpoint does not match the regtest chain profile".into(),
        ));
    }
    match settings {
        Some(settings) if strip_protocol_prefix(&settings.url) == expected => Ok((
            expected,
            settings.tls,
            settings.validate_domain,
            settings.timeout,
        )),
        Some(_) => Err(BoltzError::new(
            "Network".into(),
            "Electrum override does not match the regtest profile".into(),
        )),
        None => Ok((expected, false, false, 10)),
    }
}

/// Currency is checked before a regtest submarine derives a key or contacts Boltz.
pub(crate) fn validate_regtest_invoice(
    invoice: &str,
    network: crate::api::types::Network,
) -> Result<(), crate::api::error::BoltzError> {
    use crate::api::{error::BoltzError, types::Network};
    use std::str::FromStr;
    if network != Network::Regtest {
        return Ok(());
    }
    let invoice = boltz_client::Bolt11Invoice::from_str(invoice)
        .map_err(|_| BoltzError::new("Network".into(), "Invalid regtest BOLT11 invoice".into()))?;
    if invoice.network() != boltz_client::bitcoin::Network::Regtest {
        return Err(BoltzError::new(
            "Network".into(),
            "BOLT11 invoice is not regtest".into(),
        ));
    }
    Ok(())
}

/// The invoice returned by reverse creation is checked before it enters a swap.
pub(crate) fn reverse_invoice(
    invoice: Option<&str>,
    chain: crate::api::types::Chain,
) -> Result<String, crate::api::error::BoltzError> {
    let invoice = invoice.unwrap_or_default();
    validate_regtest_invoice(invoice, chain.into())?;
    Ok(invoice.to_owned())
}

/// An address from a different network cannot be used by a regtest operation.
pub(crate) fn validate_regtest_address(
    chain: crate::api::types::Chain,
    address: &str,
) -> Result<(), crate::api::error::BoltzError> {
    use crate::api::{error::BoltzError, types::Chain};
    use std::str::FromStr;
    let valid = match chain {
        Chain::BitcoinRegtest => boltz_client::Address::from_str(address).is_ok_and(|address| {
            address.is_valid_for_network(boltz_client::bitcoin::Network::Regtest)
        }),
        Chain::LiquidRegtest => {
            boltz_client::ElementsAddress::from_str(address).is_ok_and(|address| {
                address.params == &boltz_client::elements::AddressParams::ELEMENTS
            })
        }
        _ => return Ok(()),
    };
    if valid {
        Ok(())
    } else {
        Err(BoltzError::new(
            "Network".into(),
            "Address does not match the regtest chain".into(),
        ))
    }
}

pub(crate) fn boltz_api_client(
    url: &str,
    network: crate::api::types::Network,
    profile: Option<&crate::api::types::RegtestNetworkProfile>,
) -> Result<boltz_client::swaps::boltz::BoltzApiClientV2, crate::api::error::BoltzError> {
    let url = swap_url(url, network, profile)?;
    if network == crate::api::types::Network::Regtest {
        let client = regtest_http_client()?;
        Ok(boltz_client::swaps::boltz::BoltzApiClientV2::with_client(
            url, client, None,
        ))
    } else {
        Ok(boltz_client::swaps::boltz::BoltzApiClientV2::new(url, None))
    }
}

/// This client is only used after an explicit regtest profile was checked.
pub(crate) fn regtest_http_client() -> Result<reqwest::Client, crate::api::error::BoltzError> {
    reqwest::Client::builder()
        .redirect(reqwest::redirect::Policy::none())
        .no_proxy()
        .build()
        .map_err(|_| {
            crate::api::error::BoltzError::new(
                "Network".into(),
                "Could not build regtest HTTP client".into(),
            )
        })
}

#[cfg(test)]
mod regtest_tests {
    use super::*;
    use crate::api::types::Chain;

    #[test]
    fn regtest_default_electrum_is_local_tcp_and_production_defaults_unchanged() {
        let (_, domain, tls, timeout) =
            get_network_electrum_configs(None, "127.0.0.1:50000", Chain::BitcoinRegtest, None)
                .unwrap();
        assert!(!domain && !tls && timeout == 10);
        let (_, domain, tls, _) = get_network_electrum_configs(
            None,
            "electrum.example:50002",
            Chain::BitcoinTestnet,
            None,
        )
        .unwrap();
        assert!(domain && tls);
        assert!(get_network_electrum_configs(
            None,
            "remote.example:50000",
            Chain::BitcoinRegtest,
            None
        )
        .is_err());
        assert!(get_network_electrum_configs(
            None,
            "127.0.0.1:50000/path",
            Chain::BitcoinRegtest,
            None
        )
        .is_err());
    }

    #[test]
    fn regtest_electrum_flags_follow_core_order_without_changing_production() {
        use crate::api::types::{ElectrumSettings, RegtestNetworkProfile};
        let p = RegtestNetworkProfile::for_host("regtest.example".into()).unwrap();
        let settings = ElectrumSettings {
            url: p.btc_electrum_url.clone(),
            tls: true,
            validate_domain: false,
            timeout: 7,
        };
        let (_, tls, domain, timeout) = get_network_electrum_configs(
            Some(settings),
            &p.btc_electrum_url,
            Chain::BitcoinRegtest,
            Some(&p),
        )
        .unwrap();
        assert!(tls && !domain && timeout == 7);
        let settings = ElectrumSettings {
            url: "electrum.example:50002".into(),
            tls: true,
            validate_domain: false,
            timeout: 7,
        };
        let original = get_electrum_configs(Some(settings.clone()), "ignored");
        let current =
            get_network_electrum_configs(Some(settings), "ignored", Chain::BitcoinTestnet, None)
                .unwrap();
        assert!(current == original);
        assert!(get_network_electrum_configs(
            None,
            &p.btc_electrum_url,
            Chain::LiquidRegtest,
            Some(&p)
        )
        .is_err());
    }

    #[test]
    fn liquid_regtest_uses_elements_address_parameters_and_policy_asset() {
        use boltz_client::{
            elements::{Address, AddressParams},
            network::LiquidChain,
        };
        let key =
            boltz_client::Keypair::from_seckey_slice(&boltz_client::Secp256k1::new(), &[1u8; 32])
                .unwrap();
        let public_key =
            boltz_client::elements::bitcoin::PublicKey::from_slice(&key.public_key().serialize())
                .unwrap();
        for params in [
            &AddressParams::LIQUID,
            &AddressParams::LIQUID_TESTNET,
            &AddressParams::ELEMENTS,
        ] {
            let address = Address::p2wpkh(&public_key, Some(key.public_key()), params);
            assert!(
                validate_regtest_address(Chain::LiquidRegtest, &address.to_string()).is_ok()
                    == (params == &AddressParams::ELEMENTS)
            );
        }
        assert!(LiquidChain::LiquidRegtest.bitcoin() != LiquidChain::LiquidTestnet.bitcoin());
        assert!(LiquidChain::LiquidRegtest.bitcoin() != LiquidChain::Liquid.bitcoin());
    }
    #[tokio::test]
    async fn regtest_http_ignores_inherited_proxy() {
        const CHILD: &str = "BOLTZ_REGTEST_PROXY_CHILD";
        const URL: &str = "BOLTZ_REGTEST_PROXY_TARGET";
        if std::env::var_os(CHILD).is_some() {
            let response = regtest_http_client()
                .unwrap()
                .get(std::env::var(URL).unwrap())
                .send()
                .await;
            assert!(response.is_ok_and(|response| response.status().is_success()));
            return;
        }
        use std::io::{Read, Write};
        let listener = std::net::TcpListener::bind("127.0.0.1:0").unwrap();
        listener.set_nonblocking(true).unwrap();
        let target = format!("http://{}", listener.local_addr().unwrap());
        let server = std::thread::spawn(move || {
            let deadline = std::time::Instant::now() + std::time::Duration::from_secs(5);
            while std::time::Instant::now() < deadline {
                match listener.accept() {
                    Ok((mut stream, _)) => {
                        stream
                            .set_read_timeout(Some(std::time::Duration::from_secs(2)))
                            .unwrap();
                        let mut request = [0u8; 2048];
                        let _ = stream.read(&mut request).unwrap();
                        stream.write_all(b"HTTP/1.1 200 OK\r\nContent-Length: 0\r\nConnection: close\r\n\r\n").unwrap();
                        return true;
                    }
                    Err(error) if error.kind() == std::io::ErrorKind::WouldBlock => {
                        std::thread::sleep(std::time::Duration::from_millis(5))
                    }
                    Err(_) => return false,
                }
            }
            false
        });
        let output = std::process::Command::new(std::env::current_exe().unwrap())
            .args([
                "--exact",
                "util::regtest_tests::regtest_http_ignores_inherited_proxy",
            ])
            .env(CHILD, "1")
            .env(URL, target)
            .env("HTTP_PROXY", "http://127.0.0.1:1")
            .env("http_proxy", "http://127.0.0.1:1")
            .env("HTTPS_PROXY", "http://127.0.0.1:1")
            .env("https_proxy", "http://127.0.0.1:1")
            .env("ALL_PROXY", "http://127.0.0.1:1")
            .env("all_proxy", "http://127.0.0.1:1")
            .env("NO_PROXY", "")
            .env("no_proxy", "")
            .output()
            .unwrap();
        assert!(server.join().unwrap());
        assert!(output.status.success());
    }
    #[test]
    fn reverse_response_rejects_wrong_currency_even_with_the_same_payment_hash() {
        use boltz_client::{
            bitcoin::{
                hashes::{sha256, Hash},
                secp256k1::{Secp256k1, SecretKey},
            },
            lightning_invoice::{Currency, InvoiceBuilder, PaymentSecret},
        };
        let payment_hash = sha256::Hash::hash(&[1u8; 32]);
        let key = SecretKey::from_slice(&[7u8; 32]).unwrap();
        for chain in [Chain::BitcoinRegtest, Chain::LiquidRegtest] {
            for currency in [
                Currency::Bitcoin,
                Currency::BitcoinTestnet,
                Currency::Regtest,
            ] {
                let invoice = InvoiceBuilder::new(currency.clone())
                    .description("Synthetic reverse response".into())
                    .payment_hash(payment_hash)
                    .payment_secret(PaymentSecret([2u8; 32]))
                    .duration_since_epoch(std::time::Duration::from_secs(1))
                    .min_final_cltv_expiry_delta(18)
                    .build_signed(|hash| Secp256k1::new().sign_ecdsa_recoverable(hash, &key))
                    .unwrap();
                assert!(*invoice.payment_hash() == payment_hash);
                assert!(
                    reverse_invoice(Some(&invoice.to_string()), chain).is_ok()
                        == (currency == Currency::Regtest)
                );
            }
            assert!(reverse_invoice(None, chain).is_err());
        }
    }
}
