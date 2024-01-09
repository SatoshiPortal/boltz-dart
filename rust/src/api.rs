// use boltz_client::network::electrum::NetworkConfig;
// use boltz_client::swaps::boltz;
use boltz_client::swaps::boltz::BoltzApiClient;
use boltz_client::swaps::boltz::CreateSwapRequest;
use boltz_client::util::error::ErrorKind;
use boltz_client::util::error::S5Error;
use boltz_client::util::preimage::Preimage;

use crate::btc_ln::BtcLnSwap;
use crate::error::BoltzError;
use crate::types::Network;
use crate::types::SwapType;
use crate::types::KeyPair;
use crate::types::PreImage;

pub struct Api {}

impl Api {

    pub fn new_btc_ln_submarine(        
        mnemonic: String,
        index: u64,
        invoice: String,
        network: Network,
        electrum_url: String,
        boltz_url: String,
    ) -> Result<BtcLnSwap,BoltzError>{
            let swap_type = SwapType::Submarine;
            let refund_keypair = match KeyPair::new(mnemonic, index, swap_type.clone()) {
                Ok(keypair) => keypair,
                Err(err) => return Err(err.into()),
            };
            let boltz_client = BoltzApiClient::new(&boltz_url);
            // let network_config = NetworkConfig::new(network.into(), &electrum_url, true, true, false, None);
            let boltz_pairs = match boltz_client.get_pairs() {
                Ok(result)=>result,
                Err(e)=> return Err(e.into())
            };

            let pair_hash = match boltz_pairs
            .pairs
            .pairs
            .get("BTC/BTC")
            .map(|pair_info| pair_info.hash.clone()){
                Some(result)=>result,
                None=> return Err(S5Error::new(ErrorKind::BoltzApi, "Could not find BTC/BTC pair-hash from boltz response").into())
            };

            let swap_request = CreateSwapRequest::new_btc_submarine(pair_hash, invoice.clone(), refund_keypair.clone().public_key);
            let response = match boltz_client.create_swap(swap_request){
                Ok(result)=>result,
                Err(e)=>return Err(e.into())
            };
            let preimage = match Preimage::from_invoice_str(&invoice){
                Ok(result)=>result,
                Err(e)=>return Err(e.into())
            };

            if !response.validate_invoice_preimage256(preimage.sha256){
                return Err(S5Error::new(ErrorKind::BoltzApi, "Preimage used in response invoice does not match! Report to support!").into());
            }

            Ok(BtcLnSwap::new(
                response.id,
                swap_type,
                network,
                refund_keypair,
                preimage.into(),
                response.redeem_script.unwrap(),
                invoice,
                electrum_url,
                boltz_url,
            ))

    }
}

// flutter_rust_bridge_codegen --rust-input rust/src/api.rs --dart-output lib/bridge_generated.dart --dart-decl-output lib/bridge_definitions.dart
