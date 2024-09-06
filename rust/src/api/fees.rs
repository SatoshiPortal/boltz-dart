use crate::util::ensure_http_prefix;
use boltz_client::{
    boltz::{
        ChainFees, GetChainPairsResponse, GetReversePairsResponse, GetSubmarinePairsResponse,
        PairMinerFees, ReverseFees, SubmarineFees,
    },
    error::Error as LibError,
    swaps::boltz::BoltzApiClientV2,
};
use flutter_rust_bridge::frb;

use super::error::BoltzError;

#[frb(dart_metadata=("freezed"))]
pub struct Fees {
    pub boltz_url: String,
}

impl Fees {
    pub fn new(boltz_url: String) -> Fees {
        let url = ensure_http_prefix(&boltz_url);
        Fees { boltz_url: url }
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

#[derive(Debug, Clone)]
#[frb(dart_metadata=("freezed"))]

pub struct SwapLimits {
    pub minimal: u64,
    pub maximal: u64,
}

impl Into<SwapLimits> for boltz_client::swaps::boltz::PairLimits {
    fn into(self) -> SwapLimits {
        SwapLimits {
            minimal: self.minimal as u64,
            maximal: self.maximal as u64,
        }
    }
}
impl Into<SwapLimits> for boltz_client::swaps::boltz::ReverseLimits {
    fn into(self) -> SwapLimits {
        SwapLimits {
            minimal: self.minimal as u64,
            maximal: self.maximal as u64,
        }
    }
}
#[derive(Debug, Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct SubSwapFees {
    pub percentage: f64,
    pub miner_fees: u64,
}

impl Into<SubSwapFees> for SubmarineFees {
    fn into(self) -> SubSwapFees {
        SubSwapFees {
            percentage: self.percentage,
            miner_fees: self.miner_fees as u64,
        }
    }
}
#[derive(Debug, Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct SubmarineFeesAndLimits {
    pub btc_limits: SwapLimits,
    pub lbtc_limits: SwapLimits,
    pub btc_fees: SubSwapFees,
    pub lbtc_fees: SubSwapFees,
}
impl TryInto<SubmarineFeesAndLimits> for GetSubmarinePairsResponse {
    type Error = BoltzError; // Use a more specific error type in a real application

    fn try_into(self) -> Result<SubmarineFeesAndLimits, Self::Error> {
        let btc_pair = match self.get_btc_to_btc_pair() {
            Some(result) => result,
            None => return Err(LibError::Protocol("Could Not find BTC Pair".to_string()).into()),
        };
        let btc_limits: SwapLimits = btc_pair.limits.into();
        let btc_fees = btc_pair.fees.into();
        let lbtc_pair = match self.get_lbtc_to_btc_pair() {
            Some(result) => result,
            None => return Err(LibError::Protocol("Could Not find L-BTC Pair".to_string()).into()),
        };
        let lbtc_limits = lbtc_pair.limits.into();
        let lbtc_fees = lbtc_pair.fees.into();
        Ok(SubmarineFeesAndLimits {
            btc_limits,
            lbtc_limits,
            btc_fees,
            lbtc_fees,
        })
    }
}

#[derive(Debug, Clone)]
#[frb(dart_metadata=("freezed"))]

pub struct MinerFees {
    pub lockup: u64,
    pub claim: u64,
}
impl Into<MinerFees> for PairMinerFees {
    fn into(self) -> MinerFees {
        MinerFees {
            lockup: self.lockup,
            claim: self.claim,
        }
    }
}

#[derive(Debug, Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct RevSwapFees {
    pub percentage: f64,
    pub miner_fees: MinerFees,
}

impl Into<RevSwapFees> for ReverseFees {
    fn into(self) -> RevSwapFees {
        RevSwapFees {
            percentage: self.percentage,
            miner_fees: self.miner_fees.into(),
        }
    }
}

#[derive(Debug, Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct ReverseFeesAndLimits {
    pub btc_limits: SwapLimits,
    pub lbtc_limits: SwapLimits,
    pub btc_fees: RevSwapFees,
    pub lbtc_fees: RevSwapFees,
}

impl TryInto<ReverseFeesAndLimits> for GetReversePairsResponse {
    type Error = BoltzError; // Use a more specific error type in a real application

    fn try_into(self) -> Result<ReverseFeesAndLimits, Self::Error> {
        let btc_pair = match self.get_btc_to_btc_pair() {
            Some(result) => result,
            None => return Err(LibError::Protocol("Could Not find BTC Pair".to_string()).into()),
        };
        let btc_limits = btc_pair.limits.into();
        let btc_reverse = btc_pair.fees.into();
        let lbtc_pair = match self.get_btc_to_lbtc_pair() {
            Some(result) => result,
            None => return Err(LibError::Protocol("Could Not find L-BTC Pair".to_string()).into()),
        };
        let lbtc_limits = lbtc_pair.limits.into();
        let lbtc_reverse = lbtc_pair.fees.into();
        Ok(ReverseFeesAndLimits {
            btc_limits,
            lbtc_limits,
            btc_fees: btc_reverse,
            lbtc_fees: lbtc_reverse,
        })
    }
}

#[derive(Debug, Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct ChainSwapFees {
    pub percentage: f64,
    pub user_lockup: u64,
    pub user_claim: u64,
    pub server: u64,
}

impl From<ChainFees> for ChainSwapFees {
    fn from(cf: ChainFees) -> Self {
        Self {
            percentage: cf.percentage,
            user_lockup: cf.lockup(),
            user_claim: cf.claim_estimate(),
            server: cf.server(),
        }
    }
}

#[derive(Debug, Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct ChainFeesAndLimits {
    pub btc_limits: SwapLimits,
    pub lbtc_limits: SwapLimits,
    pub btc_fees: ChainSwapFees,  // we lockup (send) btc, we claim lbtc
    pub lbtc_fees: ChainSwapFees, // we lockup (send) lbtc, we claim btc
}
impl TryInto<ChainFeesAndLimits> for GetChainPairsResponse {
    type Error = BoltzError; // Use a more specific error type in a real application

    fn try_into(self) -> Result<ChainFeesAndLimits, Self::Error> {
        let btc_pair = match self.get_lbtc_to_btc_pair() {
            Some(result) => result,
            None => return Err(LibError::Protocol("Could Not find BTC Pair".to_string()).into()),
        };
        let btc_limits = btc_pair.limits.into();
        let btc_chain = btc_pair.fees.into();
        let lbtc_pair = match self.get_btc_to_lbtc_pair() {
            Some(result) => result,
            None => return Err(LibError::Protocol("Could Not find BTC Pair".to_string()).into()),
        };
        let lbtc_limits = lbtc_pair.limits.into();
        let lbtc_chain = lbtc_pair.fees.into();
        Ok(ChainFeesAndLimits {
            btc_limits,
            lbtc_limits,
            btc_fees: btc_chain,
            lbtc_fees: lbtc_chain,
        })
    }
}

// Cross test values by calling the API endpoint
// GET https://api.boltz.exchange/v2/swap/submarine
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_new_fees() {
        let url = "https://api.boltz.exchange/v2";
        let fees = Fees::new(url.to_string());
        assert_eq!(fees.boltz_url, url);

        let url1 = "api.boltz.exchange";
        let fees1 = Fees::new(url1.to_string());
        assert_eq!(fees1.boltz_url, "https://".to_owned() + url1);
    }

    #[test]
    fn test_submarine_fees() {
        let url = "https://api.boltz.exchange/v2";
        let fees = Fees::new(url.to_string());

        let result = fees.submarine();
        if let Ok(sub_fees) = result {
            println!("BTC");
            println!("percentage: {:?}", sub_fees.btc_fees.percentage);
            println!("miner fees: {:?}", sub_fees.btc_fees.miner_fees);
            println!("L-BTC");
            println!("percentage: {:?}", sub_fees.lbtc_fees.percentage);
            println!("miner fees: {:?}", sub_fees.lbtc_fees.miner_fees);
        }
    }

    #[test]
    fn test_reverse_fees() {
        let url = "https://api.boltz.exchange/v2";
        let fees = Fees::new(url.to_string());

        let result = fees.reverse();
        if let Ok(reverse_fees) = result {
            println!("BTC");
            println!("percentage: {:?}", reverse_fees.btc_fees.percentage);
            println!("miner fees: {:?}", reverse_fees.btc_fees.miner_fees);
            println!("L-BTC");
            println!("percentage: {:?}", reverse_fees.lbtc_fees.percentage);
            println!("miner fees: {:?}", reverse_fees.lbtc_fees.miner_fees);
        }
    }

    /*
    #[test]
    fn test_chain_fees() {
        let url = "https://api.boltz.exchange/v2";
        let fees = Fees::new(url.to_string());

        let result = fees.chain();
        if let Ok(chain_fees) = result {
            println!("BTC");
            println!("{:?}", chain_fees);
        }
    }
    */
}
