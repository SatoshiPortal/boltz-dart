use boltz_client::error::Error;
use serde::{Serialize,Deserialize};

#[derive(Serialize, Deserialize)]
pub struct BoltzError {
    pub kind: String,
    pub message: String,
}

impl BoltzError {
    pub fn new(kind: String, message: String) -> Self {
        BoltzError {
            kind: kind.to_string(),
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