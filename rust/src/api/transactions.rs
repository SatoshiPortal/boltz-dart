use super::{
    error::BoltzError,
    types::{Chain, ChainSwapDirection, OutspendStatus, SwapTxKind, SwapType},
};
use crate::util::{
    ensure_http_prefix, MEMPOOL_BITCOIN_TESTNET_URL, MEMPOOL_BITCOIN_URL,
    MEMPOOL_LIQUID_TESTNET_URL, MEMPOOL_LIQUID_URL,
};
use boltz_client::swaps::boltz::BoltzApiClientV2;

/// This function queries the Boltz API to get the swap transaction ID, then checks
/// the mempool API to see if the transaction's first output has been spent.
pub async fn check_vout_0_outspend(
    swap_id: &str,
    swap_type: SwapType,
    tx_kind: SwapTxKind,
    network: Chain,
    boltz_url: &str,
    chain_swap_direction: Option<ChainSwapDirection>,
) -> Result<OutspendStatus, BoltzError> {
    // Get the transaction ID to check based on swap type and tx kind
    let (txid, mempool_url) = match (swap_type, tx_kind) {
        // Reverse swap claims - check server lockup transaction
        (SwapType::Reverse, SwapTxKind::Claim) => {
            let boltz_client = BoltzApiClientV2::new(ensure_http_prefix(boltz_url), None);
            let tx_response = boltz_client.get_reverse_tx(swap_id).await?;
            let txid = tx_response.id;

            let mempool_url = match network {
                Chain::Bitcoin => MEMPOOL_BITCOIN_URL,
                Chain::BitcoinTestnet => MEMPOOL_BITCOIN_TESTNET_URL,
                Chain::Liquid => MEMPOOL_LIQUID_URL,
                Chain::LiquidTestnet => MEMPOOL_LIQUID_TESTNET_URL,
            };

            (txid, mempool_url)
        }

        // Submarine swap refunds - check user lockup transaction
        (SwapType::Submarine, SwapTxKind::Refund) => {
            let boltz_client = BoltzApiClientV2::new(ensure_http_prefix(boltz_url), None);
            let tx_response = boltz_client.get_submarine_tx(swap_id).await?;
            let txid = tx_response.id;

            let mempool_url = match network {
                Chain::Bitcoin => MEMPOOL_BITCOIN_URL,
                Chain::BitcoinTestnet => MEMPOOL_BITCOIN_TESTNET_URL,
                Chain::Liquid => MEMPOOL_LIQUID_URL,
                Chain::LiquidTestnet => MEMPOOL_LIQUID_TESTNET_URL,
            };

            (txid, mempool_url)
        }

        // Chain swap claims - check server lockup transaction
        (SwapType::Chain, SwapTxKind::Claim) => {
            let direction = chain_swap_direction.ok_or_else(|| BoltzError {
                kind: "Input".to_string(),
                message: "Chain swap direction is required for chain swaps".to_string(),
            })?;

            let boltz_client = BoltzApiClientV2::new(ensure_http_prefix(boltz_url), None);
            let txs = boltz_client.get_chain_txs(swap_id).await?;

            let server_lock = txs.server_lock.ok_or_else(|| BoltzError {
                kind: "NotFound".to_string(),
                message: "Server lockup transaction not found".to_string(),
            })?;

            let txid = server_lock.transaction.id;

            // Determine which network the server locked on (opposite of user lockup)
            let mempool_url = match direction {
                ChainSwapDirection::BtcToLbtc => {
                    // User locked BTC, server locked Liquid
                    if network == Chain::BitcoinTestnet || network == Chain::LiquidTestnet {
                        MEMPOOL_LIQUID_TESTNET_URL
                    } else {
                        MEMPOOL_LIQUID_URL
                    }
                }
                ChainSwapDirection::LbtcToBtc => {
                    // User locked Liquid, server locked BTC
                    if network == Chain::BitcoinTestnet || network == Chain::LiquidTestnet {
                        MEMPOOL_BITCOIN_TESTNET_URL
                    } else {
                        MEMPOOL_BITCOIN_URL
                    }
                }
            };

            (txid, mempool_url)
        }

        // Chain swap refunds - check user lockup transaction
        (SwapType::Chain, SwapTxKind::Refund) => {
            let direction = chain_swap_direction.ok_or_else(|| BoltzError {
                kind: "Input".to_string(),
                message: "Chain swap direction is required for chain swaps".to_string(),
            })?;

            let boltz_client = BoltzApiClientV2::new(ensure_http_prefix(boltz_url), None);
            let txs = boltz_client.get_chain_txs(swap_id).await?;

            let user_lock = txs.user_lock.ok_or_else(|| BoltzError {
                kind: "NotFound".to_string(),
                message: "User lockup transaction not found".to_string(),
            })?;

            let txid = user_lock.transaction.id;

            // Determine which network the user locked on
            let mempool_url = match direction {
                ChainSwapDirection::BtcToLbtc => {
                    // User locked BTC
                    if network == Chain::BitcoinTestnet {
                        MEMPOOL_BITCOIN_TESTNET_URL
                    } else {
                        MEMPOOL_BITCOIN_URL
                    }
                }
                ChainSwapDirection::LbtcToBtc => {
                    // User locked Liquid
                    if network == Chain::LiquidTestnet {
                        MEMPOOL_LIQUID_TESTNET_URL
                    } else {
                        MEMPOOL_LIQUID_URL
                    }
                }
            };

            (txid, mempool_url)
        }

        // Invalid combinations
        (SwapType::Submarine, SwapTxKind::Claim) => {
            return Err(BoltzError {
                kind: "Input".to_string(),
                message: "Submarine swaps cannot be checked for claim".to_string(),
            });
        }
        (SwapType::Reverse, SwapTxKind::Refund) => {
            return Err(BoltzError {
                kind: "Input".to_string(),
                message: "Reverse swaps cannot be checked for refund".to_string(),
            });
        }
    };

    // Check if the output has been spent
    check_outspend(&txid, mempool_url, tx_kind).await
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
}
