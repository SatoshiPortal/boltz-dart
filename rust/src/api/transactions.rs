use super::{
    error::BoltzError,
    types::{Chain, ChainSwapDirection, OutspendStatus, SwapTxKind, SwapType, VoutOutspend},
};
use crate::util::{
    MEMPOOL_BITCOIN_TESTNET_URL, MEMPOOL_BITCOIN_URL, MEMPOOL_LIQUID_TESTNET_URL,
    MEMPOOL_LIQUID_URL,
};

/// This function queries the Boltz API to get the swap transaction ID, then checks
/// the mempool API to see if the transaction's first output has been spent.
#[deprecated = "vout 0 is not guaranteed to be the swap output; use check_lockup_outspends and verify the spender"]
pub async fn check_vout_0_outspend(
    swap_id: &str,
    swap_type: SwapType,
    tx_kind: SwapTxKind,
    network: Chain,
    boltz_url: &str,
    chain_swap_direction: Option<ChainSwapDirection>,
) -> Result<OutspendStatus, BoltzError> {
    let (txid, mempool_url) = resolve_lockup_tx(
        swap_id,
        swap_type,
        tx_kind,
        network,
        boltz_url,
        chain_swap_direction,
        None,
        None,
    )
    .await?;

    // Check if the output has been spent
    check_outspend(&txid, &mempool_url, tx_kind).await
}

/// Reports the outspend status of EVERY output of the swap's lockup
/// transaction (server lockup for claims, user lockup for refunds), with
/// each output's amount where visible. Unlike the vout-0 check this
/// makes no assumption about which vout carries the swap covenant; callers
/// must match a spender against their own wallet/destination before
/// treating it as their claim or refund — an output being spent proves
/// nothing about who was paid.
///
/// `explorer_url` overrides the explorer for the resolved lockup chain and is required on regtest.
///
/// An empty report means the explorer has not indexed the lockup tx yet
/// (e.g. polled right after broadcast): nothing is spent, retry later.
pub async fn check_lockup_outspends(
    swap_id: &str,
    swap_type: SwapType,
    tx_kind: SwapTxKind,
    network: Chain,
    boltz_url: &str,
    chain_swap_direction: Option<ChainSwapDirection>,
    explorer_url: Option<String>,
    regtest_profile: Option<super::types::RegtestNetworkProfile>,
) -> Result<Vec<VoutOutspend>, BoltzError> {
    let (txid, mempool_url) = resolve_lockup_tx(
        swap_id,
        swap_type,
        tx_kind,
        network,
        boltz_url,
        chain_swap_direction,
        explorer_url,
        regtest_profile.clone(),
    )
    .await?;

    let chain = lockup_chain(network, swap_type, tx_kind, chain_swap_direction)?;
    fetch_outspends(&txid, &mempool_url, chain, regtest_profile.as_ref()).await
}

/// Select the lockup chain without contacting a service.
fn lockup_chain(
    network: Chain,
    swap_type: SwapType,
    tx_kind: SwapTxKind,
    direction: Option<ChainSwapDirection>,
) -> Result<Chain, BoltzError> {
    if swap_type != SwapType::Chain {
        return Ok(network);
    }
    let direction = direction.ok_or_else(|| {
        BoltzError::new("Input".into(), "Chain swap direction is required".into())
    })?;
    let network = super::types::Network::from(network);
    Ok(match (direction, tx_kind) {
        (ChainSwapDirection::BtcToLbtc, SwapTxKind::Claim)
        | (ChainSwapDirection::LbtcToBtc, SwapTxKind::Refund) => network.liquid(),
        _ => network.bitcoin(),
    })
}

fn explorer_for(
    chain: Chain,
    supplied: Option<String>,
    profile: Option<&super::types::RegtestNetworkProfile>,
) -> Result<String, BoltzError> {
    if let Some(url) = supplied {
        return crate::util::explorer_url(&url, chain, profile)
            .map(|url| url.trim_end_matches('/').to_owned());
    }
    Ok(match chain {
        Chain::Bitcoin => MEMPOOL_BITCOIN_URL,
        Chain::BitcoinTestnet => MEMPOOL_BITCOIN_TESTNET_URL,
        Chain::Liquid => MEMPOOL_LIQUID_URL,
        Chain::LiquidTestnet => MEMPOOL_LIQUID_TESTNET_URL,
        Chain::BitcoinRegtest | Chain::LiquidRegtest => {
            return Err(BoltzError::new(
                "Input".into(),
                "Regtest requires an explicit explorer URL".into(),
            ))
        }
    }
    .to_owned())
}

/// Resolve the transaction only after choosing an explicit local explorer for regtest.
async fn resolve_lockup_tx(
    swap_id: &str,
    swap_type: SwapType,
    tx_kind: SwapTxKind,
    network: Chain,
    boltz_url: &str,
    chain_swap_direction: Option<ChainSwapDirection>,
    explorer_url: Option<String>,
    regtest_profile: Option<super::types::RegtestNetworkProfile>,
) -> Result<(String, String), BoltzError> {
    let chain = lockup_chain(network, swap_type, tx_kind, chain_swap_direction)?;
    let explorer = explorer_for(chain, explorer_url, regtest_profile.as_ref())?;
    let client =
        crate::util::boltz_api_client(boltz_url, network.into(), regtest_profile.as_ref())?;
    let txid = match (swap_type, tx_kind) {
        (SwapType::Reverse, SwapTxKind::Claim) => client.get_reverse_tx(swap_id).await?.id,
        (SwapType::Submarine, SwapTxKind::Refund) => client.get_submarine_tx(swap_id).await?.id,
        (SwapType::Chain, kind) => {
            let txs = client.get_chain_txs(swap_id).await?;
            let lockup = match kind {
                SwapTxKind::Claim => txs.server_lock,
                SwapTxKind::Refund => txs.user_lock,
            }
            .ok_or_else(|| {
                BoltzError::new("NotFound".into(), "Lockup transaction not found".into())
            })?;
            lockup.transaction.id
        }
        _ => {
            return Err(BoltzError::new(
                "Input".into(),
                "Unsupported swap type and transaction kind".into(),
            ))
        }
    };
    Ok((txid, explorer))
}

/// Fetches the outspend status of every output of [txid] plus the output
/// amounts, in two explorer calls: `/tx/{txid}/outspends` (spender + block
/// time per vout) and `/tx/{txid}` (amounts; unreadable for confidential
/// Liquid outputs, which report None).
async fn fetch_outspends(
    txid: &str,
    mempool_url: &str,
    chain: Chain,
    profile: Option<&super::types::RegtestNetworkProfile>,
) -> Result<Vec<VoutOutspend>, BoltzError> {
    let client = if super::types::Network::from(chain) == super::types::Network::Regtest {
        crate::util::explorer_url(mempool_url, chain, profile)?;
        crate::util::regtest_http_client()?
    } else {
        reqwest::Client::new()
    };

    fetch_outspends_with_client(txid, mempool_url, &client, chain.into()).await
}

async fn fetch_outspends_with_client(
    txid: &str,
    mempool_url: &str,
    client: &reqwest::Client,
    network: super::types::Network,
) -> Result<Vec<VoutOutspend>, BoltzError> {
    let outspends_url = format!("{}/tx/{}/outspends", mempool_url, txid);
    let response = client
        .get(&outspends_url)
        .send()
        .await
        .map_err(|e| BoltzError::new("HTTP".to_string(), e.to_string()))?;
    // The explorer 404s a tx it has not indexed yet (e.g. polled right after
    // broadcast). Mirror check_outspend's nothing-spent-yet semantics with an
    // empty report instead of hard-failing every early poll.
    if !response.status().is_success() {
        if network == super::types::Network::Regtest
            && response.status() != reqwest::StatusCode::NOT_FOUND
        {
            return Err(BoltzError::new(
                "HTTP".into(),
                format!("Regtest outspends lookup failed: {}", response.status()),
            ));
        }
        return Ok(Vec::new());
    }
    let outspends: serde_json::Value = response
        .json()
        .await
        .map_err(|e| BoltzError::new("JSON".to_string(), e.to_string()))?;
    let outspends = outspends.as_array().ok_or_else(|| {
        BoltzError::new(
            "JSON".to_string(),
            format!("outspends response for {} is not an array", txid),
        )
    })?;

    // Amounts come from the tx itself. This lookup must not silently degrade:
    // a None value_sat is documented to mean a confidential (blinded) output,
    // so a failed fetch has to surface as an error, not masquerade as one.
    let tx_url = format!("{}/tx/{}", mempool_url, txid);
    let tx_response = client
        .get(&tx_url)
        .send()
        .await
        .map_err(|e| BoltzError::new("HTTP".to_string(), e.to_string()))?;
    if !tx_response.status().is_success() {
        return Err(BoltzError::new(
            "HTTP".to_string(),
            format!("tx lookup for {} failed: {}", txid, tx_response.status()),
        ));
    }
    let tx_data: serde_json::Value = tx_response
        .json()
        .await
        .map_err(|e| BoltzError::new("JSON".to_string(), e.to_string()))?;
    let values: Vec<Option<u64>> = tx_data
        .get("vout")
        .and_then(|v| v.as_array())
        .map(|vouts| {
            vouts
                .iter()
                .map(|o| o.get("value").and_then(|v| v.as_u64()))
                .collect()
        })
        .unwrap_or_default();

    Ok(outspends
        .iter()
        .enumerate()
        .map(|(i, outspend)| {
            let spent = outspend
                .get("spent")
                .and_then(|v| v.as_bool())
                .unwrap_or(false);
            VoutOutspend {
                vout: i as u32,
                value_sat: values.get(i).copied().flatten(),
                spender_txid: if spent {
                    outspend
                        .get("txid")
                        .and_then(|v| v.as_str())
                        .map(|s| s.to_string())
                } else {
                    None
                },
                timestamp: if spent {
                    outspend
                        .get("status")
                        .and_then(|s| s.get("block_time"))
                        .and_then(|t| t.as_u64())
                } else {
                    None
                },
            }
        })
        .collect())
}

/// Helper function to check if a transaction output (vout 0) has been spent
async fn check_outspend(
    txid: &str,
    mempool_url: &str,
    tx_kind: SwapTxKind,
) -> Result<OutspendStatus, BoltzError> {
    let outspend_url = format!("{}/tx/{}/outspend/0", mempool_url, txid);
    let client = reqwest::Client::new();
    let response = client
        .get(&outspend_url)
        .send()
        .await
        .map_err(|e| BoltzError::new("HTTP".to_string(), e.to_string()))?;

    if !response.status().is_success() {
        return Ok(OutspendStatus {
            kind: tx_kind,
            txid: None,
            timestamp: None,
        });
    }

    let outspend: serde_json::Value = response
        .json()
        .await
        .map_err(|e| BoltzError::new("JSON".to_string(), e.to_string()))?;

    let spent = outspend
        .get("spent")
        .and_then(|v| v.as_bool())
        .unwrap_or(false);

    let (spend_txid, timestamp) = if spent {
        let txid = outspend
            .get("txid")
            .and_then(|v| v.as_str())
            .map(|s| s.to_string());

        let timestamp = if let Some(ref tx_id) = txid {
            let tx_url = format!("{}/tx/{}", mempool_url, tx_id);
            match client.get(&tx_url).send().await {
                Ok(tx_response) if tx_response.status().is_success() => {
                    match tx_response.json::<serde_json::Value>().await {
                        Ok(tx_data) => tx_data
                            .get("status")
                            .and_then(|s| s.get("block_time"))
                            .and_then(|t| t.as_u64()),
                        Err(_) => None,
                    }
                }
                _ => None,
            }
        } else {
            None
        };

        (txid, timestamp)
    } else {
        (None, None)
    };

    Ok(OutspendStatus {
        kind: tx_kind,
        txid: spend_txid,
        timestamp,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[tokio::test]
    #[ignore = "hits live Boltz + esplora; run with --ignored"]
    #[allow(deprecated)]
    async fn test_check_vout_0_outspend_chain_swap_claim() {
        // Using a real completed chain swap from mainnet
        // Swap ID: UVGfSZkRpckk (BTC -> Liquid)
        let swap_id = "UVGfSZkRpckk";
        let swap_type = SwapType::Chain;
        let tx_kind = SwapTxKind::Claim;
        let network = Chain::Bitcoin; // mainnet
        let boltz_url = "https://api.boltz.exchange/v2";
        let direction = ChainSwapDirection::BtcToLbtc;

        let result = check_vout_0_outspend(
            swap_id,
            swap_type,
            tx_kind,
            network,
            boltz_url,
            Some(direction),
        )
        .await;

        assert!(result.is_ok(), "check_vout_0_outspend should succeed");
        let status = result.unwrap();
        assert_eq!(status.kind, SwapTxKind::Claim);
        assert!(status.txid.is_some(), "Should have a spending txid");
        assert!(status.timestamp.is_some(), "Should have a timestamp");

        println!(
            "Outspend status: kind={:?}, txid={:?}, timestamp={:?}",
            status.kind, status.txid, status.timestamp
        );
    }

    /// Serves canned HTTP responses, one connection per response, so the
    /// explorer-facing helpers can be tested through their real HTTP path.
    fn serve(responses: Vec<(u16, String)>) -> std::net::SocketAddr {
        use std::io::{Read, Write};
        let listener = std::net::TcpListener::bind("127.0.0.1:0").unwrap();
        let addr = listener.local_addr().unwrap();
        std::thread::spawn(move || {
            for (status, body) in responses {
                if let Ok((mut stream, _)) = listener.accept() {
                    let mut buf = [0u8; 8192];
                    let _ = stream.read(&mut buf);
                    let resp = format!(
                        "HTTP/1.1 {} R\r\ncontent-type: application/json\r\ncontent-length: {}\r\nconnection: close\r\n\r\n{}",
                        status,
                        body.len(),
                        body
                    );
                    let _ = stream.write_all(resp.as_bytes());
                }
            }
        });
        addr
    }

    const TXID: &str = "f4184fc596403b9d638783cf57adfe4c75c605f6356fbc91338530e9831e9e16";

    #[tokio::test]
    async fn unindexed_tx_reports_nothing_spent() {
        // The explorer 404s a tx it hasn't indexed yet (polled right after
        // broadcast); that must read as "nothing spent, retry", not an error.
        let addr = serve(vec![(404, "Transaction not found".to_string())]);
        let outspends =
            fetch_outspends(TXID, &format!("http://{addr}"), Chain::BitcoinTestnet, None)
                .await
                .expect("404 must degrade to an empty report");
        assert!(outspends.is_empty());
    }

    #[tokio::test]
    async fn amounts_lookup_failure_is_an_error_not_confidential() {
        // value_sat: None means "confidential output"; a failed amounts fetch
        // must surface as an error instead of masquerading as that.
        let addr = serve(vec![
            (200, r#"[{"spent":false}]"#.to_string()),
            (500, "boom".to_string()),
        ]);
        let err = fetch_outspends(TXID, &format!("http://{addr}"), Chain::BitcoinTestnet, None)
            .await
            .expect_err("failed amounts lookup must not degrade to None");
        assert_eq!(err.kind, "HTTP");
    }

    #[tokio::test]
    async fn reports_every_vout_with_amounts_and_spenders() {
        let outspends_body = format!(
            r#"[{{"spent":true,"txid":"{TXID}","status":{{"confirmed":true,"block_time":1700000000}}}},{{"spent":false}}]"#
        );
        // Second output has no readable value, like a confidential output.
        let tx_body = r#"{"vout":[{"value":1000},{}]}"#.to_string();
        let addr = serve(vec![(200, outspends_body), (200, tx_body)]);

        let outspends =
            fetch_outspends(TXID, &format!("http://{addr}"), Chain::BitcoinTestnet, None)
                .await
                .expect("both explorer calls succeed");

        assert_eq!(outspends.len(), 2);
        assert_eq!(outspends[0].vout, 0);
        assert_eq!(outspends[0].value_sat, Some(1000));
        assert_eq!(outspends[0].spender_txid.as_deref(), Some(TXID));
        assert_eq!(outspends[0].timestamp, Some(1700000000));
        assert_eq!(outspends[1].vout, 1);
        assert_eq!(outspends[1].value_sat, None);
        assert_eq!(outspends[1].spender_txid, None);
        assert_eq!(outspends[1].timestamp, None);
    }
}

#[cfg(test)]
mod regtest_profile_tests {
    use super::*;
    use crate::api::types::{Network, RegtestNetworkProfile};

    #[test]
    fn lockup_explorer_follows_chain_direction_and_transaction_kind() {
        let profile = RegtestNetworkProfile::for_host("regtest.example".into()).unwrap();
        for source in [Chain::BitcoinRegtest, Chain::LiquidRegtest] {
            for (direction, kind, expected) in [
                (
                    ChainSwapDirection::BtcToLbtc,
                    SwapTxKind::Claim,
                    Chain::LiquidRegtest,
                ),
                (
                    ChainSwapDirection::BtcToLbtc,
                    SwapTxKind::Refund,
                    Chain::BitcoinRegtest,
                ),
                (
                    ChainSwapDirection::LbtcToBtc,
                    SwapTxKind::Claim,
                    Chain::BitcoinRegtest,
                ),
                (
                    ChainSwapDirection::LbtcToBtc,
                    SwapTxKind::Refund,
                    Chain::LiquidRegtest,
                ),
            ] {
                let chain = lockup_chain(source, SwapType::Chain, kind, Some(direction)).unwrap();
                assert!(chain == expected && Network::from(chain) == Network::Regtest);
                let (correct, wrong) = if chain == Chain::BitcoinRegtest {
                    (&profile.btc_explorer_url, &profile.lbtc_explorer_url)
                } else {
                    (&profile.lbtc_explorer_url, &profile.btc_explorer_url)
                };
                assert!(explorer_for(chain, Some(correct.clone()), Some(&profile)).is_ok());
                assert!(explorer_for(chain, Some(wrong.clone()), Some(&profile)).is_err());
                assert!(explorer_for(chain, None, Some(&profile)).is_err());
            }
        }
    }
    fn explorer_responses(responses: Vec<&'static str>) -> (String, std::thread::JoinHandle<()>) {
        use std::io::{Read, Write};
        let listener = std::net::TcpListener::bind("127.0.0.1:0").unwrap();
        let url = format!("http://{}", listener.local_addr().unwrap());
        let thread = std::thread::spawn(move || {
            for response in responses {
                let (mut stream, _) = listener.accept().unwrap();
                stream
                    .set_read_timeout(Some(std::time::Duration::from_secs(2)))
                    .unwrap();
                let mut request = [0u8; 2048];
                let _ = stream.read(&mut request).unwrap();
                stream.write_all(response.as_bytes()).unwrap();
            }
        });
        (url, thread)
    }

    #[tokio::test]
    async fn regtest_explorer_does_not_follow_redirects_on_either_request() {
        const REDIRECT: &str = "HTTP/1.1 302 Found\r\nLocation: /forbidden\r\nContent-Length: 0\r\nConnection: close\r\n\r\n";
        const OUTSPENDS: &str =
            "HTTP/1.1 200 OK\r\nContent-Length: 17\r\nConnection: close\r\n\r\n[{\"spent\":false}]";
        for responses in [vec![REDIRECT], vec![OUTSPENDS, REDIRECT]] {
            let (url, server) = explorer_responses(responses);
            let client = crate::util::regtest_http_client().unwrap();
            let error = fetch_outspends_with_client("synthetic", &url, &client, Network::Regtest)
                .await
                .err()
                .unwrap();
            server.join().unwrap();
            assert!(error.kind == "HTTP" && error.message.contains("302"));
        }
    }
}
