pub fn check_protocol(url: &str) -> String {
    let protocols = ["http://", "https://"];
    for protocol in protocols.iter() {
        if url.starts_with(protocol) {
            return url.to_string(); 
        }
    }
    format!("https://{}", url)
}
