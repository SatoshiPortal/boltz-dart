use super::{error::BoltzError, types::{Chain, KeyPair, PreImage, SwapType}};
use boltz_client::{network::electrum::ElectrumConfig, swaps::{boltz::{BoltzApiClient, CreateSwapRequest}, liquid::{LBtcSwapScript, LBtcSwapTx}}, util::secrets::Preimage, Keypair};
use flutter_rust_bridge::frb;

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

        let lbtc_pair = boltz_pairs.get_lbtc_pair().unwrap();
        if lbtc_pair.hash != pair_hash {
            return Err(BoltzError{
                kind: "Input".to_string(), 
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
        //     return Err(BoltzError{kind: ErrorKind::BoltzApi, "Payment address in response does not match constructed script! Report to support!").into());
        // }

        Ok(LbtcLnV1Swap::new(
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

        let lbtc_pair = boltz_pairs.get_lbtc_pair().unwrap();
        if lbtc_pair.hash != pair_hash {
            return Err(BoltzError{
                kind: "Input".to_string(), 
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

        Ok(LbtcLnV1Swap::new(
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

    pub fn claim(
        &self,
        out_address: String,
        abs_fee: u64,
    ) -> Result<String, BoltzError> {
        if self.kind == SwapType::Submarine {
            return Err(BoltzError{kind: "Input".to_string(), message: "Submarine swaps are not claimable".to_string()});
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
        let txid = match tx.broadcast(signed, &network_config) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        Ok(txid)
    }

    pub fn refund(
        &self,
        out_address: String,
        abs_fee: u64,
    ) -> Result<String, BoltzError> {
        if self.kind == SwapType::Reverse {
            return Err(BoltzError{kind: "Input".to_string(), message: "Reverse swaps are not refundable".to_string()});
        } else {
            ()
        }

        let script = match LBtcSwapScript::submarine_from_str(&self.redeem_script, &self.blinding_key) {
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
        let txid = match tx.broadcast(signed, &network_config) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        Ok(txid)

    }

    pub fn tx_size(swap: LbtcLnV1Swap) -> Result<usize, BoltzError> {
        if swap.kind == SwapType::Submarine {
            return Err(BoltzError{kind: "Input".to_string(), message: "Submarine swaps are not claimable".to_string()});
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