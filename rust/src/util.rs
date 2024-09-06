pub fn ensure_http_prefix(url: &str) -> String {
    let protocols = ["http://", "https://"];
    for protocol in protocols.iter() {
        if url.starts_with(protocol) {
            return url.to_string();
        }
    }
    format!("https://{}", url)
}

pub fn strip_tcp_prefix(url: &str) -> String {
    let protocols = ["tcp://", "ssl://"];
    for protocol in protocols.iter() {
        if url.starts_with(protocol) {
            return url.split("://").last().unwrap_or(url).to_string();
        }
    }
    url.to_string()
}
