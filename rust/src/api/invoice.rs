use std::{
    str::FromStr,
    time::{Duration, SystemTime, UNIX_EPOCH},
};

use boltz_client::{swaps::boltz::BoltzApiClientV2, Bolt11Invoice};

use crate::util::ensure_http_prefix;

use super::error::BoltzError;

#[derive(Debug, Clone)]
pub struct DecodedInvoice {
    pub msats: u64,
    pub expiry: u64,
    pub expires_in: u64,
    pub expires_at: u64,
    pub is_expired: bool,
    pub network: String,
    pub cltv_exp_delta: u64,
    pub bip21: Option<String>,
    pub preimage_hash: String,
    pub description: String,
}

impl DecodedInvoice {
    pub async fn from_string(s: String, boltz_url: Option<String>) -> Result<Self, BoltzError> {
        let invoice = match Bolt11Invoice::from_str(&s) {
            Ok(result) => result,
            Err(e) => return Err(BoltzError::new("Input".to_string(), e.to_string())),
        };
        let bip21 = if boltz_url.is_some() {
            let mrh = match boltz_client::swaps::magic_routing::find_magic_routing_hint(&s) {
                Ok(s) => s,
                Err(_) => None,
            };
            if mrh.is_none() {
                None
            } else {
                let boltz_client =
                    BoltzApiClientV2::new(ensure_http_prefix(&boltz_url.unwrap()), None);
                match boltz_client.get_mrh_bip21(&s).await {
                    Ok(r) => Some(r.bip21),
                    Err(_) => None,
                }
            }
        } else {
            None
        };
        let now = SystemTime::now();
        let duration_since_epoch = now.duration_since(UNIX_EPOCH).expect("Time went backwards");
        let current_secs = duration_since_epoch.as_secs();
        let expires_at = invoice
            .expires_at()
            .unwrap_or(Duration::from_secs(0))
            .as_secs();

        Ok(DecodedInvoice {
            expiry: invoice.expiry_time().as_secs(),
            expires_in: invoice
                .expiration_remaining_from_epoch(duration_since_epoch)
                .as_secs(),
            expires_at: expires_at,
            is_expired: if current_secs >= expires_at {
                true
            } else {
                false
            },
            msats: invoice.amount_milli_satoshis().unwrap_or(0),
            cltv_exp_delta: invoice.min_final_cltv_expiry_delta(),
            network: invoice.network().to_string(),
            bip21: bip21,
            preimage_hash: invoice.payment_hash().to_string(),
            description: invoice.description().to_string(),
        })
    }
}
