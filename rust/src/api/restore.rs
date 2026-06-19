use crate::util::ensure_http_prefix;

use super::{
    btc_ln::BtcLnSwap,
    chain_swap::ChainSwap,
    error::BoltzError,
    lbtc_ln::LbtcLnSwap,
    secrets::{KeyPair, SwapMasterKey},
    types::{Chain, ChainSwapDirection, PreImage, SwapType},
};
use boltz_client::util::secrets::Preimage as BoltzPreimage;
use boltz_client::{
    swaps::boltz::{
        BoltzApiClientV2, ChainSwapDetails, ClaimDetails, CreateReverseResponse,
        CreateSubmarineResponse, RefundDetails, SwapRestoreResponse, SwapRestoreType,
    },
    PublicKey, ToHex,
};
use std::str::FromStr;

fn swap_restore_type_to_swap_type(restore_type: SwapRestoreType) -> SwapType {
    match restore_type {
        SwapRestoreType::Reverse => SwapType::Reverse,
        SwapRestoreType::Submarine => SwapType::Submarine,
        SwapRestoreType::Chain => SwapType::Chain,
    }
}

async fn restore_swaps(
    swap_master_key: SwapMasterKey,
    boltz_url: String,
) -> Result<Vec<SwapRestoreResponse>, BoltzError> {
    let boltz_client = BoltzApiClientV2::new(ensure_http_prefix(&boltz_url), None);
    let xpub = swap_master_key.xpub.clone();
    // xpub is the swap-account key (m/44/0/0/0); tell boltz to derive
    // `xpub/{index}` directly ("m") instead of re-applying its default path.
    let restore_responses = boltz_client
        .post_swap_restore(&xpub, Some("m".to_string()), Some(100))
        .await
        .map_err(|e| BoltzError::new("Restore".to_string(), e.to_string()))?;

    Ok(restore_responses)
}

/// Lightweight view of a restorable swap, taken straight from the restore
/// response — enough to list swaps and show status without rebuilding the full
/// swap object (which is only needed to actually rescue one).
pub struct RestoredSwapSummary {
    pub id: String,
    pub kind: SwapType,
    /// Raw boltz status string (e.g. "transaction.claimed"); mapped app-side.
    pub status: String,
    pub created_at: u64,
    pub from: String,
    pub to: String,
    pub amount: u64,
    /// True when on-chain funds are locked and not yet claimed/refunded — i.e.
    /// the swap can still be rescued (claimed or refunded). False for swaps that
    /// never locked up (e.g. expired-unfunded) or are already resolved.
    pub recoverable: bool,
}

/// One restore POST returning a summary per swap (id, kind, status, amount).
pub async fn restore_swap_summaries(
    swap_master_key: SwapMasterKey,
    boltz_url: String,
) -> Result<Vec<RestoredSwapSummary>, BoltzError> {
    let boltz_client = BoltzApiClientV2::new(ensure_http_prefix(&boltz_url), None);
    let xpub = swap_master_key.xpub.clone();
    let responses = boltz_client
        .post_swap_restore(&xpub, Some("m".to_string()), Some(100))
        .await
        .map_err(|e| BoltzError::new("Restore".to_string(), e.to_string()))?;
    Ok(responses
        .into_iter()
        .map(|r| {
            let amount = r
                .claim_details
                .as_ref()
                .and_then(|d| d.amount)
                .unwrap_or(0);
            // Funds are on-chain if boltz recorded a lockup transaction for
            // either side; the swap is resolved once it's been claimed/refunded.
            let has_lockup = r
                .claim_details
                .as_ref()
                .map(|d| d.transaction.is_some())
                .unwrap_or(false)
                || r
                    .refund_details
                    .as_ref()
                    .map(|d| d.transaction.is_some())
                    .unwrap_or(false);
            let resolved = matches!(
                r.status.as_str(),
                "transaction.claimed"
                    | "invoice.settled"
                    | "transaction.refunded"
                    | "swap.refunded"
            );
            RestoredSwapSummary {
                id: r.id,
                kind: swap_restore_type_to_swap_type(r.swap_type),
                status: r.status,
                created_at: r.created_at,
                from: r.from,
                to: r.to,
                amount,
                recoverable: has_lockup && !resolved,
            }
        })
        .collect())
}

/// Highest swap-key derivation index boltz has on record for this wallet's
/// swap xpub. Returns -1 when boltz knows of no swaps. Use it on seed recovery
/// to continue the swap index after the last one already used.
pub async fn restore_swap_index(
    swap_master_key: SwapMasterKey,
    boltz_url: String,
) -> Result<i64, BoltzError> {
    let boltz_client = BoltzApiClientV2::new(ensure_http_prefix(&boltz_url), None);
    let xpub = swap_master_key.xpub.clone();
    let resp = boltz_client
        .post_swap_restore_index(&xpub, Some("m".to_string()), Some(100))
        .await
        .map_err(|e| BoltzError::new("RestoreIndex".to_string(), e.to_string()))?;
    Ok(resp.index)
}

pub async fn restore_ln_btc_swaps(
    swap_master_key: SwapMasterKey,
    electrum_url: String,
    boltz_url: String,
) -> Result<Vec<BtcLnSwap>, BoltzError> {
    let restore_responses = restore_swaps(swap_master_key.clone(), boltz_url.clone()).await?;

    let mut swaps = Vec::new();
    for response in restore_responses {
        if matches!(
            &response.swap_type,
            SwapRestoreType::Submarine | SwapRestoreType::Reverse
        ) {
            if response.from == "BTC" && response.to == "BTC" {
                let invoice = response.invoice.clone();
                match restore_to_btc_ln_swap(
                    response,
                    swap_master_key.clone(),
                    electrum_url.clone(),
                    boltz_url.clone(),
                    invoice,
                ) {
                    Ok(swap) => swaps.push(swap),
                    Err(e) => return Err(e),
                }
            }
        }
    }

    Ok(swaps)
}

pub async fn restore_ln_lbtc_swaps(
    swap_master_key: SwapMasterKey,
    electrum_url: String,
    boltz_url: String,
) -> Result<Vec<LbtcLnSwap>, BoltzError> {
    let restore_responses = restore_swaps(swap_master_key.clone(), boltz_url.clone()).await?;

    let mut swaps = Vec::new();
    for response in restore_responses {
        if matches!(
            &response.swap_type,
            SwapRestoreType::Submarine | SwapRestoreType::Reverse
        ) {
            // L-BTC Lightning swaps: from="L-BTC" to="BTC" (submarine) or from="BTC" to="L-BTC" (reverse)
            if (response.from == "L-BTC" && response.to == "BTC")
                || (response.from == "BTC" && response.to == "L-BTC")
            {
                let invoice = response.invoice.clone();
                match restore_to_lbtc_ln_swap(
                    response,
                    swap_master_key.clone(),
                    electrum_url.clone(),
                    boltz_url.clone(),
                    invoice,
                ) {
                    Ok(swap) => swaps.push(swap),
                    Err(e) => return Err(e),
                }
            }
        }
    }

    Ok(swaps)
}

pub async fn restore_chain_swaps(
    swap_master_key: SwapMasterKey,
    btc_electrum_url: String,
    lbtc_electrum_url: String,
    boltz_url: String,
) -> Result<Vec<ChainSwap>, BoltzError> {
    let restore_responses = restore_swaps(swap_master_key.clone(), boltz_url.clone()).await?;

    let mut swaps = Vec::new();
    for response in restore_responses {
        if matches!(&response.swap_type, SwapRestoreType::Chain) {
            match restore_to_chain_swap(
                response,
                swap_master_key.clone(),
                btc_electrum_url.clone(),
                lbtc_electrum_url.clone(),
                boltz_url.clone(),
            ) {
                Ok(swap) => swaps.push(swap),
                Err(e) => return Err(e),
            }
        }
    }

    Ok(swaps)
}

fn infer_network(from: &str, to: &str) -> Result<Chain, BoltzError> {
    let is_testnet = from.contains("testnet") || to.contains("testnet");
    // The Lightning side of an LN swap is always BTC-denominated, so the
    // on-chain leg is whichever side is L-BTC (reverse: `to`, submarine: `from`).
    // Keying off `from` alone mis-tags a lightning->L-BTC reverse as Bitcoin.
    let is_liquid = from == "L-BTC" || to == "L-BTC";
    Ok(if is_liquid {
        if is_testnet {
            Chain::LiquidTestnet
        } else {
            Chain::Liquid
        }
    } else {
        if is_testnet {
            Chain::BitcoinTestnet
        } else {
            Chain::Bitcoin
        }
    })
}

fn infer_chain_swap_direction(from: &str, to: &str) -> Result<ChainSwapDirection, BoltzError> {
    match (from, to) {
        ("BTC", "L-BTC") => Ok(ChainSwapDirection::BtcToLbtc),
        ("L-BTC", "BTC") => Ok(ChainSwapDirection::LbtcToBtc),
        _ => Err(BoltzError::new(
            "Direction".to_string(),
            format!("Cannot infer direction from from={}, to={}", from, to),
        )),
    }
}

fn claim_details_to_chain_swap_details(
    details: &ClaimDetails,
) -> Result<ChainSwapDetails, BoltzError> {
    let server_pubkey = PublicKey::from_str(&details.server_public_key)
        .map_err(|e| BoltzError::new("PublicKey".to_string(), e.to_string()))?;

    Ok(ChainSwapDetails {
        swap_tree: details.tree.clone(),
        lockup_address: details.lockup_address.clone(),
        server_public_key: server_pubkey,
        timeout_block_height: details.timeout_block_height,
        amount: details.amount.unwrap_or(0),
        blinding_key: details.blinding_key.clone(),
        refund_address: None,
        claim_address: None,
        bip21: None,
    })
}

fn refund_details_to_chain_swap_details(
    details: &RefundDetails,
) -> Result<ChainSwapDetails, BoltzError> {
    let server_pubkey = PublicKey::from_str(&details.server_public_key)
        .map_err(|e| BoltzError::new("PublicKey".to_string(), e.to_string()))?;

    Ok(ChainSwapDetails {
        swap_tree: details.tree.clone(),
        lockup_address: details.lockup_address.clone(),
        server_public_key: server_pubkey,
        timeout_block_height: details.timeout_block_height,
        amount: 0,
        blinding_key: details.blinding_key.clone(),
        refund_address: None,
        claim_address: None,
        bip21: None,
    })
}

fn restore_to_btc_ln_swap(
    restore_response: SwapRestoreResponse,
    swap_master_key: SwapMasterKey,
    electrum_url: String,
    boltz_url: String,
    invoice: Option<String>,
) -> Result<BtcLnSwap, BoltzError> {
    let network = infer_network(&restore_response.from, &restore_response.to)?;
    let swap_master_key_inner: boltz_client::util::secrets::SwapMasterKey =
        swap_master_key.try_into()?;

    let claim_details = restore_response.claim_details.as_ref().ok_or_else(|| {
        BoltzError::new(
            "Restore".to_string(),
            "Claim details required for BtcLnSwap".to_string(),
        )
    })?;

    let key_index = claim_details.key_index as u64;
    let kps = swap_master_key_inner.derive_swapkey(key_index)?;
    let keys = KeyPair::from(kps);

    let claim_public_key = PublicKey::from_str(&claim_details.server_public_key)
        .map_err(|e| BoltzError::new("PublicKey".to_string(), e.to_string()))?;
    let our_pubkey = PublicKey {
        inner: kps.public_key(),
        compressed: true,
    };

    let swap_type = swap_restore_type_to_swap_type(restore_response.swap_type.clone());
    let preimage = match restore_response.swap_type {
        SwapRestoreType::Submarine => {
            let boltz_preimage = BoltzPreimage::from_sha256_str(&claim_details.preimage_hash)
                .map_err(|e| BoltzError::new("Preimage".to_string(), e.to_string()))?;
            PreImage {
                value: boltz_preimage.bytes.map(|b| b.to_hex()).unwrap_or_default(),
                sha256: boltz_preimage.sha256.to_string(),
                hash160: boltz_preimage.hash160.to_string(),
            }
        }
        SwapRestoreType::Reverse => {
            let boltz_preimage = BoltzPreimage::from_swap_key(&kps);
            if boltz_preimage.sha256.to_string() != claim_details.preimage_hash {
                return Err(BoltzError::new(
                    "Restore".to_string(),
                    format!(
                        "Preimage hash mismatch: expected {}, got {}",
                        claim_details.preimage_hash,
                        boltz_preimage.sha256.to_string()
                    ),
                ));
            }
            PreImage {
                value: boltz_preimage.bytes.map(|b| b.to_hex()).unwrap_or_default(),
                sha256: boltz_preimage.sha256.to_string(),
                hash160: boltz_preimage.hash160.to_string(),
            }
        }
        SwapRestoreType::Chain => {
            return Err(BoltzError::new(
                "Restore".to_string(),
                "Chain swap type not supported for BtcLnSwap".to_string(),
            ));
        }
    };

    let swap_script = match restore_response.swap_type {
        SwapRestoreType::Submarine => {
            let create_swap_response = CreateSubmarineResponse {
                id: restore_response.id.clone(),
                accept_zero_conf: false,
                address: claim_details.lockup_address.clone(),
                bip21: String::new(),
                claim_public_key: claim_public_key.clone(),
                expected_amount: claim_details.amount.unwrap_or(0),
                referral_id: None,
                swap_tree: claim_details.tree.clone(),
                timeout_block_height: claim_details.timeout_block_height as u64,
                blinding_key: None,
            };
            boltz_client::BtcSwapScript::submarine_from_swap_resp(
                &create_swap_response,
                kps.public_key().into(),
            )
        }
        SwapRestoreType::Reverse => {
            let create_reverse_response = CreateReverseResponse {
                id: restore_response.id.clone(),
                lockup_address: claim_details.lockup_address.clone(),
                invoice: invoice.clone(),
                timeout_block_height: claim_details.timeout_block_height,
                onchain_amount: claim_details.amount.unwrap_or(0),
                swap_tree: claim_details.tree.clone(),
                refund_public_key: claim_public_key.clone(),
                blinding_key: None,
            };
            boltz_client::BtcSwapScript::reverse_from_swap_resp(
                &create_reverse_response,
                our_pubkey,
            )
        }
        SwapRestoreType::Chain => {
            return Err(BoltzError::new(
                "Restore".to_string(),
                "Chain swap type not supported for BtcLnSwap".to_string(),
            ));
        }
    }
    .map_err(|e| BoltzError::new("SwapScript".to_string(), e.to_string()))?;

    Ok(BtcLnSwap::new(
        restore_response.id,
        swap_type,
        network,
        keys,
        key_index,
        preimage,
        swap_script.into(),
        invoice.unwrap_or_default(),
        claim_details.lockup_address.clone(),
        claim_details.amount.unwrap_or(0),
        electrum_url,
        boltz_url,
        None,
    ))
}

fn restore_to_lbtc_ln_swap(
    restore_response: SwapRestoreResponse,
    swap_master_key: SwapMasterKey,
    electrum_url: String,
    boltz_url: String,
    invoice: Option<String>,
) -> Result<LbtcLnSwap, BoltzError> {
    let network = infer_network(&restore_response.from, &restore_response.to)?;
    let swap_master_key_inner: boltz_client::util::secrets::SwapMasterKey =
        swap_master_key.try_into()?;

    let claim_details = restore_response.claim_details.as_ref().ok_or_else(|| {
        BoltzError::new(
            "Restore".to_string(),
            "Claim details required for LbtcLnSwap".to_string(),
        )
    })?;

    let key_index = claim_details.key_index as u64;
    let kps = swap_master_key_inner.derive_liquid_swapkey(key_index)?;
    let keys = KeyPair::from(kps);

    let claim_public_key = PublicKey::from_str(&claim_details.server_public_key)
        .map_err(|e| BoltzError::new("PublicKey".to_string(), e.to_string()))?;
    let our_pubkey = PublicKey {
        inner: kps.public_key(),
        compressed: true,
    };

    let swap_type = swap_restore_type_to_swap_type(restore_response.swap_type.clone());
    let preimage = match restore_response.swap_type {
        SwapRestoreType::Submarine => {
            let boltz_preimage = BoltzPreimage::from_sha256_str(&claim_details.preimage_hash)
                .map_err(|e| BoltzError::new("Preimage".to_string(), e.to_string()))?;
            PreImage {
                value: boltz_preimage.bytes.map(|b| b.to_hex()).unwrap_or_default(),
                sha256: boltz_preimage.sha256.to_string(),
                hash160: boltz_preimage.hash160.to_string(),
            }
        }
        SwapRestoreType::Reverse => {
            let boltz_preimage = BoltzPreimage::from_swap_key(&kps);
            if boltz_preimage.sha256.to_string() != claim_details.preimage_hash {
                return Err(BoltzError::new(
                    "Restore".to_string(),
                    format!(
                        "Preimage hash mismatch: expected {}, got {}",
                        claim_details.preimage_hash,
                        boltz_preimage.sha256.to_string()
                    ),
                ));
            }
            PreImage {
                value: boltz_preimage.bytes.map(|b| b.to_hex()).unwrap_or_default(),
                sha256: boltz_preimage.sha256.to_string(),
                hash160: boltz_preimage.hash160.to_string(),
            }
        }
        SwapRestoreType::Chain => {
            return Err(BoltzError::new(
                "Restore".to_string(),
                "Chain swap type not supported for LbtcLnSwap".to_string(),
            ));
        }
    };

    let swap_script = match restore_response.swap_type {
        SwapRestoreType::Submarine => {
            let create_swap_response = CreateSubmarineResponse {
                id: restore_response.id.clone(),
                accept_zero_conf: false,
                address: claim_details.lockup_address.clone(),
                bip21: String::new(),
                claim_public_key: claim_public_key.clone(),
                expected_amount: claim_details.amount.unwrap_or(0),
                referral_id: None,
                swap_tree: claim_details.tree.clone(),
                timeout_block_height: claim_details.timeout_block_height as u64,
                blinding_key: claim_details.blinding_key.clone(),
            };
            boltz_client::LBtcSwapScript::submarine_from_swap_resp(
                &create_swap_response,
                kps.public_key().into(),
            )
        }
        SwapRestoreType::Reverse => {
            let create_reverse_response = CreateReverseResponse {
                id: restore_response.id.clone(),
                lockup_address: claim_details.lockup_address.clone(),
                invoice: invoice.clone(),
                timeout_block_height: claim_details.timeout_block_height,
                onchain_amount: claim_details.amount.unwrap_or(0),
                swap_tree: claim_details.tree.clone(),
                refund_public_key: claim_public_key.clone(),
                blinding_key: claim_details.blinding_key.clone(),
            };
            boltz_client::LBtcSwapScript::reverse_from_swap_resp(
                &create_reverse_response,
                our_pubkey,
            )
        }
        SwapRestoreType::Chain => {
            return Err(BoltzError::new(
                "Restore".to_string(),
                "Chain swap type not supported for LbtcLnSwap".to_string(),
            ));
        }
    }
    .map_err(|e| BoltzError::new("SwapScript".to_string(), e.to_string()))?;

    let blinding_key = claim_details.blinding_key.clone().unwrap_or_default();

    Ok(LbtcLnSwap::new(
        restore_response.id,
        swap_type,
        network,
        keys,
        key_index,
        preimage,
        swap_script.into(),
        invoice.unwrap_or_default(),
        claim_details.amount.unwrap_or(0),
        claim_details.lockup_address.clone(),
        blinding_key,
        electrum_url,
        boltz_url,
        None,
    ))
}

fn restore_to_chain_swap(
    restore_response: SwapRestoreResponse,
    swap_master_key: SwapMasterKey,
    btc_electrum_url: String,
    lbtc_electrum_url: String,
    boltz_url: String,
) -> Result<ChainSwap, BoltzError> {
    let direction = infer_chain_swap_direction(&restore_response.from, &restore_response.to)?;
    let is_testnet =
        restore_response.from.contains("testnet") || restore_response.to.contains("testnet");
    let swap_master_key_inner: boltz_client::util::secrets::SwapMasterKey =
        swap_master_key.try_into()?;

    let refund_details = restore_response.refund_details.as_ref().ok_or_else(|| {
        BoltzError::new(
            "Restore".to_string(),
            "Refund details required for ChainSwap".to_string(),
        )
    })?;

    let claim_details = restore_response.claim_details.as_ref().ok_or_else(|| {
        BoltzError::new(
            "Restore".to_string(),
            "Claim details required for ChainSwap".to_string(),
        )
    })?;

    let refund_index = refund_details.key_index as u64;
    let claim_index = claim_details.key_index as u64;

    let (refund_kps, claim_kps) = match direction {
        ChainSwapDirection::BtcToLbtc => {
            let refund_kps = swap_master_key_inner.derive_swapkey(refund_index)?;
            let claim_kps = swap_master_key_inner.derive_liquid_swapkey(claim_index)?;
            (refund_kps, claim_kps)
        }
        ChainSwapDirection::LbtcToBtc => {
            let refund_kps = swap_master_key_inner.derive_liquid_swapkey(refund_index)?;
            let claim_kps = swap_master_key_inner.derive_swapkey(claim_index)?;
            (refund_kps, claim_kps)
        }
    };

    let refund_keys = KeyPair::from(refund_kps);
    let claim_keys = KeyPair::from(claim_kps);

    // For chain swaps, derive preimage from claim key and verify sha256 matches
    let boltz_preimage = BoltzPreimage::from_swap_key(&claim_kps);
    if boltz_preimage.sha256.to_string() != claim_details.preimage_hash {
        return Err(BoltzError::new(
            "Restore".to_string(),
            format!(
                "Preimage hash mismatch: expected {}, got {}",
                claim_details.preimage_hash,
                boltz_preimage.sha256.to_string()
            ),
        ));
    }
    let preimage = PreImage {
        value: boltz_preimage.bytes.map(|b| b.to_hex()).unwrap_or_default(),
        sha256: boltz_preimage.sha256.to_string(),
        hash160: boltz_preimage.hash160.to_string(),
    };

    let refund_chain_details = refund_details_to_chain_swap_details(refund_details)?;
    let claim_chain_details = claim_details_to_chain_swap_details(claim_details)?;

    let refund_public_key = PublicKey {
        inner: refund_kps.public_key(),
        compressed: true,
    };
    let claim_public_key = PublicKey {
        inner: claim_kps.public_key(),
        compressed: true,
    };

    let (btc_script_str, lbtc_script_str) = match direction {
        ChainSwapDirection::BtcToLbtc => {
            let btc_script = boltz_client::BtcSwapScript::chain_from_swap_resp(
                boltz_client::boltz::Side::Lockup,
                refund_chain_details.clone(),
                refund_public_key,
            )
            .map_err(|e| BoltzError::new("SwapScript".to_string(), e.to_string()))?;

            let lbtc_script = boltz_client::LBtcSwapScript::chain_from_swap_resp(
                boltz_client::boltz::Side::Claim,
                claim_chain_details.clone(),
                claim_public_key,
            )
            .map_err(|e| BoltzError::new("SwapScript".to_string(), e.to_string()))?;

            (btc_script.into(), lbtc_script.into())
        }
        ChainSwapDirection::LbtcToBtc => {
            let lbtc_script = boltz_client::LBtcSwapScript::chain_from_swap_resp(
                boltz_client::boltz::Side::Lockup,
                refund_chain_details.clone(),
                refund_public_key,
            )
            .map_err(|e| BoltzError::new("SwapScript".to_string(), e.to_string()))?;

            let btc_script = boltz_client::BtcSwapScript::chain_from_swap_resp(
                boltz_client::boltz::Side::Claim,
                claim_chain_details.clone(),
                claim_public_key,
            )
            .map_err(|e| BoltzError::new("SwapScript".to_string(), e.to_string()))?;

            (btc_script.into(), lbtc_script.into())
        }
    };

    let blinding_key = claim_details.blinding_key.clone().unwrap_or_default();

    Ok(ChainSwap::new(
        restore_response.id,
        is_testnet,
        direction,
        refund_keys,
        refund_index,
        claim_keys,
        claim_index,
        preimage,
        btc_script_str,
        lbtc_script_str,
        refund_details.lockup_address.clone(),
        claim_details.amount.unwrap_or(0),
        btc_electrum_url,
        lbtc_electrum_url,
        boltz_url,
        None,
        blinding_key,
    ))
}
