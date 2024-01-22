use boltz_client::{network::electrum::ElectrumConfig, swaps::bitcoin::BtcSwapScript};
use boltz_client::swaps::bitcoin::BtcSwapTx;
use boltz_client::swaps::liquid::LBtcSwapScript;
use boltz_client::swaps::liquid::LBtcSwapTx;
use boltz_client::util::secrets::Preimage as BoltzPreImage;
use boltz_client::{Keypair as CoreKeyPair, Secp256k1};
// use boltz_client::network::electrum::ElectrumConfig;
// use boltz_client::swaps::boltz;
use boltz_client::swaps::boltz::BoltzApiClient;
use boltz_client::swaps::boltz::CreateSwapRequest;
use boltz_client::swaps::boltz::SwapStatusRequest;
use boltz_client::util::error::ErrorKind;
use boltz_client::util::error::S5Error;
use boltz_client::util::secrets::Preimage;

use crate::types::{BtcLnSwap, SubmarineSwapFees, ReverseSwapFees, AllFees, Limits};
use crate::types::BoltzError;
use crate::types::LbtcLnSwap;
use crate::types::Chain;
use crate::types::SwapType;
use crate::types::KeyPair;
// use crate::types::PreImage;

pub struct Api {}

impl Api {
    pub fn swap_fees(boltz_url: String, output_amount: u64)->anyhow::Result<AllFees, BoltzError>{
        let boltz_client = BoltzApiClient::new(&boltz_url);
        let boltz_pairs = match boltz_client.get_pairs() {
            Ok(result)=>result,
            Err(e)=> return Err(e.into())
        };
        let btc_pair = boltz_pairs.get_btc_pair();
        let btc_limits = Limits {
            minimal: btc_pair.limits.minimal as u64,
            maximal: btc_pair.limits.maximal as u64,
        };
        let btc_submarine = SubmarineSwapFees{
            boltz_fees: btc_pair.fees.submarine_boltz(output_amount)?,
            lockup_fees_estimate: btc_pair.fees.submarine_lockup_estimate(),
            claim_fees: btc_pair.fees.submarine_claim()?
        };
        let btc_reverse = ReverseSwapFees{
            boltz_fees: btc_pair.fees.reverse_boltz(output_amount)?,
            lockup_fees: btc_pair.fees.reverse_lockup()?,
            claim_fees_estimate: btc_pair.fees.reverse_claim_estimate()
        };

        let lbtc_pair = boltz_pairs.get_lbtc_pair();
        let lbtc_limits = Limits {
            minimal: lbtc_pair.limits.minimal as u64,
            maximal: lbtc_pair.limits.maximal as u64,
        };
        let lbtc_submarine = SubmarineSwapFees{
            boltz_fees: lbtc_pair.fees.submarine_boltz(output_amount)?,
            lockup_fees_estimate: lbtc_pair.fees.submarine_lockup_estimate(),
            claim_fees: lbtc_pair.fees.submarine_claim()?
        };
        let lbtc_reverse = ReverseSwapFees{
            boltz_fees: lbtc_pair.fees.reverse_boltz(output_amount)?,
            lockup_fees: lbtc_pair.fees.reverse_lockup()?,
            claim_fees_estimate: lbtc_pair.fees.reverse_claim_estimate()
        };
       
        Ok(AllFees{btc_limits, lbtc_limits, btc_submarine,btc_reverse,lbtc_submarine,lbtc_reverse})
    }
    // Should take pair hash from previous call as input
    pub fn new_btc_ln_submarine(        
        mnemonic: String,
        index: u64,
        invoice: String,
        network: Chain,
        electrum_url: String,
        boltz_url: String,
    ) -> anyhow::Result<BtcLnSwap,BoltzError>{
            let swap_type = SwapType::Submarine;
            let refund_keypair = match KeyPair::new(mnemonic, network.clone().into(), index, swap_type.clone()) {
                Ok(keypair) => keypair,
                Err(err) => return Err(err.into()),
            };
            let boltz_client = BoltzApiClient::new(&boltz_url);
            // let network_config = ElectrumConfig::new(network.into(), &electrum_url, true, true, false, None);
            let boltz_pairs = match boltz_client.get_pairs() {
                Ok(result)=>result,
                Err(e)=> return Err(e.into())
            };
            let btc_pair = boltz_pairs.get_btc_pair();
            let swap_request = CreateSwapRequest::new_btc_submarine(btc_pair.hash, invoice.clone(), refund_keypair.clone().public_key);
            let response = match boltz_client.create_swap(swap_request){
                Ok(result)=>result,
                Err(e)=>return Err(e.into())
            };
            let preimage = match Preimage::from_invoice_str(&invoice){
                Ok(result)=>result,
                Err(e)=>return Err(e.into())
            };
            let swap_script = match response.into_btc_sub_swap_script(&preimage){
                Ok(result)=>result,
                Err(e)=>return Err(e.into())
            };

            Ok(BtcLnSwap::new(
                response.get_id(),
                swap_type,
                network.clone(),
                refund_keypair,
                preimage.into(),
                response.redeem_script.unwrap(),
                invoice,
                response.expected_amount.unwrap(),
                swap_script.to_address(network.into())?.to_string(),
                electrum_url,
                boltz_url,
            ))

    }
    
    pub fn new_btc_ln_reverse(        
        mnemonic: String,
        index: u64,
        out_amount: u64,
        network: Chain,
        electrum_url: String,
        boltz_url: String,
    ) -> anyhow::Result<BtcLnSwap,BoltzError>{
            let swap_type = SwapType::Reverse;
            let claim_keypair = match KeyPair::new(mnemonic, network.clone().into(), index, swap_type.clone()) {
                Ok(keypair) => keypair,
                Err(err) => return Err(err.into()),
            };
            let preimage = Preimage::new();
            let boltz_client = BoltzApiClient::new(&boltz_url);
            // let network_config = ElectrumConfig::new(network.into(), &electrum_url, true, true, false, None);
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

            let swap_request = CreateSwapRequest::new_btc_reverse_invoice_amt(pair_hash, preimage.sha256.to_string(), claim_keypair.clone().public_key, out_amount);
            let response = match boltz_client.create_swap(swap_request){
                Ok(result)=>result,
                Err(e)=>return Err(e.into())
            };
            let secp = Secp256k1::new();
            let core_keypair = CoreKeyPair::from_seckey_str(&secp, &claim_keypair.secret_key).unwrap();
            let swap_script = match response.into_btc_rev_swap_script(&preimage, core_keypair, network.clone().into()){
                Ok(result)=>result,
                Err(e)=>return Err(e.into())
            };

            // let btc_swap_script = BtcSwapScript::submarine_from_str(&response.clone().redeem_script.unwrap()).unwrap();
        
            // let payment_address = match btc_swap_script.to_address(network.clone().into()){
            //     Ok(result)=>result.to_string(),
            //     Err(e)=>return Err(e.into())
            // };

            // if &payment_address != &response.clone().address.unwrap(){
            //     return Err(S5Error::new(ErrorKind::BoltzApi, "Payment address in response does not match constructed script! Report to support!").into());
            // }

            Ok(BtcLnSwap::new(
                response.get_id(),
                swap_type,
                network.clone(),
                claim_keypair,
                preimage.into(),
                response.clone().redeem_script.unwrap(),
                response.get_invoice().unwrap().to_string(),
                out_amount,
                swap_script.to_address(network.into())?.to_string(),
                electrum_url,
                boltz_url,
            ))

    }
    
    pub fn btc_ln_tx_size(swap: BtcLnSwap)->anyhow::Result<usize, BoltzError>{
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
        let network_config = ElectrumConfig::new(swap.network.clone().into(), &swap.electrum_url, true, true,10);
        let mut tx = match BtcSwapTx::new_claim(script, swap.out_address, swap.network.into()){
            Ok(result)=>result,
            Err(e)=> return Err(e.into())
        };
        let secp = Secp256k1::new();
        let size = match tx.size(
            CoreKeyPair::from_seckey_str(&secp, &swap.keys.secret_key).unwrap(), 
            BoltzPreImage::from_str(&swap.preimage.value).unwrap(), 
        ){
            Ok(result)=>result,
            Err(e)=> return Err(e.into())
        };
        Ok(size)
    }

    pub fn btc_ln_reverse_claim(swap: BtcLnSwap, abs_fee: u64)->anyhow::Result<String, BoltzError>{
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
        let network_config = ElectrumConfig::new(swap.network.clone().into(), &swap.electrum_url, true, true,10);
        let script_balance = match script
        .get_balance(network_config.clone()){
            Ok(result)=>result,
            Err(e)=> return Err(e.into())
        };

        if script_balance.0 > 0 || script_balance.1 > 0 {
            let mut tx = match BtcSwapTx::new_claim(script, swap.out_address, swap.network.into()){
                Ok(result)=>result,
                Err(e)=> return Err(e.into())
            };
            let secp = Secp256k1::new();
            let signed = match tx.drain(
                CoreKeyPair::from_seckey_str(&secp, &swap.keys.secret_key).unwrap(), 
                BoltzPreImage::from_str(&swap.preimage.value).unwrap(), 
                abs_fee,
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
        network: Chain,
        electrum_url: String,
        boltz_url: String,
    ) -> anyhow::Result<LbtcLnSwap,BoltzError>{
            let swap_type = SwapType::Submarine;
            let refund_keypair = match KeyPair::new(mnemonic, network.clone().into(), index, swap_type.clone()) {
                Ok(keypair) => keypair,
                Err(err) => return Err(err.into()),
            };
            let boltz_client = BoltzApiClient::new(&boltz_url);
            // let network_config = ElectrumConfig::new(network.into(), &electrum_url, true, true, false, None);
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

            let swap_script = match response.into_lbtc_sub_swap_script(&preimage){
                Ok(result)=>result,
                Err(e)=>return Err(e.into())
            };
            // let btc_swap_script = BtcSwapScript::submarine_from_str(&response.clone().redeem_script.unwrap()).unwrap();
        
            // let payment_address = match btc_swap_script.to_address(network.clone().into()){
            //     Ok(result)=>result.to_string(),
            //     Err(e)=>return Err(e.into())
            // };

            // if &payment_address != &response.clone().address.unwrap(){
            //     return Err(S5Error::new(ErrorKind::BoltzApi, "Payment address in response does not match constructed script! Report to support!").into());
            // }

            Ok(LbtcLnSwap::new(
                response.get_id(),
                swap_type,
                network.clone(),
                refund_keypair,
                preimage.into(),
                response.clone().redeem_script.unwrap(),
                invoice,
                response.clone().expected_amount.unwrap(),
                swap_script.to_address(network.into())?.to_string(),
                "".to_string(),
                electrum_url,
                boltz_url,
            ))

    }
    
    pub fn new_lbtc_ln_reverse(        
        mnemonic: String,
        index: u64,
        out_amount: u64,
        network: Chain,
        electrum_url: String,
        boltz_url: String,
    ) -> anyhow::Result<LbtcLnSwap,BoltzError>{
            let swap_type = SwapType::Reverse;
            let claim_keypair = match KeyPair::new(mnemonic, network.clone().into(), index, swap_type.clone()) {
                Ok(keypair) => keypair,
                Err(err) => return Err(err.into()),
            };
            let preimage = Preimage::new();
            let boltz_client = BoltzApiClient::new(&boltz_url);
            // let network_config = ElectrumConfig::new(network.into(), &electrum_url, true, true, false, None);
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

            let swap_request = CreateSwapRequest::new_btc_reverse_invoice_amt(pair_hash, preimage.sha256.to_string(), claim_keypair.clone().public_key, out_amount);
            let response = match boltz_client.create_swap(swap_request){
                Ok(result)=>result,
                Err(e)=>return Err(e.into())
            };
            let secp = Secp256k1::new();
            let core_keypair = CoreKeyPair::from_seckey_str(&secp, &claim_keypair.secret_key).unwrap();
            let swap_script =  match response.into_lbtc_rev_swap_script(&preimage, &core_keypair, network.clone().into()){
                Ok(result)=>result,
                Err(e)=>return Err(e.into())
            };
            // let btc_swap_script = BtcSwapScript::submarine_from_str(&response.clone().redeem_script.unwrap()).unwrap();
        
            // let payment_address = match btc_swap_script.to_address(network.clone().into()){
            //     Ok(result)=>result.to_string(),
            //     Err(e)=>return Err(e.into())
            // };

            // if &payment_address != &response.clone().address.unwrap(){
            //     return Err(S5Error::new(ErrorKind::BoltzApi, "Payment address in response does not match constructed script! Report to support!").into());
            // }

            Ok(LbtcLnSwap::new(
                response.get_id(),
                swap_type,
                network,
                claim_keypair,
                preimage.into(),
                response.clone().redeem_script.unwrap(),
                response.get_invoice()?.to_string(),
                out_amount,
                response.clone().lockup_address.unwrap(),
                response.get_blinding_key()?,
                electrum_url,
                boltz_url,
            ))

    }
    
    pub fn lbtc_ln_tx_size(swap: LbtcLnSwap)->anyhow::Result<usize, BoltzError>{
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
        let network_config = ElectrumConfig::new(swap.network.clone().into(), &swap.electrum_url, true, true,10);
        let mut tx = match LBtcSwapTx::new_claim(script, swap.out_address){
            Ok(result)=>result,
            Err(e)=> return Err(e.into())
        };
        let _ = match tx.fetch_utxo(network_config){
            Ok(_)=>(),
            Err(e)=> return Err(e.into())
        }; // CAN WE MOCK THIS?
        let secp = Secp256k1::new();
        let size = match tx.size(
            CoreKeyPair::from_seckey_str(&secp, &swap.keys.secret_key).unwrap(), 
            BoltzPreImage::from_str(&swap.preimage.value).unwrap(), 
        ){
            Ok(result)=>result,
            Err(e)=> return Err(e.into())
        };
        Ok(size)
    }

    pub fn lbtc_ln_reverse_claim(swap: LbtcLnSwap, abs_fee: u64)->anyhow::Result<String, BoltzError>{
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
        let network_config = ElectrumConfig::new(swap.network.clone().into(), &swap.electrum_url, true, true,10);
        // let script_balance = match script
        // .get_balance(network_config.clone()){
        //     Ok(result)=>result,
        //     Err(e)=> return Err(e.into())
        // };

        // if script_balance.0 > 0 || script_balance.1 > 0 {
        let mut tx = match LBtcSwapTx::new_claim(script, swap.out_address){
            Ok(result)=>result,
            Err(e)=> return Err(e.into())
        };
        let _ = match tx.fetch_utxo(network_config.clone()){
            Ok(_)=>(),
            Err(e)=> return Err(e.into())
        };
        let secp = Secp256k1::new();
        let signed = match tx.drain(
            CoreKeyPair::from_seckey_str(&secp, &swap.keys.secret_key).unwrap(), 
            BoltzPreImage::from_str(&swap.preimage.value).unwrap(), 
            abs_fee
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
        // let network_config = ElectrumConfig::new(network.into(), &electrum_url, true, true, false, None);
        match boltz_client.swap_status(SwapStatusRequest{id: id}) {
            Ok(result)=>Ok(result.status),
            Err(e)=> return Err(e.into())
        }
    }  
}

// flutter_rust_bridge_codegen --rust-input rust/src/api.rs --dart-output lib/bridge_generated.dart --dart-decl-output lib/bridge_definitions.dart
