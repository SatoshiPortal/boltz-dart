use std::{str::FromStr, time::Duration};

use flutter_rust_bridge::frb;
// network
// preimage
//
use serde::{Serialize,Deserialize};
use boltz_client::{
    network::Chain as BChain, swaps::boltz::{BoltzApiClient, SwapType as BoltzSwapType}, util::secrets::SwapKey, Bolt11Invoice, Keypair, Secp256k1 
};

use super::error::BoltzError;

#[derive(Clone, Copy, PartialEq, Eq)]
#[derive(Serialize, Deserialize)]
#[frb(dart_metadata=("freezed"))]
pub enum SwapType {
    Submarine,
    Reverse,
}

impl Into<BoltzSwapType> for SwapType {
    fn into(self) -> BoltzSwapType {
        match self {
            SwapType::Submarine => BoltzSwapType::Submarine,
            SwapType::Reverse => BoltzSwapType::ReverseSubmarine,
        }
    }
}

#[derive(Clone, Copy)]
#[derive(Serialize, Deserialize)]
#[frb(dart_metadata=("freezed"))]
pub enum Chain {
    Bitcoin,
    BitcoinTestnet,
    Liquid,    
    LiquidTestnet,

}

impl Into<BChain> for Chain {
    fn into(self) -> BChain {
        match self {
            Chain::Bitcoin => BChain::Bitcoin,
            Chain::BitcoinTestnet => BChain::BitcoinTestnet,
            Chain::Liquid => BChain::Liquid,
            Chain::LiquidTestnet => BChain::LiquidTestnet,
        }
    }
}

#[derive(Clone)]
#[derive(Serialize, Deserialize)]
#[frb(dart_metadata=("freezed"))]
pub struct KeyPair {
    pub secret_key: String,
    pub public_key: String,
}

impl Into<Keypair> for KeyPair {
    fn into(self) -> Keypair {
        let secp = Secp256k1::new();
        Keypair::from_seckey_str(&secp, &self.secret_key).unwrap()
    }
}

impl KeyPair {
    #[frb(sync)]
    pub fn new(secret_key: String, public_key: String)->Self{
        KeyPair{
            secret_key,
            public_key
        }
    }

    pub fn generate(
        mnemonic: String,
        network: Chain,
        index: u64,
        swap_type: SwapType,
    ) -> Result<Self, BoltzError> {
        match swap_type {
            SwapType::Submarine => {
                let child_keys =
                    SwapKey::from_submarine_account(&mnemonic, "", network.into(), index)?;
                Ok(KeyPair {
                    secret_key: child_keys.keypair.display_secret().to_string(),
                    public_key: child_keys.keypair.public_key().to_string(),
                })
            }
            SwapType::Reverse => {
                let child_keys =
                    SwapKey::from_reverse_account(&mnemonic, "", network.into(), index)?;
                Ok(KeyPair {
                    secret_key: child_keys.keypair.display_secret().to_string(),
                    public_key: child_keys.keypair.public_key().to_string(),
                })
            }
        }
    }
}

use boltz_client::util::secrets::Preimage;

#[derive(Debug,Clone)]
#[derive(Serialize, Deserialize)]
#[frb(dart_metadata=("freezed"))]
pub struct PreImage {
    pub value: String,
    pub sha256: String,
    pub hash160: String,
}

impl TryInto<Preimage> for PreImage {
    type Error = BoltzError; // Use a more specific error type in a real application

    fn try_into(self) -> Result<Preimage, Self::Error> {
        if !self.value.is_empty() {
            Ok(Preimage::from_str(&self.value)?)
        } else {
            Ok(Preimage::from_sha256_str(&self.sha256)?)
        }
    }
}

impl PreImage {
    #[frb(sync)]
    pub fn new(value: String, sha256: String, hash160: String)->Self{
        PreImage{
            value,
            sha256,
            hash160
        }
    }
    pub fn generate() -> Self {
        let preimage = Preimage::new();
        PreImage {
            value: preimage.to_string().unwrap(),
            sha256: preimage.sha256.to_string(),
            hash160: preimage.hash160.to_string(),
        }
    }
}

impl Into<PreImage> for Preimage {
    fn into(self) -> PreImage {
        PreImage {
            value: self.to_string().unwrap_or("".to_string()),
            sha256: self.sha256.to_string(),
            hash160: self.hash160.to_string(),
        }
    }
}

#[derive(Debug,Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct AllFees {
    pub btc_limits: Limits,
    pub lbtc_limits: Limits,
    pub btc_submarine: SubmarineSwapFees,
    pub btc_reverse: ReverseSwapFees,
    pub lbtc_submarine: SubmarineSwapFees,
    pub lbtc_reverse: ReverseSwapFees,
    pub btc_pair_hash: String, 
    pub lbtc_pair_hash: String,
}

impl AllFees {
    pub fn fetch(boltz_url: String)->Result<Self,BoltzError>{
        let boltz_client = BoltzApiClient::new(&boltz_url);
        let boltz_pairs = match boltz_client.get_pairs() {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let btc_pair = boltz_pairs.get_btc_pair().unwrap();
        let btc_limits = Limits {
            minimal: btc_pair.limits.minimal as u64,
            maximal: btc_pair.limits.maximal as u64,
        };
        let btc_submarine = SubmarineSwapFees {
            boltz_fees_rate: btc_pair.fees.percentage_swap_in,
            lockup_fees_estimate: btc_pair.fees.submarine_lockup_estimate(),
            claim_fees: btc_pair.fees.submarine_claim(),
        };
        let btc_reverse = ReverseSwapFees {
            boltz_fees_rate: btc_pair.fees.percentage,
            lockup_fees: btc_pair.fees.reverse_lockup(),
            claim_fees_estimate: btc_pair.fees.reverse_claim_estimate(),
        };

        let lbtc_pair = boltz_pairs.get_lbtc_pair().unwrap();
        let lbtc_limits = Limits {
            minimal: lbtc_pair.limits.minimal as u64,
            maximal: lbtc_pair.limits.maximal as u64,
        };
        let lbtc_submarine = SubmarineSwapFees {
            boltz_fees_rate: lbtc_pair.fees.percentage_swap_in,
            lockup_fees_estimate: lbtc_pair.fees.submarine_lockup_estimate(),
            claim_fees: lbtc_pair.fees.submarine_claim(),
        };
        let lbtc_reverse = ReverseSwapFees {
            boltz_fees_rate: lbtc_pair.fees.percentage,
            lockup_fees: lbtc_pair.fees.reverse_lockup(),
            claim_fees_estimate: lbtc_pair.fees.reverse_claim_estimate(),
        };
        let btc_pair_hash = btc_pair.hash;
        let lbtc_pair_hash = lbtc_pair.hash;

        Ok(AllFees {
            btc_limits,
            lbtc_limits,
            btc_submarine,
            btc_reverse,
            lbtc_submarine,
            lbtc_reverse,
            btc_pair_hash,
            lbtc_pair_hash
        })
    }
}

#[derive(Debug,Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct Limits {
    pub minimal: u64,
    pub maximal: u64,
}

// 1. lockup (client) 2. [claim (boltz) | refund (client)]
#[frb(dart_metadata=("freezed"))]
#[derive(Debug,Clone)]
pub struct SubmarineSwapFees {
    pub boltz_fees_rate: f64,
    pub claim_fees: u64,
    pub lockup_fees_estimate: u64,
}

// 1. lockup (boltz) 2. [claim (client) | refund (boltz)]
#[frb(dart_metadata=("freezed"))]
#[derive(Debug,Clone)]
pub struct ReverseSwapFees {
    pub boltz_fees_rate: f64,
    pub lockup_fees: u64,
    pub claim_fees_estimate: u64,
}

#[frb(dart_metadata=("freezed"))]
#[derive(Debug,Clone)]
pub struct DecodedInvoice {
    pub msats: u64,
    pub expiry: u64, 
    pub expires_in: u64, 
    pub expires_at: u64, 
    pub is_expired: bool,
    pub network: String,
    pub cltv_exp_delta: u64
}
impl DecodedInvoice {
    pub fn from_string(s: String) -> Result<Self, BoltzError> {
        // Attempt to parse the string to a Bolt11Invoice
        let invoice = match Bolt11Invoice::from_str(&s){
            Ok(result)=>result,
            Err(e)=>return Err(BoltzError::new("Input".to_string(), e.to_string()))
        };

        // If parsing succeeded, convert Bolt11Invoice to DecodedInvoice
        Ok(DecodedInvoice {
            expiry: invoice.expiry_time().as_secs(),
            expires_in: invoice.duration_until_expiry().as_secs(),
            expires_at: invoice.expires_at().unwrap_or(Duration::from_secs(0)).as_secs(),
            is_expired: invoice.is_expired(),
            msats: invoice.amount_milli_satoshis().unwrap_or(0),
            cltv_exp_delta: invoice.min_final_cltv_expiry_delta(),
            network: invoice.network().to_string(),
        })
    }
}