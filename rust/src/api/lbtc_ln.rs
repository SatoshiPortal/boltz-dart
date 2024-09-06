use crate::util::check_protocol;

use super::{
    error::BoltzError,
    types::{Chain, KeyPair, LBtcSwapScriptStr, PreImage, SwapType},
};
use boltz_client::{
    bitcoin::{consensus::deserialize, Transaction, Txid},
    boltz::Cooperative,
    electrum_client::ElectrumApi,
    elements::hashes::hex::DisplayHex,
    network::electrum::ElectrumConfig,
    swaps::{boltz::BoltzApiClientV2, magic_routing},
    util::secrets::Preimage,
    Amount, Keypair, LBtcSwapScript, LBtcSwapTx, PublicKey, Serialize,
};
use flutter_rust_bridge::frb;
use hex::FromHex;
use serde_json::Value;

#[frb(dart_metadata=("freezed"))]
pub struct LbtcLnSwap {
    pub id: String,
    pub kind: SwapType,
    pub network: Chain,
    pub keys: KeyPair,
    pub key_index: u64,
    pub preimage: PreImage,
    pub swap_script: LBtcSwapScriptStr,
    pub invoice: String,
    pub out_amount: u64,
    pub script_address: String,
    pub blinding_key: String,
    pub electrum_url: String,
    pub boltz_url: String,
    pub referral_id: Option<String>,
}

impl LbtcLnSwap {
    pub fn new(
        id: String,
        kind: SwapType,
        network: Chain,
        keys: KeyPair,
        key_index: u64,
        preimage: PreImage,
        swap_script: LBtcSwapScriptStr,
        invoice: String,
        out_amount: u64,
        out_address: String,
        blinding_key: String,
        electrum_url: String,
        boltz_url: String,
        referral_id: Option<String>,
    ) -> LbtcLnSwap {
        LbtcLnSwap {
            id,
            kind,
            network,
            keys,
            key_index,
            preimage,
            swap_script,
            invoice,
            electrum_url,
            boltz_url,
            out_amount,
            blinding_key,
            script_address: out_address,
            referral_id: Some(referral_id.unwrap_or_default()),
        }
    }
    pub fn new_submarine(
        mnemonic: String,
        index: u64,
        invoice: String,
        network: Chain,
        electrum_url: String,
        boltz_url: String,
        referral_id: Option<String>,
        // pair_hash: String,
    ) -> Result<LbtcLnSwap, BoltzError> {
        let swap_type = SwapType::Submarine;
        let refund_keypair = match KeyPair::generate(mnemonic, network.into(), index, swap_type) {
            Ok(keypair) => keypair,
            Err(err) => return Err(err.into()),
        };
        let swap_type = SwapType::Submarine;
        let refund_kps: Keypair = refund_keypair.clone().try_into()?;
        let preimage = match Preimage::from_invoice_str(&invoice) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let boltz_client = BoltzApiClientV2::new(&check_protocol(&boltz_url));
        let create_swap_req = boltz_client::swaps::boltz::CreateSubmarineRequest {
            from: "L-BTC".to_string(),
            to: "BTC".to_string(),
            invoice: invoice.to_string(),
            referral_id: referral_id.clone(),
            refund_public_key: refund_kps.public_key().into(),
            pair_hash: None,
            webhook: None,
        };
        let refund_pubkey = PublicKey {
            compressed: true,
            inner: refund_kps.public_key(),
        };
        let response = boltz_client.post_swap_req(&create_swap_req)?;
        response.validate(&invoice, &refund_pubkey, network.into())?;
        let swap_script =
            LBtcSwapScript::submarine_from_swap_resp(&response, refund_kps.public_key().into())?;
        let script_address = swap_script.to_address(network.into())?.to_string();
        Ok(LbtcLnSwap::new(
            response.id,
            swap_type,
            network,
            refund_keypair,
            index,
            preimage.into(),
            swap_script.clone().into(),
            invoice,
            response.expected_amount,
            script_address,
            swap_script.blinding_key.display_secret().to_string(),
            electrum_url,
            boltz_url,
            referral_id,
        ))
    }

    pub fn new_reverse(
        mnemonic: String,
        index: u64,
        out_amount: u64,
        out_address: Option<String>,
        network: Chain,
        electrum_url: String,
        boltz_url: String,
        referral_id: Option<String>,
        // pair_hash: String,
    ) -> Result<LbtcLnSwap, BoltzError> {
        let swap_type = SwapType::Reverse;
        let claim_keypair = match KeyPair::generate(mnemonic, network.into(), index, swap_type) {
            Ok(keypair) => keypair,
            Err(err) => return Err(err.into()),
        };
        let preimage = Preimage::new();
        let ckp: Keypair = claim_keypair.clone().try_into()?;
        let claim_public_key = PublicKey {
            compressed: true,
            inner: ckp.public_key(),
        };

        let boltz_client = BoltzApiClientV2::new(&check_protocol(&boltz_url));
        let create_reverse_req = if out_address.is_some() {
            let address = out_address.unwrap();
            boltz_client::swaps::boltz::CreateReverseRequest {
                invoice_amount: out_amount as u32,
                from: "BTC".to_string(),
                to: "L-BTC".to_string(),
                preimage_hash: preimage.sha256,
                claim_public_key,
                referral_id: referral_id.clone(),
                address: Some(address.clone()),
                address_signature: Some(magic_routing::sign_address(&address, &ckp)?.to_string()),
                description: None,
                description_hash: None,
                webhook: None,
            }
        } else {
            boltz_client::swaps::boltz::CreateReverseRequest {
                invoice_amount: out_amount as u32,
                from: "BTC".to_string(),
                to: "L-BTC".to_string(),
                preimage_hash: preimage.sha256,
                claim_public_key,
                referral_id: referral_id.clone(),
                address: None,
                address_signature: None,
                description: None,
                description_hash: None,
                webhook: None,
            }
        };
        let response = boltz_client.post_reverse_req(create_reverse_req)?;
        response.validate(&preimage, &claim_public_key, network.into())?;
        let swap_script = LBtcSwapScript::reverse_from_swap_resp(&response, claim_public_key)?;
        let script_address = swap_script.to_address(network.into())?.to_string();
        Ok(LbtcLnSwap::new(
            response.id,
            swap_type,
            network,
            claim_keypair,
            index,
            preimage.into(),
            swap_script.clone().into(),
            response.invoice,
            out_amount,
            script_address,
            swap_script.blinding_key.display_secret().to_string(),
            electrum_url,
            boltz_url,
            referral_id,
        ))
    }
    pub fn coop_close_submarine(&self) -> Result<(), BoltzError> {
        let network_config =
            ElectrumConfig::new(self.network.into(), &self.electrum_url, true, true, 10);
        let boltz_client = BoltzApiClientV2::new(&check_protocol(&self.boltz_url));
        let swap_script: LBtcSwapScript = self.swap_script.clone().try_into()?;
        // WE SHOULD NOT NEED TO MAKE A TX, JUST A SCRIPT
        let tx = match LBtcSwapTx::new_refund(
            swap_script,
            &self.script_address,
            &network_config,
            check_protocol(&self.boltz_url.clone()),
            self.id.clone(),
        ) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let ckp: Keypair = self.keys.clone().try_into()?;
        let claim_tx_response = boltz_client.get_submarine_claim_tx_details(&self.id)?;
        let (partial_sig, pub_nonce) = tx.partial_sign(
            &ckp,
            &claim_tx_response.pub_nonce,
            &claim_tx_response.transaction_hash,
        )?;
        boltz_client.post_submarine_claim_tx_details(&self.id, pub_nonce, partial_sig)?;
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
        let id: String = self.id.clone();
        let boltz_client = BoltzApiClientV2::new(&check_protocol(&self.boltz_url));
        let swap_script: LBtcSwapScript = self.swap_script.clone().try_into()?;
        let tx = match LBtcSwapTx::new_claim(
            swap_script,
            out_address,
            &network_config,
            check_protocol(&self.boltz_url.clone()),
            self.id.clone(),
        ) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let ckp: Keypair = self.keys.clone().try_into()?;
        let preimage = self.preimage.clone();
        let signed = match tx.sign_claim(
            &ckp,
            &preimage.try_into()?,
            Amount::from_sat(abs_fee),
            if try_cooperate {
                Some(Cooperative {
                    boltz_api: &boltz_client,
                    swap_id: id,
                    pub_nonce: None,
                    partial_sig: None,
                })
            } else {
                None
            },
        ) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };

        Ok(signed.serialize().to_lower_hex_string())
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
        let swap_script: LBtcSwapScript = self.swap_script.clone().try_into()?;
        let boltz_client = BoltzApiClientV2::new(&check_protocol(&self.boltz_url));
        let id = self.id.clone();
        let tx = match LBtcSwapTx::new_refund(
            swap_script.clone(),
            &out_address,
            &network_config,
            check_protocol(&self.boltz_url.clone()),
            self.id.clone(),
        ) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let ckp: Keypair = self.keys.clone().try_into()?;
        let signed = match tx.sign_refund(
            &ckp,
            Amount::from_sat(abs_fee),
            if try_cooperate {
                Some(Cooperative {
                    boltz_api: &boltz_client,
                    swap_id: id,
                    pub_nonce: None,
                    partial_sig: None,
                })
            } else {
                None
            },
        ) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };

        Ok(signed.serialize().to_lower_hex_string())
    }

    pub fn broadcast_local(&self, signed_hex: String) -> Result<String, BoltzError> {
        let signed_bytes = Vec::from_hex(&signed_hex)
            .map_err(|e| BoltzError::new("HexDecode".to_string(), e.to_string()))?;
        let signed_tx: Transaction = match deserialize(&signed_bytes) {
            Ok(r) => r,
            Err(e) => return Err(BoltzError::new("Deserialize Tx".to_string(), e.to_string())),
        };
        let network_config =
            ElectrumConfig::new(self.network.into(), &self.electrum_url, true, true, 10);
        let txid: Txid = match network_config
            .build_client()?
            .transaction_broadcast(&signed_tx)
        {
            Ok(r) => r,
            Err(e) => return Err(BoltzError::new("Electrum".to_string(), e.to_string())),
        };
        Ok(txid.to_string())
    }

    pub fn broadcast_boltz(&self, signed_hex: String) -> Result<String, BoltzError> {
        let boltz_client = BoltzApiClientV2::new(&check_protocol(&self.boltz_url));
        let txid = match boltz_client.broadcast_tx(self.network.into(), &signed_hex) {
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
        let swap_script: LBtcSwapScript = self.swap_script.clone().try_into()?;

        let tx = match LBtcSwapTx::new_claim(
            swap_script.clone(),
            self.script_address.clone(),
            &network_config,
            check_protocol(&self.boltz_url.clone()),
            self.id.clone(),
        ) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let ckp: Keypair = self.keys.clone().try_into()?;

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

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_v2_reverse() {
        let mnemonic = "bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon".to_string();
        let index = 1;
        let out_amount = 100000;
        let out_address = None;
        let network = Chain::LiquidTestnet;
        let electrum_url = "blockstream.info:465".to_string();
        let boltz_url = "api.boltz.exchange/v2".to_string();
        let _ = LbtcLnSwap::new_reverse(
            mnemonic,
            index,
            out_amount,
            out_address,
            network,
            electrum_url,
            boltz_url,
            None,
        )
        .unwrap();
    }
}
