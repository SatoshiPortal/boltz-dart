use crate::util::check_protocol;

use super::{
    error::BoltzError,
    types::{Chain, KeyPair, LBtcSwapScriptV2Str, PreImage, SwapType},
};
use boltz_client::{
    network::electrum::ElectrumConfig,
    swaps::{
        boltz::{BoltzApiClient, CreateSwapRequest},
        boltzv2::{BoltzApiClientV2, BOLTZ_MAINNET_URL_V2, BOLTZ_TESTNET_URL_V2},
        liquid::{LBtcSwapScript, LBtcSwapTx},
    },
    util::secrets::Preimage,
    Amount, Keypair, LBtcSwapScriptV2, LBtcSwapTxV2, PublicKey,
};
use elements::{hex::ToHex, pset::serialize::Serialize};
use flutter_rust_bridge::frb;
use serde_json::Value;

#[frb(dart_metadata=("freezed"))]
pub struct LbtcLnV1Swap {
    pub id: String,
    pub kind: SwapType,
    pub network: Chain,
    pub keys: KeyPair,
    pub preimage: PreImage,
    pub redeem_script: String,
    pub invoice: String,
    pub out_amount: u64,
    pub script_address: String,
    pub blinding_key: String,
    pub electrum_url: String,
    pub boltz_url: String,
}

impl LbtcLnV1Swap {
    pub fn new(
        id: String,
        kind: SwapType,
        network: Chain,
        keys: KeyPair,
        preimage: PreImage,
        redeem_script: String,
        invoice: String,
        out_amount: u64,
        out_address: String,
        blinding_key: String,
        electrum_url: String,
        boltz_url: String,
    ) -> LbtcLnV1Swap {
        LbtcLnV1Swap {
            id,
            kind,
            network,
            keys,
            preimage,
            redeem_script,
            invoice,
            electrum_url,
            boltz_url,
            out_amount,
            blinding_key,
            script_address: out_address,
        }
    }
    pub fn new_submarine(
        mnemonic: String,
        index: u64,
        invoice: String,
        network: Chain,
        electrum_url: String,
        boltz_url: String,
        pair_hash: String,
    ) -> Result<LbtcLnV1Swap, BoltzError> {
        let swap_type = SwapType::Submarine;
        let refund_keypair = match KeyPair::generate(mnemonic, network.into(), index, swap_type) {
            Ok(keypair) => keypair,
            Err(err) => return Err(err.into()),
        };
        let boltz_client = BoltzApiClient::new(&check_protocol(&boltz_url));
        // let network_config = ElectrumConfig::new(network.into(), &electrum_url, true, true, false, None);
        let boltz_pairs = match boltz_client.get_pairs() {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };

        let lbtc_pair = match boltz_pairs.get_lbtc_pair() {
            Some(result) => result,
            None => {
                return Err(BoltzError::new(
                    "BoltzApi".to_owned(),
                    "Could not get L-BTC pair".to_owned(),
                ))
            }
        };

        if lbtc_pair.hash != pair_hash {
            return Err(BoltzError {
                kind: "Input".to_string(),
                message: "Pair hash has updated. Check fees with boltz and use updated hash."
                    .to_string(),
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
        //     return Err(BoltzError{kind: ErrorKind::BoltzApi, "Payment address in response does not match constructed script! Report to support!").into());
        // }

        Ok(LbtcLnV1Swap::new(
            response.get_id(),
            swap_type,
            network,
            refund_keypair,
            preimage.into(),
            response.get_redeem_script()?,
            invoice,
            response.get_funding_amount()?,
            out_address,
            "".to_string(),
            electrum_url,
            boltz_url,
        ))
    }

    pub fn new_reverse(
        mnemonic: String,
        index: u64,
        out_amount: u64,
        network: Chain,
        electrum_url: String,
        boltz_url: String,
        pair_hash: String,
    ) -> Result<LbtcLnV1Swap, BoltzError> {
        let swap_type = SwapType::Reverse;
        let claim_keypair = match KeyPair::generate(mnemonic, network.into(), index, swap_type) {
            Ok(keypair) => keypair,
            Err(err) => return Err(err.into()),
        };

        let preimage = Preimage::new();
        let boltz_client = BoltzApiClient::new(&check_protocol(&boltz_url));
        // let network_config = ElectrumConfig::new(network.into(), &electrum_url, true, true, false, None);
        let boltz_pairs = match boltz_client.get_pairs() {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };

        let lbtc_pair = match boltz_pairs.get_lbtc_pair() {
            Some(result) => result,
            None => {
                return Err(BoltzError::new(
                    "BoltzApi".to_owned(),
                    "Could not get L-BTC pair".to_owned(),
                ))
            }
        };
        if lbtc_pair.hash != pair_hash {
            return Err(BoltzError {
                kind: "Input".to_string(),
                message: "Pair hash has updated. Check fees with boltz and use updated hash."
                    .to_string(),
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
        let out_address = script.to_address(network.into())?.to_string();

        Ok(LbtcLnV1Swap::new(
            response.get_id(),
            swap_type,
            network,
            claim_keypair,
            preimage.into(),
            response.get_redeem_script()?,
            response.get_invoice()?.to_string(),
            out_amount,
            out_address,
            response.get_blinding_key()?,
            electrum_url,
            boltz_url,
        ))
    }

    pub fn claim(&self, out_address: String, abs_fee: u64) -> Result<String, BoltzError> {
        if self.kind == SwapType::Submarine {
            return Err(BoltzError {
                kind: "Input".to_string(),
                message: "Submarine swaps are not claimable".to_string(),
            });
        } else {
            ()
        }
        let script = match LBtcSwapScript::reverse_from_str(&self.redeem_script, &self.blinding_key)
        {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let network_config =
            ElectrumConfig::new(self.network.into(), &self.electrum_url, true, true, 10);

        // if script_balance.0 > 0 || script_balance.1 > 0 {
        let tx = match LBtcSwapTx::new_claim(script, out_address, &network_config) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };

        let signed = match tx.sign_claim(
            &self.keys.clone().into(),
            &self.preimage.clone().try_into()?,
            abs_fee,
        ) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let boltz_url = if self.network == Chain::LiquidTestnet {
            BOLTZ_TESTNET_URL_V2
        } else {
            BOLTZ_MAINNET_URL_V2
        };
        let boltz_client = BoltzApiClientV2::new(boltz_url);
        let txid =
            match boltz_client.broadcast_tx(self.network.into(), &signed.serialize().to_hex()) {
                Ok(result) => result,
                Err(e) => return Err(e.into()),
            };
        Ok(extract_id(txid)?)
    }

    pub fn refund(&self, out_address: String, abs_fee: u64) -> Result<String, BoltzError> {
        if self.kind == SwapType::Reverse {
            return Err(BoltzError {
                kind: "Input".to_string(),
                message: "Reverse swaps are not refundable".to_string(),
            });
        } else {
            ()
        }

        let script =
            match LBtcSwapScript::submarine_from_str(&self.redeem_script, &self.blinding_key) {
                Ok(result) => result,
                Err(e) => return Err(e.into()),
            };
        let network_config =
            ElectrumConfig::new(self.network.into(), &self.electrum_url, true, true, 10);

        let tx = match LBtcSwapTx::new_refund(script, out_address, &network_config) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let ckp: Keypair = self.keys.clone().into();
        let signed = match tx.sign_refund(&ckp, abs_fee) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let boltz_url = if self.network == Chain::LiquidTestnet {
            BOLTZ_TESTNET_URL_V2
        } else {
            BOLTZ_MAINNET_URL_V2
        };
        let boltz_client = BoltzApiClientV2::new(boltz_url);
        let txid =
            match boltz_client.broadcast_tx(self.network.into(), &signed.serialize().to_hex()) {
                Ok(result) => result,
                Err(e) => return Err(e.into()),
            };
        Ok(extract_id(txid)?)
    }

    pub fn tx_size(swap: LbtcLnV1Swap) -> Result<usize, BoltzError> {
        if swap.kind == SwapType::Submarine {
            return Err(BoltzError {
                kind: "Input".to_string(),
                message: "Submarine swaps are not claimable".to_string(),
            });
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
        let size = match tx.size(&swap.keys.into(), &swap.preimage.try_into()?) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        Ok(size)
    }
}

#[frb(dart_metadata=("freezed"))]
pub struct LbtcLnV2Swap {
    pub id: String,
    pub kind: SwapType,
    pub network: Chain,
    pub keys: KeyPair,
    pub preimage: PreImage,
    pub swap_script: LBtcSwapScriptV2Str,
    pub invoice: String,
    pub out_amount: u64,
    pub script_address: String,
    pub blinding_key: String,
    pub electrum_url: String,
    pub boltz_url: String,
}

impl LbtcLnV2Swap {
    pub fn new(
        id: String,
        kind: SwapType,
        network: Chain,
        keys: KeyPair,
        preimage: PreImage,
        swap_script: LBtcSwapScriptV2Str,
        invoice: String,
        out_amount: u64,
        out_address: String,
        blinding_key: String,
        electrum_url: String,
        boltz_url: String,
    ) -> LbtcLnV2Swap {
        LbtcLnV2Swap {
            id,
            kind,
            network,
            keys,
            preimage,
            swap_script,
            invoice,
            electrum_url,
            boltz_url,
            out_amount,
            blinding_key,
            script_address: out_address,
        }
    }
    pub fn new_submarine(
        mnemonic: String,
        index: u64,
        invoice: String,
        network: Chain,
        electrum_url: String,
        boltz_url: String,
        // pair_hash: String,
    ) -> Result<LbtcLnV2Swap, BoltzError> {
        let swap_type = SwapType::Submarine;
        let refund_keypair = match KeyPair::generate(mnemonic, network.into(), index, swap_type) {
            Ok(keypair) => keypair,
            Err(err) => return Err(err.into()),
        };
        let swap_type = SwapType::Submarine;

        let refund_kps: Keypair = refund_keypair.clone().into();
        let preimage = match Preimage::from_invoice_str(&invoice) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let boltz_client = BoltzApiClientV2::new(&check_protocol(&boltz_url));
        let create_swap_req = boltz_client::swaps::boltzv2::CreateSubmarineRequest {
            from: "L-BTC".to_string(),
            to: "BTC".to_string(),
            invoice: invoice.to_string(),
            referral_id: None,
            refund_public_key: refund_kps.public_key().into(),
        };

        let response = boltz_client.post_swap_req(&create_swap_req)?;

        let swap_script =
            LBtcSwapScriptV2::submarine_from_swap_resp(&response, refund_kps.public_key().into())?;

        let script_address = swap_script.to_address(network.into())?.to_string();

        Ok(LbtcLnV2Swap::new(
            response.id,
            swap_type,
            network,
            refund_keypair,
            preimage.into(),
            swap_script.clone().into(),
            invoice,
            response.expected_amount,
            script_address,
            swap_script.blinding_key.display_secret().to_string(),
            electrum_url,
            boltz_url,
        ))
    }

    pub fn new_reverse(
        mnemonic: String,
        index: u64,
        out_amount: u64,
        network: Chain,
        electrum_url: String,
        boltz_url: String,
        // pair_hash: String,
    ) -> Result<LbtcLnV2Swap, BoltzError> {
        let swap_type = SwapType::Reverse;
        let claim_keypair = match KeyPair::generate(mnemonic, network.into(), index, swap_type) {
            Ok(keypair) => keypair,
            Err(err) => return Err(err.into()),
        };
        let preimage = Preimage::new();
        let ckp: Keypair = claim_keypair.clone().into();
        let claim_public_key = PublicKey {
            compressed: true,
            inner: ckp.public_key(),
        };

        let boltz_client = BoltzApiClientV2::new(&check_protocol(&boltz_url));
        // let network_config = ElectrumConfig::new(network.into(), &electrum_url, true, true, false, None);
        let create_reverse_req = boltz_client::swaps::boltzv2::CreateReverseRequest {
            invoice_amount: out_amount as u32,
            from: "BTC".to_string(),
            to: "L-BTC".to_string(),
            preimage_hash: preimage.sha256,
            claim_public_key,
            referral_id: None,
        };

        let response = boltz_client.post_reverse_req(create_reverse_req)?;

        let swap_script = LBtcSwapScriptV2::reverse_from_swap_resp(&response, claim_public_key)?;

        let script_address = swap_script.to_address(network.into())?.to_string();

        Ok(LbtcLnV2Swap::new(
            response.id,
            swap_type,
            network,
            claim_keypair,
            preimage.into(),
            swap_script.clone().into(),
            response.invoice,
            out_amount,
            script_address,
            swap_script.blinding_key.display_secret().to_string(),
            electrum_url,
            boltz_url,
        ))
    }
    pub fn coop_close_submarine(&self) -> Result<(), BoltzError> {
        let network_config =
            ElectrumConfig::new(self.network.into(), &self.electrum_url, true, true, 10);

        let boltz_client = BoltzApiClientV2::new(&check_protocol(&self.boltz_url));
        let swap_script: LBtcSwapScriptV2 = self.swap_script.clone().try_into()?;
        // WE SHOULD NOT NEED TO MAKE A TX, JUST A SCRIPT

        let tx = match LBtcSwapTxV2::new_refund(swap_script, &self.script_address, &network_config)
        {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let ckp: Keypair = self.keys.clone().into();

        let claim_tx_response = boltz_client.get_claim_tx_details(&self.id)?;

        let (partial_sig, pub_nonce) = tx.submarine_partial_sig(&ckp, &claim_tx_response)?;
        boltz_client.post_claim_tx_details(&self.id, pub_nonce, partial_sig)?;
        Ok(())
    }
    pub fn claim(
        &self,
        out_address: String,
        abs_fee: u64,
        try_cooperate: bool,
    ) -> Result<String, BoltzError> {
        if self.kind == SwapType::Submarine {
            return Err(BoltzError {
                kind: "Input".to_string(),
                message: "Submarine swaps are not claimable".to_string(),
            });
        } else {
            ()
        }

        let network_config =
            ElectrumConfig::new(self.network.into(), &self.electrum_url, true, true, 10);

        let boltz_client = BoltzApiClientV2::new(&check_protocol(&self.boltz_url));
        let swap_script: LBtcSwapScriptV2 = self.swap_script.clone().try_into()?;

        let tx = match LBtcSwapTxV2::new_claim(swap_script, out_address, &network_config) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let ckp: Keypair = self.keys.clone().into();
        let preimage = self.preimage.clone();
        let signed = match tx.sign_claim(
            &ckp,
            &preimage.try_into()?,
            Amount::from_sat(abs_fee),
            if try_cooperate {
                Some((&boltz_client, self.id.clone()))
            } else {
                None
            },
        ) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let txid =
            match boltz_client.broadcast_tx(self.network.into(), &signed.serialize().to_hex()) {
                Ok(result) => result,
                Err(e) => return Err(e.into()),
            };
        Ok(extract_id(txid)?)
    }

    pub fn refund(
        &self,
        out_address: String,
        abs_fee: u64,
        try_cooperate: bool,
    ) -> Result<String, BoltzError> {
        if self.kind == SwapType::Reverse {
            return Err(BoltzError {
                kind: "Input".to_string(),
                message: "Reverse swaps are not refundable".to_string(),
            });
        } else {
            ()
        }

        let network_config =
            ElectrumConfig::new(self.network.into(), &self.electrum_url, true, true, 10);
        let swap_script: LBtcSwapScriptV2 = self.swap_script.clone().try_into()?;
        let boltz_client = BoltzApiClientV2::new(&check_protocol(&self.boltz_url));
        let id = self.id.clone();
        // let script_balance = match swap_script.get_balance(&network_config) {
        //     Ok(result) => result,
        //     Err(e) => return Err(e.into()),
        // };
        let tx = match LBtcSwapTxV2::new_refund(swap_script.clone(), &out_address, &network_config)
        {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let ckp: Keypair = self.keys.clone().into();
        let signed = match tx.sign_refund(
            &ckp,
            Amount::from_sat(abs_fee),
            if try_cooperate {
                Some((&boltz_client, &id))
            } else {
                None
            },
        ) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let txid =
            match boltz_client.broadcast_tx(self.network.into(), &signed.serialize().to_hex()) {
                Ok(result) => result,
                Err(e) => return Err(e.into()),
            };
        Ok(extract_id(txid)?)
    }

    pub fn tx_size(&self) -> Result<usize, BoltzError> {
        if self.kind == SwapType::Submarine {
            return Err(BoltzError {
                kind: "Input".to_string(),
                message: "Submarine swaps are not claimable".to_string(),
            });
        } else {
            ()
        }
        let network_config = ElectrumConfig::new(
            self.network.clone().into(),
            &self.electrum_url,
            true,
            true,
            10,
        );
        let swap_script: LBtcSwapScriptV2 = self.swap_script.clone().try_into()?;

        let tx = match LBtcSwapTxV2::new_claim(
            swap_script.clone(),
            self.script_address.clone(),
            &network_config,
        ) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let ckp: Keypair = self.keys.clone().into();

        let size = match tx.size(&ckp, &self.preimage.clone().try_into()?) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        Ok(size)
    }
}

fn extract_id(response: Value) -> Result<String, BoltzError> {
    // Attempt to access the `id` field directly
    match response.get("id") {
        Some(id_value) if id_value.is_string() => Ok(id_value.as_str().unwrap().to_string()),
        _ => Err(BoltzError::new(
            "BoltzApi".to_string(),
            "TxId not found in boltz response".to_string(),
        )),
    }
}
