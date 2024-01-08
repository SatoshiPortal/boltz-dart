use std::sync::Mutex;
use boltz_client::{
    swaps::boltz::BoltzApiClient,
    swaps::bitcoin::{BtcSwapScript, BtcSwapTx},
    util::{derivation::ChildKeys, error::S5Error},
};

use crate::error::BoltzError;

pub struct BtcLnSwap{
    internal_client: BoltzApiClient,
    internal_script: Option<BtcSwapScript>,
    internal_tx: Option<BtcSwapTx>,
}

impl BtcLnSwap {
    pub fn get_fees(&self)->Result<f64, S5Error>{
        let fees = self.internal_client.get_fee_estimation()?;
        Ok(fees.btc)
    } 
}