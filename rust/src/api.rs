use boltz_client::network::electrum::NetworkConfig;
use boltz_client::swaps::bitcoin::BtcSwapScript;
use boltz_client::swaps::bitcoin::BtcSwapTx;
use boltz_client::swaps::liquid::LBtcSwapScript;
use boltz_client::swaps::liquid::LBtcSwapTx;
use boltz_client::util::preimage::Preimage as BoltzPreImage;
use boltz_client::{KeyPair as CoreKeyPair, Secp256k1};
// use boltz_client::network::electrum::NetworkConfig;
// use boltz_client::swaps::boltz;
use boltz_client::swaps::boltz::BoltzApiClient;
use boltz_client::swaps::boltz::CreateSwapRequest;
use boltz_client::swaps::boltz::SwapStatusRequest;
use boltz_client::util::error::ErrorKind;
use boltz_client::util::error::S5Error;
use boltz_client::util::preimage::Preimage;

use crate::types::BtcLnSwap;
use crate::types::BoltzError;
use crate::types::LbtcLnSwap;
use crate::types::Network;
use crate::types::SwapType;
use crate::types::KeyPair;
use crate::types::PreImage;

pub struct Api {}

impl Api {

    pub fn swap_fees(boltz_url: String)->anyhow::Result<(f64,f64), BoltzError>{
        let boltz_client = BoltzApiClient::new(&boltz_url);
        // let network_config = NetworkConfig::new(network.into(), &electrum_url, true, true, false, None);
        match boltz_client.get_fee_estimation() {
            Ok(result)=>Ok((result.btc, result.lbtc)),
            Err(e)=> return Err(e.into())
        }
        
    }
    
    pub fn new_btc_ln_submarine(        
        mnemonic: String,
        index: u64,
        invoice: String,
        network: Network,
        electrum_url: String,
        boltz_url: String,
    ) -> anyhow::Result<BtcLnSwap,BoltzError>{
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

            if !response.validate_script_preimage160(preimage.hash160){
                return Err(S5Error::new(ErrorKind::BoltzApi, "Preimage used in response invoice does not match! Report to support!").into());
            }
            // let btc_swap_script = BtcSwapScript::submarine_from_str(&response.clone().redeem_script.unwrap()).unwrap();
        
            // let payment_address = match btc_swap_script.to_address(network.clone().into()){
            //     Ok(result)=>result.to_string(),
            //     Err(e)=>return Err(e.into())
            // };

            // if &payment_address != &response.clone().address.unwrap(){
            //     return Err(S5Error::new(ErrorKind::BoltzApi, "Payment address in response does not match constructed script! Report to support!").into());
            // }

            Ok(BtcLnSwap::new(
                response.clone().id,
                swap_type,
                network,
                refund_keypair,
                preimage.into(),
                response.clone().redeem_script.unwrap(),
                invoice,
                response.clone().expected_amount.unwrap(),
                response.clone().address.unwrap(),
                electrum_url,
                boltz_url,
            ))

    }
    
    pub fn new_btc_ln_reverse(        
        mnemonic: String,
        index: u64,
        out_amount: u64,
        network: Network,
        electrum_url: String,
        boltz_url: String,
    ) -> anyhow::Result<BtcLnSwap,BoltzError>{
            let swap_type = SwapType::Reverse;
            let claim_keypair = match KeyPair::new(mnemonic, index, swap_type.clone()) {
                Ok(keypair) => keypair,
                Err(err) => return Err(err.into()),
            };
            let preimage = Preimage::new();
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

            let swap_request = CreateSwapRequest::new_btc_reverse(pair_hash, preimage.sha256.to_string(), claim_keypair.clone().public_key, out_amount);
            let response = match boltz_client.create_swap(swap_request){
                Ok(result)=>result,
                Err(e)=>return Err(e.into())
            };

            if !response.validate_invoice_preimage256(preimage.sha256){
                return Err(S5Error::new(ErrorKind::BoltzApi, "Preimage used in response invoice does not match! Report to support!").into());
            }
            // let btc_swap_script = BtcSwapScript::submarine_from_str(&response.clone().redeem_script.unwrap()).unwrap();
        
            // let payment_address = match btc_swap_script.to_address(network.clone().into()){
            //     Ok(result)=>result.to_string(),
            //     Err(e)=>return Err(e.into())
            // };

            // if &payment_address != &response.clone().address.unwrap(){
            //     return Err(S5Error::new(ErrorKind::BoltzApi, "Payment address in response does not match constructed script! Report to support!").into());
            // }

            Ok(BtcLnSwap::new(
                response.clone().id,
                swap_type,
                network,
                claim_keypair,
                preimage.into(),
                response.clone().redeem_script.unwrap(),
                response.clone().invoice.unwrap(),
                out_amount,
                response.clone().lockup_address.unwrap(),
                electrum_url,
                boltz_url,
            ))

    }
    
    pub fn btc_ln_reverse_claim(swap: BtcLnSwap, fee: u64)->anyhow::Result<String, BoltzError>{
        if swap.kind == SwapType::Submarine {
            return Err(S5Error::new(ErrorKind::Input, "Submarine swaps are not claimable").into());
        }
        else{
            ()
        }

        let script = match BtcSwapScript::reverse_from_str(&swap.redeem_script){
            Ok(result)=>result,
            Err(e)=> return Err(e.into())
        };
        let network_config = NetworkConfig::new(swap.network.clone().into(), &swap.electrum_url, true, true, false, None);
        let script_balance = match script
        .get_balance(network_config.clone()){
            Ok(result)=>result,
            Err(e)=> return Err(e.into())
        };

        if script_balance.0 > 0 || script_balance.1 > 0 {
            let mut tx = match BtcSwapTx::new_claim(script, swap.out_address, fee as u32, swap.network.clone().into()){
                Ok(result)=>result,
                Err(e)=> return Err(e.into())
            };
            let secp = Secp256k1::new();
            let signed = match tx.drain(
                CoreKeyPair::from_seckey_str(&secp, &swap.keys.secret_key).unwrap(), 
                BoltzPreImage::from_str(&swap.preimage.value).unwrap(), 
                swap.out_amount, 
                network_config.clone(),
            ){
                Ok(result)=>result,
                Err(e)=> return Err(e.into())
            };
            let txid = match tx.broadcast(signed, network_config){
                Ok(result)=>result,
                Err(e)=> return Err(e.into())
            };
            Ok(txid)
        }
        else{
            return Err(S5Error::new(ErrorKind::Script, "Script is not funded yet!").into());
        }
    }

    pub fn new_lbtc_ln_submarine(        
        mnemonic: String,
        index: u64,
        invoice: String,
        network: Network,
        electrum_url: String,
        boltz_url: String,
    ) -> anyhow::Result<LbtcLnSwap,BoltzError>{
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
            .get("L-BTC/BTC")
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

            if !response.validate_script_preimage160(preimage.hash160){
                return Err(S5Error::new(ErrorKind::BoltzApi, "Preimage used in response invoice does not match! Report to support!").into());
            }
            // let btc_swap_script = BtcSwapScript::submarine_from_str(&response.clone().redeem_script.unwrap()).unwrap();
        
            // let payment_address = match btc_swap_script.to_address(network.clone().into()){
            //     Ok(result)=>result.to_string(),
            //     Err(e)=>return Err(e.into())
            // };

            // if &payment_address != &response.clone().address.unwrap(){
            //     return Err(S5Error::new(ErrorKind::BoltzApi, "Payment address in response does not match constructed script! Report to support!").into());
            // }

            Ok(LbtcLnSwap::new(
                response.clone().id,
                swap_type,
                network,
                refund_keypair,
                preimage.into(),
                response.clone().redeem_script.unwrap(),
                invoice,
                response.clone().expected_amount.unwrap(),
                response.clone().address.unwrap(),
                "".to_string(),
                electrum_url,
                boltz_url,
            ))

    }
    
    pub fn new_lbtc_ln_reverse(        
        mnemonic: String,
        index: u64,
        out_amount: u64,
        network: Network,
        electrum_url: String,
        boltz_url: String,
    ) -> anyhow::Result<LbtcLnSwap,BoltzError>{
            let swap_type = SwapType::Reverse;
            let claim_keypair = match KeyPair::new(mnemonic, index, swap_type.clone()) {
                Ok(keypair) => keypair,
                Err(err) => return Err(err.into()),
            };
            let preimage = Preimage::new();
            let boltz_client = BoltzApiClient::new(&boltz_url);
            // let network_config = NetworkConfig::new(network.into(), &electrum_url, true, true, false, None);
            let boltz_pairs = match boltz_client.get_pairs() {
                Ok(result)=>result,
                Err(e)=> return Err(e.into())
            };

            let pair_hash = match boltz_pairs
            .pairs
            .pairs
            .get("L-BTC/BTC")
            .map(|pair_info| pair_info.hash.clone()){
                Some(result)=>result,
                None=> return Err(S5Error::new(ErrorKind::BoltzApi, "Could not find BTC/BTC pair-hash from boltz response").into())
            };

            let swap_request = CreateSwapRequest::new_btc_reverse(pair_hash, preimage.sha256.to_string(), claim_keypair.clone().public_key, out_amount);
            let response = match boltz_client.create_swap(swap_request){
                Ok(result)=>result,
                Err(e)=>return Err(e.into())
            };

            if !response.validate_invoice_preimage256(preimage.sha256){
                return Err(S5Error::new(ErrorKind::BoltzApi, "Preimage used in response invoice does not match! Report to support!").into());
            }
            // let btc_swap_script = BtcSwapScript::submarine_from_str(&response.clone().redeem_script.unwrap()).unwrap();
        
            // let payment_address = match btc_swap_script.to_address(network.clone().into()){
            //     Ok(result)=>result.to_string(),
            //     Err(e)=>return Err(e.into())
            // };

            // if &payment_address != &response.clone().address.unwrap(){
            //     return Err(S5Error::new(ErrorKind::BoltzApi, "Payment address in response does not match constructed script! Report to support!").into());
            // }

            Ok(LbtcLnSwap::new(
                response.clone().id,
                swap_type,
                network,
                claim_keypair,
                preimage.into(),
                response.clone().redeem_script.unwrap(),
                response.clone().invoice.unwrap(),
                out_amount,
                response.clone().lockup_address.unwrap(),
                response.clone().blinding_key.unwrap(),
                electrum_url,
                boltz_url,
            ))

    }
    
    pub fn lbtc_ln_reverse_claim(swap: LbtcLnSwap, fee: u64)->anyhow::Result<String, BoltzError>{
        if swap.kind == SwapType::Submarine {
            return Err(S5Error::new(ErrorKind::Input, "Submarine swaps are not claimable").into());
        }
        else{
            ()
        }

        let script = match LBtcSwapScript::reverse_from_str(&swap.redeem_script, swap.blinding_key){
            Ok(result)=>result,
            Err(e)=> return Err(e.into())
        };
        let network_config = NetworkConfig::new(swap.network.clone().into(), &swap.electrum_url, true, true, false, None);
        // let script_balance = match script
        // .get_balance(network_config.clone()){
        //     Ok(result)=>result,
        //     Err(e)=> return Err(e.into())
        // };

        // if script_balance.0 > 0 || script_balance.1 > 0 {
            let mut tx = match LBtcSwapTx::new_claim(script, swap.out_address, fee as u32){
                Ok(result)=>result,
                Err(e)=> return Err(e.into())
            };
            let secp = Secp256k1::new();
            let signed = match tx.drain(
                CoreKeyPair::from_seckey_str(&secp, &swap.keys.secret_key).unwrap(), 
                BoltzPreImage::from_str(&swap.preimage.value).unwrap(), 
                network_config.clone()
            ){
                Ok(result)=>result,
                Err(e)=> return Err(e.into())
            };
            let txid = match tx.broadcast(signed, network_config){
                Ok(result)=>result,
                Err(e)=> return Err(e.into())
            };
            Ok(txid)
        // }
        // else{
        //     return Err(S5Error::new(ErrorKind::Script, "Script is not funded yet!").into());
        // }
    }

    pub fn swap_status(boltz_url: String, id: String)->anyhow::Result<String, BoltzError>{
        let boltz_client = BoltzApiClient::new(&boltz_url);
        // let network_config = NetworkConfig::new(network.into(), &electrum_url, true, true, false, None);
        match boltz_client.swap_status(SwapStatusRequest{id: id}) {
            Ok(result)=>Ok(result.status),
            Err(e)=> return Err(e.into())
        }
    }
    
}

// flutter_rust_bridge_codegen --rust-input rust/src/api.rs --dart-output lib/bridge_generated.dart --dart-decl-output lib/bridge_definitions.dart
