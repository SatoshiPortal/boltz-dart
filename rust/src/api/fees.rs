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
    pub fn new(boltz_url: String) -> Fees {
        let url = check_protocol(&boltz_url);
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