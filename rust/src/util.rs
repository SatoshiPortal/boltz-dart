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
