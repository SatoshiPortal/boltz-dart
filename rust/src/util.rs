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
