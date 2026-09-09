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
