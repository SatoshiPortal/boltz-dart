use crate::util::{ensure_http_prefix, strip_tcp_prefix};

use super::{
    error::BoltzError,
    types::{Chain, KeyPair, LBtcSwapScriptStr, PreImage, SwapType, TxFee},
};
use boltz_client::{
    boltz::Cooperative,
    elements::{encode::Decodable, hashes::hex::DisplayHex, Transaction},
    network::{electrum::ElectrumLiquidClient, Chain as AllChains, LiquidClient},
    swaps::{boltz::BoltzApiClientV2, magic_routing},
    util::secrets::Preimage,
    Keypair, LBtcSwapScript, LBtcSwapTx, PublicKey, Serialize,
};
use flutter_rust_bridge::frb;
use serde_json::Value;

/// Liquid-Lightning Swap Class
#[derive(Clone, PartialEq, Eq, serde::Serialize, serde::Deserialize)]
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
    /// Convert instance to a JSON string.
    pub fn to_json(&self) -> Result<String, BoltzError> {
        match serde_json::to_string(self) {
            Ok(result) => Ok(result),
            Err(e) => Err(BoltzError::new("JSON".to_string(), e.to_string())),
        }
    }
    /// Parse from a JSON string.
    pub fn from_json(json_str: &str) -> Result<Self, BoltzError> {
        match serde_json::from_str(json_str) {
            Ok(result) => Ok(result),
            Err(e) => Err(BoltzError::new("JSON".to_string(), e.to_string())),
        }
    }
    /// Manually create the class. Primarily used when recovering a swap.
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
            electrum_url: strip_tcp_prefix(&electrum_url),
            boltz_url: ensure_http_prefix(&boltz_url),
            out_amount,
            blinding_key,
            script_address: out_address,
            referral_id: Some(referral_id.unwrap_or_default()),
        }
    }
    /// Used to create the class when starting a submarine swap to pay a lightning invoice with Liquid.
    /// Note: The mnemonic should be your wallets mnemonic, the library will derive the keys for the swap from the appropriate path.
    /// The client is expected to manage (increment) the use of index to ensure keys are not reused.
    pub async fn new_submarine(
        mnemonic: String,
        passphrase: Option<String>,
        index: u64,
        invoice: String,
        network: Chain,
        electrum_url: String,
        boltz_url: String,
        referral_id: Option<String>,
        // pair_hash: String,
    ) -> Result<LbtcLnSwap, BoltzError> {
        let swap_type = SwapType::Submarine;
        let refund_keypair =
            match KeyPair::generate(mnemonic, passphrase, network.into(), index, swap_type) {
                Ok(keypair) => keypair,
                Err(err) => return Err(err.into()),
            };
        let swap_type = SwapType::Submarine;
        let refund_kps: Keypair = refund_keypair.clone().try_into()?;
        let preimage = match Preimage::from_invoice_str(&invoice) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let boltz_client = BoltzApiClientV2::new(&ensure_http_prefix(&boltz_url));
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
        let response = boltz_client.post_swap_req(&create_swap_req).await?;
        response.validate(&invoice, &refund_pubkey, network.into())?;
        let swap_script =
            LBtcSwapScript::submarine_from_swap_resp(&response, refund_kps.public_key().into())?;
        let all_chains: AllChains = network.into();
        let liquid_chain = match all_chains {
            AllChains::Liquid(inner_chain) => inner_chain,
            _ => {
                return Err(BoltzError::new(
                    "ChainType".to_string(),
                    "Expected Liquid chain but got Bitcoin chain".to_string(),
                ))
            }
        };
        let script_address = swap_script.to_address(liquid_chain)?.to_string();
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
            strip_tcp_prefix(&electrum_url),
            ensure_http_prefix(&boltz_url),
            referral_id,
        ))
    }

    /// After boltz completes a submarine swap, call this function to close the swap cooperatively using Musig.
    /// If this function is not called within ~1 hour, the swap will be closed via the script path.
    /// The benefit of a cooperative close is that the onchain footprint is smaller and makes the transaction look like a single sig tx, while the script path spend is clearly a swap tx.
    pub async fn coop_close_submarine(&self) -> Result<(), BoltzError> {
        let all_chains: AllChains = self.network.into();
        let liquid_chain = match all_chains {
            AllChains::Liquid(inner_chain) => inner_chain,
            _ => {
                return Err(BoltzError::new(
                    "ChainType".to_string(),
                    "Expected Liquid chain but got Bitcoin chain".to_string(),
                ))
            }
        };
        let network_config =
            ElectrumLiquidClient::new(liquid_chain, &self.electrum_url, true, true, 10)?;
        let boltz_client = BoltzApiClientV2::new(&ensure_http_prefix(&self.boltz_url));
        let swap_script: LBtcSwapScript = self.swap_script.clone().try_into()?;
        // WE SHOULD NOT NEED TO MAKE A TX, JUST A SCRIPT
        let tx = match LBtcSwapTx::new_refund(
            swap_script,
            &self.script_address,
            &network_config,
            ensure_http_prefix(&self.boltz_url.clone()),
            self.id.clone(),
        )
        .await
        {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let ckp: Keypair = self.keys.clone().try_into()?;
        let claim_tx_response = boltz_client
            .get_submarine_claim_tx_details(&self.id)
            .await?;
        let (partial_sig, pub_nonce) = tx.partial_sign(
            &ckp,
            &claim_tx_response.pub_nonce,
            &claim_tx_response.transaction_hash,
        )?;
        boltz_client
            .post_submarine_claim_tx_details(&self.id, pub_nonce, partial_sig)
            .await?;

        Ok(())
    }

    /// Retrieves the preimage for a completed submarine swap.
    pub async fn get_completed_submarine_preimage(&self) -> Result<String, BoltzError> {
        let boltz_client = BoltzApiClientV2::new(&ensure_http_prefix(&self.boltz_url));
        let response = boltz_client
            .get_submarine_claim_tx_details(&self.id)
            .await?;
        let preimage = response.preimage.clone();
        Ok(preimage)
    }

    /// Used to create the class when starting a reverse swap to receive Liquid via Lightning.
    /// Note: The mnemonic should be your wallets mnemonic, the library will derive the keys for the swap from the appropriate path.
    /// The client is expected to manage (increment) the use of index to ensure keys are not reused.
    pub async fn new_reverse(
        mnemonic: String,
        passphrase: Option<String>,
        index: u64,
        out_amount: u64,
        out_address: Option<String>,
        network: Chain,
        electrum_url: String,
        boltz_url: String,
        description: Option<String>,
        referral_id: Option<String>,
        // pair_hash: String,
    ) -> Result<LbtcLnSwap, BoltzError> {
        let swap_type = SwapType::Reverse;
        let claim_keypair =
            match KeyPair::generate(mnemonic, passphrase, network.into(), index, swap_type) {
                Ok(keypair) => keypair,
                Err(err) => return Err(err.into()),
            };
        let preimage = Preimage::new();
        let ckp: Keypair = claim_keypair.clone().try_into()?;
        let claim_public_key = PublicKey {
            compressed: true,
            inner: ckp.public_key(),
        };

        let boltz_client = BoltzApiClientV2::new(&ensure_http_prefix(&boltz_url));
        let create_reverse_req = if out_address.is_some() {
            let address = out_address.unwrap();
            boltz_client::swaps::boltz::CreateReverseRequest {
                invoice_amount: out_amount,
                from: "BTC".to_string(),
                to: "L-BTC".to_string(),
                preimage_hash: preimage.sha256,
                claim_public_key,
                referral_id: referral_id.clone(),
                address: Some(address.clone()),
                address_signature: Some(magic_routing::sign_address(&address, &ckp)?.to_string()),
                description: description,
                description_hash: None,
                webhook: None,
            }
        } else {
            boltz_client::swaps::boltz::CreateReverseRequest {
                invoice_amount: out_amount,
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
        let all_chains: AllChains = network.into();
        let liquid_chain = match all_chains {
            AllChains::Liquid(inner_chain) => inner_chain,
            _ => {
                return Err(BoltzError::new(
                    "ChainType".to_string(),
                    "Expected Liquid chain but got Bitcoin chain".to_string(),
                ))
            }
        };
        let response = boltz_client.post_reverse_req(create_reverse_req).await?;
        response.validate(&preimage, &claim_public_key, network.into())?;
        let swap_script = LBtcSwapScript::reverse_from_swap_resp(&response, claim_public_key)?;
        let script_address = swap_script.to_address(liquid_chain)?.to_string();
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
            strip_tcp_prefix(&electrum_url),
            ensure_http_prefix(&boltz_url),
            referral_id,
        ))
    }
    /// Used to claim a reverse swap.
    pub async fn claim(
        &self,
        out_address: String,
        miner_fee: TxFee,
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
        let all_chains: AllChains = self.network.into();
        let liquid_chain = match all_chains {
            AllChains::Liquid(inner_chain) => inner_chain,
            _ => {
                return Err(BoltzError::new(
                    "ChainType".to_string(),
                    "Expected Liquid chain but got Bitcoin chain".to_string(),
                ))
            }
        };
        let network_config =
            ElectrumLiquidClient::new(liquid_chain, &self.electrum_url, true, true, 10)?;
        let id: String = self.id.clone();
        let boltz_client = BoltzApiClientV2::new(&ensure_http_prefix(&self.boltz_url));
        let swap_script: LBtcSwapScript = self.swap_script.clone().try_into()?;
        let tx = match LBtcSwapTx::new_claim(
            swap_script,
            out_address,
            &network_config,
            ensure_http_prefix(&self.boltz_url.clone()),
            self.id.clone(),
        )
        .await
        {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let ckp: Keypair = self.keys.clone().try_into()?;
        let preimage = self.preimage.clone();
        let signed = match tx
            .sign_claim(
                &ckp,
                &preimage.try_into()?,
                miner_fee.into(),
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
                true,
            )
            .await
        {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };

        Ok(signed.serialize().to_lower_hex_string())
    }

    /// Used to refund a failed submarine swap.
    pub async fn refund(
        &self,
        out_address: String,
        miner_fee: TxFee,
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
        let all_chains: AllChains = self.network.into();
        let liquid_chain = match all_chains {
            AllChains::Liquid(inner_chain) => inner_chain,
            _ => {
                return Err(BoltzError::new(
                    "ChainType".to_string(),
                    "Expected Liquid chain but got Bitcoin chain".to_string(),
                ))
            }
        };
        let network_config =
            ElectrumLiquidClient::new(liquid_chain, &self.electrum_url, true, true, 10)?;
        let swap_script: LBtcSwapScript = self.swap_script.clone().try_into()?;
        let boltz_client = BoltzApiClientV2::new(&ensure_http_prefix(&self.boltz_url));
        let id = self.id.clone();
        let tx = match LBtcSwapTx::new_refund(
            swap_script.clone(),
            &out_address,
            &network_config,
            ensure_http_prefix(&self.boltz_url.clone()),
            self.id.clone(),
        )
        .await
        {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let ckp: Keypair = self.keys.clone().try_into()?;
        let signed = match tx
            .sign_refund(
                &ckp,
                miner_fee.into(),
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
                true,
            )
            .await
        {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        Ok(signed.serialize().to_lower_hex_string())
    }
    /// Broadcast using your own electrum server that was used to create the swap
    pub async fn broadcast_local(&self, signed_hex: String) -> Result<String, BoltzError> {
        let signed_bytes = hex::decode(&signed_hex)
            .map_err(|e| BoltzError::new("HexDecode".to_string(), e.to_string()))?;
        let all_chains: AllChains = self.network.into();
        let liquid_chain = match all_chains {
            AllChains::Liquid(inner_chain) => inner_chain,
            _ => {
                return Err(BoltzError::new(
                    "ChainType".to_string(),
                    "Expected Liquid chain but got Bitcoin chain".to_string(),
                ))
            }
        };
        let network_config =
            ElectrumLiquidClient::new(liquid_chain, &self.electrum_url, true, true, 10)?;
        let transaction = Transaction::consensus_decode(&mut &signed_bytes[..])
            .map_err(|e| BoltzError::new("Bitcoin".to_string(), e.to_string()))?;
        let txid = match network_config.broadcast_tx(&transaction).await {
            Ok(r) => r,
            Err(e) => return Err(BoltzError::new("Electrum".to_string(), format!("{:?}", e))),
        };
        Ok(txid.to_string())
    }
    /// Broadcast using boltz's electrum server
    pub async fn broadcast_boltz(&self, signed_hex: String) -> Result<String, BoltzError> {
        let boltz_client = BoltzApiClientV2::new(&ensure_http_prefix(&self.boltz_url));
        let txid = match boltz_client
            .broadcast_tx(self.network.into(), &signed_hex)
            .await
        {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        Ok(extract_id(txid)?)
    }
    /// Get the size of the transaction. Can be used to estimate the absolute miner fees required, given a fee rate.
    pub async fn tx_size(&self, is_cooperative: bool) -> Result<usize, BoltzError> {
        if self.kind == SwapType::Submarine {
            return Err(BoltzError {
                kind: "Input".to_string(),
                message: "Submarine swaps are not claimable".to_string(),
            });
        } else {
            ()
        }
        let all_chains: AllChains = self.network.into();
        let liquid_chain = match all_chains {
            AllChains::Liquid(inner_chain) => inner_chain,
            _ => {
                return Err(BoltzError::new(
                    "ChainType".to_string(),
                    "Expected Liquid chain but got Bitcoin chain".to_string(),
                ))
            }
        };
        let network_config =
            ElectrumLiquidClient::new(liquid_chain, &self.electrum_url, true, true, 10)?;
        let swap_script: LBtcSwapScript = self.swap_script.clone().try_into()?;

        let tx = match LBtcSwapTx::new_claim(
            swap_script.clone(),
            self.script_address.clone(),
            &network_config,
            ensure_http_prefix(&self.boltz_url.clone()),
            self.id.clone(),
        )
        .await
        {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        let ckp: Keypair = self.keys.clone().try_into()?;

        let size = match tx.size(&ckp, is_cooperative, true) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        Ok(size)
    }
}
/// Helper method used to extract the txid from a JSON response
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
