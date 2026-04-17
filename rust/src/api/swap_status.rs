use flutter_rust_bridge::frb;
use serde::{Deserialize, Serialize};

/// Status of a swap as reported by the Boltz API
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
pub enum SwapStatus {
    #[serde(rename = "swap.created")]
    SwapCreated,
    #[serde(rename = "swap.expired")]
    SwapExpired,
    #[serde(rename = "swap.refunded")]
    SwapRefunded,
    #[serde(rename = "swap.error")]
    SwapError,
    #[serde(rename = "transaction.mempool")]
    TxnMempool,
    #[serde(rename = "transaction.claim.pending")]
    TxnClaimPending,
    #[serde(rename = "transaction.claimed")]
    TxnClaimed,
    #[serde(rename = "transaction.confirmed")]
    TxnConfirmed,
    #[serde(rename = "transaction.refunded")]
    TxnRefunded,
    #[serde(rename = "transaction.failed")]
    TxnFailed,
    #[serde(rename = "transaction.lockupFailed")]
    TxnLockupFailed,
    #[serde(rename = "transaction.server.mempool")]
    TxnServerMempool,
    #[serde(rename = "transaction.server.confirmed")]
    TxnServerConfirmed,
    #[serde(rename = "transaction.direct")]
    TxnDirect,
    #[serde(rename = "invoice.set")]
    InvoiceSet,
    #[serde(rename = "invoice.pending")]
    InvoicePending,
    #[serde(rename = "invoice.paid")]
    InvoicePaid,
    #[serde(rename = "invoice.failedToPay")]
    InvoiceFailedToPay,
    #[serde(rename = "invoice.settled")]
    InvoiceSettled,
    #[serde(rename = "invoice.expired")]
    InvoiceExpired,
    #[serde(rename = "minerfee.paid")]
    MinerfeePaid,
}

impl SwapStatus {
    /// Convert to the Boltz API JSON string representation
    #[flutter_rust_bridge::frb(sync)]
    pub fn to_json_string(&self) -> String {
        match self {
            SwapStatus::SwapCreated => "swap.created",
            SwapStatus::SwapExpired => "swap.expired",
            SwapStatus::SwapRefunded => "swap.refunded",
            SwapStatus::SwapError => "swap.error",
            SwapStatus::TxnMempool => "transaction.mempool",
            SwapStatus::TxnClaimPending => "transaction.claim.pending",
            SwapStatus::TxnClaimed => "transaction.claimed",
            SwapStatus::TxnConfirmed => "transaction.confirmed",
            SwapStatus::TxnRefunded => "transaction.refunded",
            SwapStatus::TxnFailed => "transaction.failed",
            SwapStatus::TxnLockupFailed => "transaction.lockupFailed",
            SwapStatus::TxnServerMempool => "transaction.server.mempool",
            SwapStatus::TxnServerConfirmed => "transaction.server.confirmed",
            SwapStatus::TxnDirect => "transaction.direct",
            SwapStatus::InvoiceSet => "invoice.set",
            SwapStatus::InvoicePending => "invoice.pending",
            SwapStatus::InvoicePaid => "invoice.paid",
            SwapStatus::InvoiceFailedToPay => "invoice.failedToPay",
            SwapStatus::InvoiceSettled => "invoice.settled",
            SwapStatus::InvoiceExpired => "invoice.expired",
            SwapStatus::MinerfeePaid => "minerfee.paid",
        }
        .to_string()
    }

    /// Human-readable description of the status
    #[flutter_rust_bridge::frb(sync)]
    pub fn as_string(&self) -> String {
        match self {
            SwapStatus::SwapCreated => "Swap created",
            SwapStatus::SwapExpired => "Swap expired",
            SwapStatus::SwapRefunded => "Swap refunded",
            SwapStatus::SwapError => "Swap error",
            SwapStatus::TxnMempool => "Transaction mempool",
            SwapStatus::TxnClaimPending => "Transaction claim pending",
            SwapStatus::TxnClaimed => "Transaction claimed",
            SwapStatus::TxnConfirmed => "Transaction confirmed",
            SwapStatus::TxnRefunded => "Transaction refunded",
            SwapStatus::TxnFailed => "Transaction failed",
            SwapStatus::TxnLockupFailed => "Transaction lockup failed",
            SwapStatus::TxnServerMempool => "Transaction server mempool",
            SwapStatus::TxnServerConfirmed => "Transaction server confirmed",
            SwapStatus::TxnDirect => "Transaction direct",
            SwapStatus::InvoiceSet => "Invoice set",
            SwapStatus::InvoicePending => "Invoice pending",
            SwapStatus::InvoicePaid => "Invoice paid",
            SwapStatus::InvoiceFailedToPay => "Invoice failed to pay",
            SwapStatus::InvoiceSettled => "Invoice settled",
            SwapStatus::InvoiceExpired => "Invoice expired",
            SwapStatus::MinerfeePaid => "Minerfee paid",
        }
        .to_string()
    }

    /// Parse a status from a Boltz API JSON string
    #[flutter_rust_bridge::frb(sync)]
    pub fn from_json_string(status: String) -> Result<SwapStatus, String> {
        match status.as_str() {
            "swap.created" => Ok(SwapStatus::SwapCreated),
            "swap.expired" => Ok(SwapStatus::SwapExpired),
            "swap.refunded" => Ok(SwapStatus::SwapRefunded),
            "swap.error" => Ok(SwapStatus::SwapError),
            "transaction.mempool" => Ok(SwapStatus::TxnMempool),
            "transaction.claim.pending" => Ok(SwapStatus::TxnClaimPending),
            "transaction.claimed" => Ok(SwapStatus::TxnClaimed),
            "transaction.confirmed" => Ok(SwapStatus::TxnConfirmed),
            "transaction.refunded" => Ok(SwapStatus::TxnRefunded),
            "transaction.failed" => Ok(SwapStatus::TxnFailed),
            "transaction.lockupFailed" => Ok(SwapStatus::TxnLockupFailed),
            "transaction.server.mempool" => Ok(SwapStatus::TxnServerMempool),
            "transaction.server.confirmed" => Ok(SwapStatus::TxnServerConfirmed),
            "transaction.direct" => Ok(SwapStatus::TxnDirect),
            "invoice.set" => Ok(SwapStatus::InvoiceSet),
            "invoice.pending" => Ok(SwapStatus::InvoicePending),
            "invoice.paid" => Ok(SwapStatus::InvoicePaid),
            "invoice.failedToPay" => Ok(SwapStatus::InvoiceFailedToPay),
            "invoice.settled" => Ok(SwapStatus::InvoiceSettled),
            "invoice.expired" => Ok(SwapStatus::InvoiceExpired),
            "minerfee.paid" => Ok(SwapStatus::MinerfeePaid),
            _ => Err(format!("Invalid status string: {}", status)),
        }
    }
}

/// A transaction object from the Boltz API websocket
#[flutter_rust_bridge::frb(unignore)]
#[derive(Clone, Debug, PartialEq, Eq, Serialize, Deserialize)]
pub struct Transaction {
    pub id: String,
    pub hex: String,
    pub eta: Option<u32>,
}

/// Response from the Boltz API status endpoint
#[flutter_rust_bridge::frb(unignore)]
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct SwapStatusResponse {
    pub status: SwapStatus,
    pub transaction: Option<Transaction>,
    #[serde(rename = "failureReason")]
    pub failure_reason: Option<String>,
    pub error: Option<String>,
}

/// Status update from the Boltz API websocket stream
#[flutter_rust_bridge::frb(unignore)]
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct SwapStreamStatus {
    pub id: String,
    pub status: SwapStatus,
    pub error: Option<String>,
    pub transaction: Option<Transaction>,
}

impl SwapStreamStatus {
    #[frb(sync)]
    pub fn from_json(json: String) -> Result<SwapStreamStatus, String> {
        serde_json::from_str(&json).map_err(|e| e.to_string())
    }

    #[frb(sync)]
    pub fn to_json(&self) -> Result<String, String> {
        serde_json::to_string(self).map_err(|e| e.to_string())
    }
}

impl SwapStatusResponse {
    #[frb(sync)]
    pub fn from_json(json: String) -> Result<SwapStatusResponse, String> {
        serde_json::from_str(&json).map_err(|e| e.to_string())
    }

    #[frb(sync)]
    pub fn to_json(&self) -> Result<String, String> {
        serde_json::to_string(self).map_err(|e| e.to_string())
    }
}

impl Transaction {
    #[frb(sync)]
    pub fn from_json(json: String) -> Result<Transaction, String> {
        serde_json::from_str(&json).map_err(|e| e.to_string())
    }

    #[frb(sync)]
    pub fn to_json(&self) -> Result<String, String> {
        serde_json::to_string(self).map_err(|e| e.to_string())
    }
}
