use super::{
    error::BoltzError,
    types::{Chain, KeyPair, PreImage, SwapType},
};
use boltz_client::{
    network::electrum::ElectrumConfig, swaps::boltz::{BoltzApiClient, CreateSwapRequest}, util::secrets::Preimage, BtcSwapScript, BtcSwapTx, Keypair
};
use flutter_rust_bridge::frb;

#[frb(dart_metadata=("freezed"))]
pub struct BtcLnSwap {
    pub id: String,
    pub kind: SwapType,
    pub network: Chain,
    pub keys: KeyPair,
    pub preimage: PreImage,
    pub redeem_script: String,
    pub invoice: String,
    pub script_address: String,
    pub out_amount: u64,
    pub electrum_url: String,
    pub boltz_url: String,
}
impl BtcLnSwap {
    pub fn new(
        id: String,
        kind: SwapType,
        network: Chain,
        keys: KeyPair,
        preimage: PreImage,
        redeem_script: String,
        invoice: String,
        script_address: String,
        out_amount: u64,
        electrum_url: String,
        boltz_url: String,
    ) -> BtcLnSwap {
        BtcLnSwap {
            id,
            kind,
            network,
            keys,
            preimage,
            redeem_script,
            invoice,
            electrum_url,
            boltz_url,
            script_address,
            out_amount,
        }
    }

    pub fn create_submarine_v1(
        mnemonic: String,
        index: u64,
        invoice: String,
        network: Chain,
        electrum_url: String,
        boltz_url: String,
        pair_hash: String,
    ) -> Result<BtcLnSwap, BoltzError> {
        let swap_type = SwapType::Submarine;
        let refund_keypair = match KeyPair::new(mnemonic, network.into(), index, swap_type) {
            Ok(keypair) => keypair,
            Err(err) => return Err(err.into()),
        };
        let boltz_client = BoltzApiClient::new(&boltz_url);

        let boltz_pairs = match boltz_client.get_pairs() {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let btc_pair = boltz_pairs.get_btc_pair().unwrap();
        if btc_pair.hash != pair_hash {
            return Err(BoltzError {
                kind: "Input".to_string(),
                message: "Pair hash has updated. Check fees with boltz and use updated hash."
                    .to_string(),
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

    pub fn create_reverse_v1(
        mnemonic: String,
        index: u64,
        out_amount: u64,
        network: Chain,
        electrum_url: String,
        boltz_url: String,
        pair_hash: String,
    ) -> Result<BtcLnSwap, BoltzError> {
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

        let btc_pair = boltz_pairs.get_btc_pair().unwrap();
        if btc_pair.hash != pair_hash {
            return Err(BoltzError {
                kind: "Input".to_string(),
                message: "Pair hash has updated. Check fees with boltz and use updated hash."
                    .to_string(),
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

    pub fn reverse_v1_claim(
        &self,
        out_address: String,
        abs_fee: u64,
    ) -> Result<String, BoltzError> {
        if self.kind == SwapType::Submarine {
            return Err(BoltzError{kind: "Input".to_string(),message: "Submarine swaps are not claimable".to_string()});
        } else {
            ()
        }

        let script = match BtcSwapScript::reverse_from_str(&self.redeem_script) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let network_config =
            ElectrumConfig::new(self.network.into(), &self.electrum_url, true, true, 10);
        let script_balance = match script.get_balance(&network_config) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };

        if script_balance.0 > 0 || script_balance.1 > 0 {
            let tx = match BtcSwapTx::new_claim(script, out_address, &network_config) {
                Ok(result) => result.unwrap(),
                Err(e) => return Err(e.into()),
            };
            let ckp: Keypair = self.keys.clone().into();
            let preimage = self.preimage.clone();
            let signed = match tx.sign_claim(&ckp, &preimage.try_into()?, abs_fee) {
                Ok(result) => result,
                Err(e) => return Err(e.into()),
            };
            let txid = match tx.broadcast(signed, &network_config) {
                Ok(result) => result,
                Err(e) => return Err(e.into()),
            };
            Ok(txid.to_string())
        } else {
            return Err(BoltzError{kind: "Script".to_string(), message: "Script is not funded yet!".to_string()});
        }
    }

    pub fn btc_ln_submarine_refund(
        &self,
        out_address: String,
        abs_fee: u64,
    ) -> Result<String, BoltzError> {
        if self.kind == SwapType::Reverse {
            return Err(BoltzError{kind: "Input".to_string(), message: "Reverse swaps are not refundable".to_string()});
        } else {
            ()
        }

        let script = match BtcSwapScript::submarine_from_str(&self.redeem_script) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let network_config =
            ElectrumConfig::new(self.network.into(), &self.electrum_url, true, true, 10);
        let script_balance = match script.get_balance(&network_config) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };

        if script_balance.0 > 0 || script_balance.1 > 0 {
            let tx = match BtcSwapTx::new_refund(script, out_address, &network_config) {
                Ok(result) => result.unwrap(),
                Err(e) => return Err(e.into()),
            };
            let ckp: Keypair = self.keys.clone().into();
            let signed = match tx.sign_refund(&ckp, abs_fee) {
                Ok(result) => result,
                Err(e) => return Err(e.into()),
            };
            let txid = match tx.broadcast(signed, &network_config) {
                Ok(result) => result,
                Err(e) => return Err(e.into()),
            };
            Ok(txid.to_string())
        } else {
            return Err(BoltzError{kind: "Script".to_string(), message:"Script is not funded yet!".to_string()});
        }
    }

    pub fn tx_size(&self) -> Result<usize, BoltzError> {
        if self.kind == SwapType::Submarine {
            return Err(BoltzError{kind: "Input".to_string(), message: "Submarine swaps are not claimable".to_string()});
        } else {
            ()
        }
        let script = match BtcSwapScript::reverse_from_str(&self.redeem_script) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let network_config =
            ElectrumConfig::new(self.network.clone().into(), &self.electrum_url, true, true, 10);
        // okay to use script address, we are just chekcing size
        let tx = match BtcSwapTx::new_claim(script, self.script_address.clone(), &network_config) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let ckp: Keypair = self.keys.clone().into();

        let size = match tx.unwrap().size(&ckp, &self.preimage.clone().try_into()?) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        Ok(size)
    }
}
