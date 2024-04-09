use std::str::FromStr;

use boltz_client::swaps::bitcoin::BtcSwapTx;
use boltz_client::swaps::liquid::LBtcSwapScript;
use boltz_client::swaps::liquid::LBtcSwapTx;
use boltz_client::Bolt11Invoice;
use boltz_client::Keypair;
use boltz_client::{network::electrum::ElectrumConfig, swaps::bitcoin::BtcSwapScript};
// use boltz_client::network::electrum::ElectrumConfig;
// use boltz_client::swaps::boltz;
use boltz_client::swaps::boltz::BoltzApiClient;
use boltz_client::swaps::boltz::CreateSwapRequest;
use boltz_client::swaps::boltz::SwapStatusRequest;
use boltz_client::util::error::ErrorKind;
use boltz_client::util::error::S5Error;
use boltz_client::util::secrets::Preimage;

use crate::types::BoltzError;
use crate::types::Chain;
use crate::types::DecodedInvoice;
use crate::types::KeyPair;
use crate::types::LbtcLnSwap;
use crate::types::SwapType;
use crate::types::{AllFees, BtcLnSwap, Limits, ReverseSwapFees, SubmarineSwapFees};
// use crate::types::PreImage;

pub struct Api {}

impl Api {
    pub fn swap_fees(boltz_url: String, output_amount: u64) -> anyhow::Result<AllFees, BoltzError> {
        let boltz_client = BoltzApiClient::new(&boltz_url);
        let boltz_pairs = match boltz_client.get_pairs() {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let btc_pair = boltz_pairs.get_btc_pair()?;
        let btc_limits = Limits {
            minimal: btc_pair.limits.minimal as u64,
            maximal: btc_pair.limits.maximal as u64,
        };
        let btc_submarine = SubmarineSwapFees {
            boltz_fees: btc_pair.fees.submarine_boltz(output_amount)?,
            lockup_fees_estimate: btc_pair.fees.submarine_lockup_estimate(),
            claim_fees: btc_pair.fees.submarine_claim()?,
        };
        let btc_reverse = ReverseSwapFees {
            boltz_fees: btc_pair.fees.reverse_boltz(output_amount)?,
            lockup_fees: btc_pair.fees.reverse_lockup()?,
            claim_fees_estimate: btc_pair.fees.reverse_claim_estimate(),
        };

        let lbtc_pair = boltz_pairs.get_lbtc_pair()?;
        let lbtc_limits = Limits {
            minimal: lbtc_pair.limits.minimal as u64,
            maximal: lbtc_pair.limits.maximal as u64,
        };
        let lbtc_submarine = SubmarineSwapFees {
            boltz_fees: lbtc_pair.fees.submarine_boltz(output_amount)?,
            lockup_fees_estimate: lbtc_pair.fees.submarine_lockup_estimate(),
            claim_fees: lbtc_pair.fees.submarine_claim()?,
        };
        let lbtc_reverse = ReverseSwapFees {
            boltz_fees: lbtc_pair.fees.reverse_boltz(output_amount)?,
            lockup_fees: lbtc_pair.fees.reverse_lockup()?,
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
    // Should take pair hash from previous call as input
    pub fn new_btc_ln_submarine(
        mnemonic: String,
        index: u64,
        invoice: String,
        network: Chain,
        electrum_url: String,
        boltz_url: String,
        pair_hash: String,
    ) -> anyhow::Result<BtcLnSwap, BoltzError> {
        let swap_type = SwapType::Submarine;
        let refund_keypair = match KeyPair::new(mnemonic, network.into(), index, swap_type) {
            Ok(keypair) => keypair,
            Err(err) => return Err(err.into()),
        };
        let boltz_client = BoltzApiClient::new(&boltz_url);
        // let network_config = ElectrumConfig::new(network.into(), &electrum_url, true, true, false, None);
        let boltz_pairs = match boltz_client.get_pairs() {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let btc_pair = boltz_pairs.get_btc_pair()?;
        if btc_pair.hash != pair_hash {
            return Err(BoltzError{
                kind: ErrorKind::Input.to_string(), 
                message: "Pair hash has updated. Check fees with boltz and use updated hash.".to_string()
            });
        }
        let swap_request = CreateSwapRequest::new_btc_submarine(
            &btc_pair.hash,
            &invoice,
            &refund_keypair.public_key,
        );
        let response = match boltz_client.create_swap(swap_request) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let preimage = match Preimage::from_invoice_str(&invoice) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let swap_script = match response.into_btc_sub_swap_script(
            &preimage,
            &refund_keypair.clone().into(),
            network.into(),
        ) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let script_address = swap_script.to_address(network.into())?.to_string();

        Ok(BtcLnSwap::new(
            response.get_id(),
            swap_type,
            network,
            refund_keypair,
            preimage.into(),
            response.get_redeem_script()?,
            invoice,
            script_address,
            response.get_funding_amount()?,
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
        pair_hash: String,
    ) -> anyhow::Result<BtcLnSwap, BoltzError> {
        let swap_type = SwapType::Reverse;
        let claim_keypair = match KeyPair::new(mnemonic, network.into(), index, swap_type) {
            Ok(keypair) => keypair,
            Err(err) => return Err(err.into()),
        };
        let preimage = Preimage::new();
        let boltz_client = BoltzApiClient::new(&boltz_url);
        // let network_config = ElectrumConfig::new(network.into(), &electrum_url, true, true, false, None);
        let boltz_pairs = match boltz_client.get_pairs() {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };

        let btc_pair = boltz_pairs.get_btc_pair()?;
        if btc_pair.hash != pair_hash {
            return Err(BoltzError{
                kind: ErrorKind::Input.to_string(), 
                message: "Pair hash has updated. Check fees with boltz and use updated hash.".to_string()
            });
        }
        let swap_request = CreateSwapRequest::new_btc_reverse_invoice_amt(
            &pair_hash,
            &preimage.sha256.to_string(),
            &claim_keypair.public_key,
            out_amount,
        );
        let response = match boltz_client.create_swap(swap_request) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };

        let ckp: Keypair = claim_keypair.clone().into();
        let swap_script = match response.into_btc_rev_swap_script(&preimage, &ckp, network.into()) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let script_address = swap_script.to_address(network.into())?.to_string();

        Ok(BtcLnSwap::new(
            response.get_id(),
            swap_type,
            network.into(),
            claim_keypair,
            preimage.into(),
            response.get_redeem_script().unwrap(),
            response.get_invoice().unwrap().to_string(),
            script_address,
            out_amount,
            electrum_url,
            boltz_url,
        ))
    }

    pub fn btc_ln_tx_size(swap: BtcLnSwap) -> anyhow::Result<usize, BoltzError> {
        if swap.kind == SwapType::Submarine {
            return Err(S5Error::new(ErrorKind::Input, "Submarine swaps are not claimable").into());
        } else {
            ()
        }
        let script = match BtcSwapScript::reverse_from_str(&swap.redeem_script) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let network_config =
            ElectrumConfig::new(swap.network.into(), &swap.electrum_url, true, true, 10);
        // okay to use script address, we are just chekcing size
        let tx = match BtcSwapTx::new_claim(script, swap.script_address, &network_config) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let ckp: Keypair = swap.keys.into();

        let size = match tx.size(&ckp, &swap.preimage.try_into().unwrap()) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        Ok(size)
    }

    pub fn btc_ln_reverse_claim(
        swap: BtcLnSwap,
        out_address: String,
        abs_fee: u64,
    ) -> anyhow::Result<String, BoltzError> {
        if swap.kind == SwapType::Submarine {
            return Err(S5Error::new(ErrorKind::Input, "Submarine swaps are not claimable").into());
        } else {
            ()
        }

        let script = match BtcSwapScript::reverse_from_str(&swap.redeem_script) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let network_config =
            ElectrumConfig::new(swap.network.into(), &swap.electrum_url, true, true, 10);
        let script_balance = match script.get_balance(&network_config) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };

        if script_balance.0 > 0 || script_balance.1 > 0 {
            let tx = match BtcSwapTx::new_claim(script, out_address, &network_config) {
                Ok(result) => result,
                Err(e) => return Err(e.into()),
            };
            let ckp: Keypair = swap.keys.into();
            let signed = match tx.sign_claim(&ckp, &swap.preimage.try_into().unwrap(), abs_fee) {
                Ok(result) => result,
                Err(e) => return Err(e.into()),
            };
            let txid = match tx.broadcast(signed, &network_config) {
                Ok(result) => result,
                Err(e) => return Err(e.into()),
            };
            Ok(txid)
        } else {
            return Err(S5Error::new(ErrorKind::Script, "Script is not funded yet!").into());
        }
    }
    
    pub fn btc_ln_submarine_refund(
        swap: BtcLnSwap,
        out_address: String,
        abs_fee: u64,
    ) -> anyhow::Result<String, BoltzError> {
        if swap.kind == SwapType::Reverse {
            return Err(S5Error::new(ErrorKind::Input, "Reverse swaps are not refundable").into());
        } else {
            ()
        }

        let script = match BtcSwapScript::submarine_from_str(&swap.redeem_script) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let network_config =
            ElectrumConfig::new(swap.network.into(), &swap.electrum_url, true, true, 10);
        let script_balance = match script.get_balance(&network_config) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };

        if script_balance.0 > 0 || script_balance.1 > 0 {
            let tx = match BtcSwapTx::new_refund(script, out_address, &network_config) {
                Ok(result) => result,
                Err(e) => return Err(e.into()),
            };
            let ckp: Keypair = swap.keys.into();
            let signed = match tx.sign_refund(&ckp, abs_fee) {
                Ok(result) => result,
                Err(e) => return Err(e.into()),
            };
            let txid = match tx.broadcast(signed, &network_config) {
                Ok(result) => result,
                Err(e) => return Err(e.into()),
            };
            Ok(txid)
        } else {
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
        pair_hash: String,
    ) -> anyhow::Result<LbtcLnSwap, BoltzError> {
        let swap_type = SwapType::Submarine;
        let refund_keypair = match KeyPair::new(mnemonic, network.into(), index, swap_type) {
            Ok(keypair) => keypair,
            Err(err) => return Err(err.into()),
        };
        let boltz_client = BoltzApiClient::new(&boltz_url);
        // let network_config = ElectrumConfig::new(network.into(), &electrum_url, true, true, false, None);
        let boltz_pairs = match boltz_client.get_pairs() {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };

        let lbtc_pair = boltz_pairs.get_lbtc_pair()?;
        if lbtc_pair.hash != pair_hash {
            return Err(BoltzError{
                kind: ErrorKind::Input.to_string(), 
                message: "Pair hash has updated. Check fees with boltz and use updated hash.".to_string()
            });
        }
        let swap_request =
            CreateSwapRequest::new_lbtc_submarine(&pair_hash, &invoice, &refund_keypair.public_key);
        let response = match boltz_client.create_swap(swap_request) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let preimage = match Preimage::from_invoice_str(&invoice) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };

        let script = match response.into_lbtc_sub_swap_script(
            &preimage,
            &refund_keypair.clone().into(),
            network.into(),
        ) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let out_address = script.to_address(network.into())?.to_string();

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
            refund_keypair,
            preimage.into(),
            response.get_redeem_script().unwrap(),
            invoice,
            response.get_funding_amount().unwrap(),
            out_address,
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
        pair_hash: String,
    ) -> anyhow::Result<LbtcLnSwap, BoltzError> {
        let swap_type = SwapType::Reverse;
        let claim_keypair = match KeyPair::new(mnemonic, network.into(), index, swap_type) {
            Ok(keypair) => keypair,
            Err(err) => return Err(err.into()),
        };
        let preimage = Preimage::new();
        let boltz_client = BoltzApiClient::new(&boltz_url);
        // let network_config = ElectrumConfig::new(network.into(), &electrum_url, true, true, false, None);
        let boltz_pairs = match boltz_client.get_pairs() {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };

        let lbtc_pair = boltz_pairs.get_lbtc_pair()?;
        if lbtc_pair.hash != pair_hash {
            return Err(BoltzError{
                kind: ErrorKind::Input.to_string(), 
                message: "Pair hash has updated. Check fees with boltz and use updated hash.".to_string()
            });
        }
        let swap_request = CreateSwapRequest::new_lbtc_reverse_invoice_amt(
            pair_hash,
            preimage.sha256.to_string(),
            claim_keypair.clone().public_key,
            out_amount,
        );
        let response = match boltz_client.create_swap(swap_request) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let ckp = claim_keypair.clone().into();
        let script = match response.into_lbtc_rev_swap_script(&preimage, &ckp, network.into()) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let out_address = script.to_address(network.into()).unwrap().to_string();
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
            response.get_redeem_script().unwrap(),
            response.get_invoice()?.to_string(),
            out_amount,
            out_address,
            response.get_blinding_key()?,
            electrum_url,
            boltz_url,
        ))
    }

    pub fn lbtc_ln_tx_size(swap: LbtcLnSwap) -> anyhow::Result<usize, BoltzError> {
        if swap.kind == SwapType::Submarine {
            return Err(S5Error::new(ErrorKind::Input, "Submarine swaps are not claimable").into());
        } else {
            ()
        }
        let script = match LBtcSwapScript::reverse_from_str(&swap.redeem_script, &swap.blinding_key)
        {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let network_config =
            ElectrumConfig::new(swap.network.into(), &swap.electrum_url, true, true, 10);
        let tx = match LBtcSwapTx::new_claim(script, swap.script_address, &network_config) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let size = match tx.size(&swap.keys.into(), &swap.preimage.try_into().unwrap()) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        Ok(size)
    }

    pub fn lbtc_ln_reverse_claim(
        swap: LbtcLnSwap,
        out_address: String,
        abs_fee: u64,
    ) -> anyhow::Result<String, BoltzError> {
        if swap.kind == SwapType::Submarine {
            return Err(S5Error::new(ErrorKind::Input, "Submarine swaps are not claimable").into());
        } else {
            ()
        }
        let script = match LBtcSwapScript::reverse_from_str(&swap.redeem_script, &swap.blinding_key)
        {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let network_config =
            ElectrumConfig::new(swap.network.into(), &swap.electrum_url, true, true, 10);

        // if script_balance.0 > 0 || script_balance.1 > 0 {
        let mut tx = match LBtcSwapTx::new_claim(script, out_address, &network_config) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };

        let signed = match tx.sign_claim(
            &swap.keys.into(),
            &swap.preimage.try_into().unwrap(),
            abs_fee,
        ) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let txid = match tx.broadcast(signed, &network_config) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        Ok(txid)
        // }
        // else{
        //     return Err(S5Error::new(ErrorKind::Script, "Script is not funded yet!").into());
        // }
    }

    pub fn lbtc_ln_submarine_refund(
        swap: LbtcLnSwap,
        out_address: String,
        abs_fee: u64,
    ) -> anyhow::Result<String, BoltzError> {
        if swap.kind == SwapType::Reverse {
            return Err(S5Error::new(ErrorKind::Input, "Reverse swaps are not refundable").into());
        } else {
            ()
        }

        let script = match LBtcSwapScript::submarine_from_str(&swap.redeem_script, &swap.blinding_key) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let network_config =
            ElectrumConfig::new(swap.network.into(), &swap.electrum_url, true, true, 10);

        let mut tx = match LBtcSwapTx::new_refund(script, out_address, &network_config) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let ckp: Keypair = swap.keys.into();
        let signed = match tx.sign_refund(&ckp, abs_fee) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let txid = match tx.broadcast(signed, &network_config) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        Ok(txid)

    }

    pub fn swap_status(boltz_url: String, id: String) -> anyhow::Result<String, BoltzError> {
        let boltz_client = BoltzApiClient::new(&boltz_url);
        // let network_config = ElectrumConfig::new(network.into(), &electrum_url, true, true, false, None);
        match boltz_client.swap_status(SwapStatusRequest { id: id }) {
            Ok(result) => Ok(result.status),
            Err(e) => return Err(e.into()),
        }
    }

    pub fn decode_invoice(invoice_str: String)->anyhow::Result<DecodedInvoice, BoltzError>{
        let invoice = match Bolt11Invoice::from_str(&invoice_str){
            Ok(result)=>result,
            Err(e) => return Err(BoltzError{kind: ErrorKind::Input.to_string(), message: e.to_string()})
        };
        Ok(invoice.into())
    }
}

// flutter_rust_bridge_codegen --rust-input rust/src/api.rs --dart-output lib/bridge_generated.dart --dart-decl-output lib/bridge_definitions.dart
