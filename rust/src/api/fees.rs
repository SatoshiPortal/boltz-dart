use super::{
    error::BoltzError,
    types::{ChainFeesAndLimits, ReverseFeesAndLimits, SubmarineFeesAndLimits},
};
use crate::util::check_protocol;
use boltz_client::swaps::boltz::BoltzApiClientV2;
use flutter_rust_bridge::frb;

#[frb(dart_metadata=("freezed"))]
pub struct Fees {
    pub boltz_url: String,
}

impl Fees {
    #[frb(sync)]
    pub fn new(boltz_url: String) -> Result<Self, ()> {
        Ok(Fees {
            boltz_url: check_protocol(&boltz_url),
        })
    }
    pub fn submarine(&self) -> Result<SubmarineFeesAndLimits, BoltzError> {
        let boltz_client = BoltzApiClientV2::new(&self.boltz_url);
        let sub_fees: SubmarineFeesAndLimits = boltz_client.get_submarine_pairs()?.try_into()?;
        Ok(sub_fees)
    }
    pub fn reverse(&self) -> Result<ReverseFeesAndLimits, BoltzError> {
        let boltz_client = BoltzApiClientV2::new(&self.boltz_url);
        let reverse_fees: ReverseFeesAndLimits = boltz_client.get_reverse_pairs()?.try_into()?;
        Ok(reverse_fees)
    }
    pub fn chain(&self) -> Result<ChainFeesAndLimits, BoltzError> {
        let boltz_client = BoltzApiClientV2::new(&self.boltz_url);
        let chain_fees: ChainFeesAndLimits = boltz_client.get_chain_pairs()?.try_into()?;
        Ok(chain_fees)
    }
}
