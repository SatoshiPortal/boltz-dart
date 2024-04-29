use boltz_client::error::Error;
use flutter_rust_bridge::frb;
use serde::{Serialize,Deserialize};

#[derive(Serialize, Deserialize)]
#[derive(Debug,Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct BoltzError {
    pub kind: String,
    pub message: String,
}

impl BoltzError {
    pub fn new(kind: String, message: String) -> Self {
        BoltzError {
            kind: kind,
            message: message,
        }
    }
}

impl From<Error> for BoltzError {
    fn from(value: Error) -> Self {
        BoltzError {
            kind: value.name(),
            message: value.message(),
        }
    }
}