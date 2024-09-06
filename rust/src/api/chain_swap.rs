use crate::util::{ensure_http_prefix, strip_tcp_prefix};

use super::{
    error::BoltzError,
    types::{
        BtcSwapScriptStr, Chain, ChainSwapDirection, KeyPair, LBtcSwapScriptStr, PreImage,
        SwapTxKind, SwapType,
    },
};

use boltz_client::{
    bitcoin::{
        consensus::{deserialize, serialize},
        hex::DisplayHex,
        Transaction, Txid,
    },
    boltz::{ChainSwapDetails, Cooperative, Side},
    electrum_client::ElectrumApi,
    error::Error,
    network::electrum::ElectrumConfig,
    swaps::boltz::BoltzApiClientV2,
    util::secrets::Preimage,
    Amount, BtcSwapScript, BtcSwapTx, Keypair, LBtcSwapScript, LBtcSwapTx, PublicKey, Serialize,
    ToHex,
};
use flutter_rust_bridge::frb;
use serde_json::Value;

#[frb(dart_metadata=("freezed"))]
pub struct ChainSwap {
    pub id: String,
    pub is_testnet: bool,
    pub direction: ChainSwapDirection,
    pub refund_keys: KeyPair,
    pub refund_index: u64,
    pub claim_keys: KeyPair,
    pub claim_index: u64,
    pub preimage: PreImage,
    pub btc_script_str: BtcSwapScriptStr,
    pub lbtc_script_str: LBtcSwapScriptStr,
    pub script_address: String,
    pub out_amount: u64,
    pub btc_electrum_url: String,
    pub lbtc_electrum_url: String,
    pub boltz_url: String,
    pub referral_id: Option<String>,
    pub blinding_key: String,
}
impl ChainSwap {
    pub fn new(
        id: String,
        is_testnet: bool,
        direction: ChainSwapDirection,
        refund_keys: KeyPair,
        refund_index: u64,
        claim_keys: KeyPair,
        claim_index: u64,
        preimage: PreImage,
        btc_script_str: BtcSwapScriptStr,
        lbtc_script_str: LBtcSwapScriptStr,
        script_address: String,
        out_amount: u64,
        btc_electrum_url: String,
        lbtc_electrum_url: String,
        boltz_url: String,
        referral_id: Option<String>,
        blinding_key: String,
    ) -> ChainSwap {
        ChainSwap {
            id,
            direction,
            is_testnet,
            refund_keys,
            refund_index,
            claim_keys,
            claim_index,
            preimage,
            btc_script_str,
            lbtc_script_str,
            btc_electrum_url: strip_tcp_prefix(&btc_electrum_url),
            lbtc_electrum_url: strip_tcp_prefix(&lbtc_electrum_url),
            boltz_url,
            script_address,
            out_amount,
            referral_id: Some(referral_id.unwrap_or_default()),
            blinding_key,
        }
    }
    pub fn new_swap(
        direction: ChainSwapDirection,
        mnemonic: String,
        index: u64,
        amount: u32,
        is_testnet: bool,
        btc_electrum_url: String,
        lbtc_electrum_url: String,
        boltz_url: String,
        referral_id: Option<String>,
    ) -> Result<ChainSwap, BoltzError> {
        let swap_type = SwapType::Chain;
        let (refund_network, claim_network) = if is_testnet {
            if direction == ChainSwapDirection::BtcToLbtc {
                (Chain::BitcoinTestnet, Chain::LiquidTestnet)
            } else {
                (Chain::LiquidTestnet, Chain::BitcoinTestnet)
            }
        } else {
            if direction == ChainSwapDirection::BtcToLbtc {
                (Chain::Bitcoin, Chain::Liquid)
            } else {
                (Chain::Liquid, Chain::Bitcoin)
            }
        };
        let refund_keypair =
            match KeyPair::generate(mnemonic.clone(), refund_network.into(), index, swap_type) {
                Ok(keypair) => keypair,
                Err(err) => return Err(err.into()),
            };
        let refund_kps: Keypair = refund_keypair.clone().try_into()?;
        let refund_public_key = PublicKey {
            inner: refund_kps.public_key(),
            compressed: true,
        };
        let claim_keypair =
            match KeyPair::generate(mnemonic, claim_network.into(), index + 1, swap_type) {
                Ok(keypair) => keypair,
                Err(err) => return Err(err.into()),
            };
        let claim_kps: Keypair = claim_keypair.clone().try_into()?;

        let claim_public_key = PublicKey {
            compressed: true,
            inner: claim_kps.public_key(),
        };
        let preimage = Preimage::new();
        let boltz_client = BoltzApiClientV2::new(&ensure_http_prefix(&boltz_url));
        match direction {
            ChainSwapDirection::BtcToLbtc => {
                let create_swap_req = boltz_client::swaps::boltz::CreateChainRequest {
                    from: "BTC".to_string(),
                    to: "L-BTC".to_string(),
                    preimage_hash: preimage.sha256,
                    claim_public_key: Some(claim_public_key),
                    refund_public_key: Some(refund_public_key),
                    referral_id: None,
                    user_lock_amount: Some(amount),
                    server_lock_amount: None,
                    pair_hash: None,
                    webhook: None, // Add address signature here.
                };
                let create_chain_response = boltz_client.post_chain_req(create_swap_req)?;
                let lockup_details: ChainSwapDetails = create_chain_response.clone().lockup_details;
                let lockup_script = BtcSwapScript::chain_from_swap_resp(
                    Side::Lockup,
                    lockup_details.clone(),
                    refund_public_key,
                )?;
                let lockup_chain = if is_testnet {
                    Chain::BitcoinTestnet
                } else {
                    Chain::Bitcoin
                };
                let lockup_address = lockup_script.clone().to_address(lockup_chain.into())?;
                if lockup_address.clone().to_string()
                    != lockup_details.clone().lockup_address.to_string()
                {
                    return Err(Error::Address("Lockup Address Mismatch".to_owned()).into());
                }
                let claim_details: ChainSwapDetails = create_chain_response.claim_details;
                let claim_script = LBtcSwapScript::chain_from_swap_resp(
                    Side::Claim,
                    claim_details.clone(),
                    claim_public_key,
                )?;
                Ok(ChainSwap::new(
                    create_chain_response.id,
                    is_testnet,
                    direction,
                    refund_keypair,
                    index,
                    claim_keypair,
                    index + 1,
                    preimage.into(),
                    lockup_script.into(),
                    claim_script.clone().into(),
                    lockup_address.to_string(),
                    create_chain_response.lockup_details.amount as u64,
                    strip_tcp_prefix(&btc_electrum_url),
                    strip_tcp_prefix(&lbtc_electrum_url),
                    boltz_url,
                    referral_id,
                    claim_script.blinding_key.display_secret().to_string(),
                ))
            }
            ChainSwapDirection::LbtcToBtc => {
                let create_swap_req = boltz_client::swaps::boltz::CreateChainRequest {
                    from: "L-BTC".to_string(),
                    to: "BTC".to_string(),
                    preimage_hash: preimage.sha256,
                    claim_public_key: Some(claim_public_key),
                    refund_public_key: Some(refund_public_key),
                    referral_id: None,
                    user_lock_amount: Some(amount),
                    server_lock_amount: None,
                    pair_hash: None, // Add address signature here.
                    webhook: None,
                };
                let create_chain_response = boltz_client.post_chain_req(create_swap_req)?;
                let lockup_details: ChainSwapDetails = create_chain_response.clone().lockup_details;
                let lockup_script = LBtcSwapScript::chain_from_swap_resp(
                    Side::Lockup,
                    lockup_details.clone(),
                    refund_public_key,
                )?;
                let lockup_chain = if is_testnet {
                    Chain::LiquidTestnet
                } else {
                    Chain::Liquid
                };
                let lockup_address = lockup_script.clone().to_address(lockup_chain.into())?;
                if lockup_address.clone().to_string()
                    != lockup_details.clone().lockup_address.to_string()
                {
                    return Err(Error::Address("Lockup Address Mismatch".to_owned()).into());
                }
                let claim_details: ChainSwapDetails = create_chain_response.claim_details;
                let claim_script = BtcSwapScript::chain_from_swap_resp(
                    Side::Claim,
                    claim_details.clone(),
                    claim_public_key,
                )?;
                Ok(ChainSwap::new(
                    create_chain_response.id,
                    is_testnet,
                    direction,
                    refund_keypair,
                    index,
                    claim_keypair,
                    index + 1,
                    preimage.into(),
                    claim_script.into(),
                    lockup_script.clone().into(),
                    lockup_address.to_string(),
                    create_chain_response.lockup_details.amount as u64,
                    strip_tcp_prefix(&btc_electrum_url),
                    strip_tcp_prefix(&lbtc_electrum_url),
                    boltz_url,
                    referral_id,
                    lockup_script.blinding_key.display_secret().to_string(),
                ))
            }
        }
    }

    pub fn get_server_lockup(&self) -> Result<String, BoltzError> {
        let boltz_client = BoltzApiClientV2::new(&ensure_http_prefix(&self.boltz_url));
        let txs = boltz_client.get_chain_txs(&self.id.clone())?;
        if txs.server_lock.is_none() {
            Err(BoltzError::new(
                "Not Found".to_string(),
                "No Server Lockup Tx Detected.".to_string(),
            ))
        } else {
            Ok(txs.server_lock.unwrap().transaction.id)
        }
    }

    pub fn get_user_lockup(&self) -> Result<String, BoltzError> {
        let boltz_client = BoltzApiClientV2::new(&ensure_http_prefix(&self.boltz_url));
        let txs = boltz_client.get_chain_txs(&self.id.clone())?;
        if txs.user_lock.is_none() {
            Err(BoltzError::new(
                "Not Found".to_string(),
                "No User Lockup Tx Detected.".to_string(),
            ))
        } else {
            Ok(txs.user_lock.unwrap().transaction.id)
        }
    }

    pub fn claim(
        &self,
        out_address: String,
        refund_address: String,
        abs_fee: u64,
        try_cooperate: bool,
    ) -> Result<String, BoltzError> {
        let btc_chain = if self.is_testnet {
            Chain::BitcoinTestnet
        } else {
            Chain::Bitcoin
        };
        let lbtc_chain = if self.is_testnet {
            Chain::LiquidTestnet
        } else {
            Chain::Liquid
        };
        let id: String = self.id.clone();
        let btc_network_config =
            ElectrumConfig::new(btc_chain.into(), &self.btc_electrum_url, true, true, 10);
        let lbtc_network_config =
            ElectrumConfig::new(lbtc_chain.into(), &self.lbtc_electrum_url, true, true, 10);
        let boltz_client = BoltzApiClientV2::new(&ensure_http_prefix(&self.boltz_url));

        match self.direction {
            ChainSwapDirection::BtcToLbtc => {
                let lbtc_claim_script: LBtcSwapScript = self.lbtc_script_str.clone().try_into()?;
                let claim_tx: LBtcSwapTx = LBtcSwapTx::new_claim(
                    lbtc_claim_script.clone(),
                    out_address.clone(),
                    &lbtc_network_config,
                    ensure_http_prefix(&self.boltz_url),
                    id.clone(),
                )?;
                let ckp: Keypair = self.claim_keys.clone().try_into()?;
                let preimage = self.preimage.clone();
                if try_cooperate {
                    let btc_lockup_script: BtcSwapScript =
                        self.btc_script_str.clone().try_into()?;
                    let refund_tx = BtcSwapTx::new_refund(
                        btc_lockup_script.clone(),
                        &refund_address,
                        &btc_network_config,
                        self.boltz_url.clone(),
                        self.id.clone(),
                    )?;
                    let claim_tx_response = boltz_client.get_chain_claim_tx_details(&id)?;
                    let rkp: Keypair = self.refund_keys.clone().try_into()?;
                    let (partial_sig, pub_nonce) = refund_tx.partial_sign(
                        &rkp,
                        &claim_tx_response.pub_nonce,
                        &claim_tx_response.transaction_hash,
                    )?;
                    let signed = match claim_tx.sign_claim(
                        &ckp,
                        &preimage.try_into()?,
                        Amount::from_sat(abs_fee),
                        Some(Cooperative {
                            boltz_api: &boltz_client,
                            swap_id: id,
                            pub_nonce: Some(pub_nonce),
                            partial_sig: Some(partial_sig),
                        }),
                    ) {
                        Ok(result) => result,
                        Err(e) => return Err(e.into()),
                    };
                    Ok(signed.serialize().to_lower_hex_string())
                } else {
                    let signed = match claim_tx.sign_claim(
                        &ckp,
                        &preimage.try_into()?,
                        Amount::from_sat(abs_fee),
                        None,
                    ) {
                        Ok(result) => result,
                        Err(e) => return Err(e.into()),
                    };
                    Ok(signed.serialize().to_lower_hex_string())
                }
            }
            ChainSwapDirection::LbtcToBtc => {
                let btc_claim_script: BtcSwapScript = self.btc_script_str.clone().try_into()?;
                let claim_tx = BtcSwapTx::new_claim(
                    btc_claim_script.clone(),
                    out_address.clone(),
                    &btc_network_config,
                    self.boltz_url.clone(),
                    self.id.clone(),
                )?;
                let ckp: Keypair = self.claim_keys.clone().try_into()?;
                let preimage = self.preimage.clone();

                if try_cooperate {
                    let lbtc_lockup_script: LBtcSwapScript =
                        self.lbtc_script_str.clone().try_into()?;

                    let refund_tx = LBtcSwapTx::new_refund(
                        lbtc_lockup_script.clone(),
                        &refund_address,
                        &lbtc_network_config,
                        ensure_http_prefix(&self.boltz_url),
                        id.clone(),
                    )?;
                    let claim_tx_response = boltz_client.get_chain_claim_tx_details(&id)?;
                    let rkp: Keypair = self.refund_keys.clone().try_into()?;
                    let (partial_sig, pub_nonce) = refund_tx.partial_sign(
                        &rkp,
                        &claim_tx_response.pub_nonce,
                        &claim_tx_response.transaction_hash,
                    )?;
                    let signed = match claim_tx.sign_claim(
                        &ckp,
                        &preimage.try_into()?,
                        abs_fee,
                        Some(Cooperative {
                            boltz_api: &boltz_client,
                            swap_id: id,
                            pub_nonce: Some(pub_nonce),
                            partial_sig: Some(partial_sig),
                        }),
                    ) {
                        Ok(result) => result,
                        Err(e) => return Err(e.into()),
                    };
                    let serialized_tx: Vec<u8> = serialize(&signed);
                    Ok(serialized_tx.to_hex())
                } else {
                    let signed =
                        match claim_tx.sign_claim(&ckp, &preimage.try_into()?, abs_fee, None) {
                            Ok(result) => result,
                            Err(e) => return Err(e.into()),
                        };
                    let serialized_tx: Vec<u8> = serialize(&signed);
                    Ok(serialized_tx.to_hex())
                }
            }
        }
    }

    pub fn refund(
        &self,
        refund_address: String,
        abs_fee: u64,
        try_cooperate: bool,
    ) -> Result<String, BoltzError> {
        let btc_chain = if self.is_testnet {
            Chain::BitcoinTestnet
        } else {
            Chain::Bitcoin
        };
        let lbtc_chain = if self.is_testnet {
            Chain::LiquidTestnet
        } else {
            Chain::Liquid
        };
        let id: String = self.id.clone();
        let btc_network_config =
            ElectrumConfig::new(btc_chain.into(), &self.btc_electrum_url, true, true, 10);
        let lbtc_network_config =
            ElectrumConfig::new(lbtc_chain.into(), &self.lbtc_electrum_url, true, true, 10);
        let boltz_client = BoltzApiClientV2::new(&ensure_http_prefix(&self.boltz_url));
        match self.direction {
            ChainSwapDirection::BtcToLbtc => {
                let btc_lockup_script: BtcSwapScript = self.btc_script_str.clone().try_into()?;
                let refund_tx = BtcSwapTx::new_refund(
                    btc_lockup_script.clone(),
                    &refund_address,
                    &btc_network_config,
                    self.boltz_url.clone(),
                    self.id.clone(),
                )?;
                let rkp: Keypair = self.refund_keys.clone().try_into()?;
                let signed = match refund_tx.sign_refund(
                    &rkp,
                    abs_fee,
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
                let serialized_tx: Vec<u8> = serialize(&signed);
                Ok(serialized_tx.to_hex())
            }
            ChainSwapDirection::LbtcToBtc => {
                let lbtc_lockup_script: LBtcSwapScript = self.lbtc_script_str.clone().try_into()?;
                let refund_tx = LBtcSwapTx::new_refund(
                    lbtc_lockup_script.clone(),
                    &refund_address,
                    &lbtc_network_config,
                    ensure_http_prefix(&self.boltz_url),
                    id.clone(),
                )?;
                let rkp: Keypair = self.refund_keys.clone().try_into()?;
                let signed = match refund_tx.sign_refund(
                    &rkp,
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
        }
    }

    fn get_network(&self, kind: SwapTxKind) -> (Chain, String) {
        match self.direction {
            ChainSwapDirection::BtcToLbtc => match kind {
                SwapTxKind::Claim => {
                    if self.is_testnet {
                        (Chain::LiquidTestnet, self.lbtc_electrum_url.to_owned())
                    } else {
                        (Chain::Liquid, self.lbtc_electrum_url.to_owned())
                    }
                }
                SwapTxKind::Refund => {
                    if self.is_testnet {
                        (Chain::BitcoinTestnet, self.btc_electrum_url.to_owned())
                    } else {
                        (Chain::Bitcoin, self.btc_electrum_url.to_owned())
                    }
                }
            },
            ChainSwapDirection::LbtcToBtc => match kind {
                SwapTxKind::Claim => {
                    if self.is_testnet {
                        (Chain::BitcoinTestnet, self.btc_electrum_url.to_owned())
                    } else {
                        (Chain::Bitcoin, self.btc_electrum_url.to_owned())
                    }
                }
                SwapTxKind::Refund => {
                    if self.is_testnet {
                        (Chain::LiquidTestnet, self.lbtc_electrum_url.to_owned())
                    } else {
                        (Chain::Liquid, self.lbtc_electrum_url.to_owned())
                    }
                }
            },
        }
    }

    pub fn broadcast_local(
        &self,
        signed_hex: String,
        kind: SwapTxKind,
    ) -> Result<String, BoltzError> {
        let signed_bytes = hex::decode(&signed_hex)
            .map_err(|e| BoltzError::new("HexDecode".to_string(), e.to_string()))?;
        let (network, electrum_url) = self.get_network(kind);

        let network_config = ElectrumConfig::new(network.into(), &electrum_url, true, true, 10);
        let txid: Txid = match network_config
            .build_client()?
            .transaction_broadcast_raw(&signed_bytes)
        {
            Ok(r) => r,
            Err(e) => return Err(BoltzError::new("Electrum".to_string(), e.to_string())),
        };
        Ok(txid.to_string())
    }

    pub fn broadcast_boltz(
        &self,
        signed_hex: String,
        kind: SwapTxKind,
    ) -> Result<String, BoltzError> {
        let (network, _) = self.get_network(kind);
        let boltz_client = BoltzApiClientV2::new(&ensure_http_prefix(&self.boltz_url));
        let txid = match boltz_client.broadcast_tx(network.into(), &signed_hex) {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        Ok(extract_id(txid)?)
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
    use boltz_client::elements::{self, encode::Decodable};

    use super::*;
    #[test]
    fn test_deserialize_tx() {
        let signed_hex = "02000000010173f269c4e2f23a68030bf44982e755afcce6248d382a7c0e0634b83a649b8f270000000000ffffffff02016d521c38ec1ea15734ae22b7c46064412829c0d0579f0a713d1c04ede979026f01000000000000000e00000b3bdbc50aedd1decbf993dfb8afd499edb29804f85162a3784811cd28c6b049d309d6b333b61f16237fbd20b89bc795d813c66e48eedfe7030232f3d6cf1265f5420358ffa38a0f5cb5c0f72a67f0fe253a2d70e38ecf52b78c3d528052f19caf5f7c160014654ab233b340533fb498ad1a722ca4654f1508f80000000000000140cf49814473aaae9a88d00ca4839d4b6e8d57a7df6e97d6160ed20257d344f859cbf6d441936c31991b5cce231b3d714cc15989336febf6409dd98b5dee380dee00000043010001b73f1ea08bc22799c3bd5902808b524466db9f8d3af892a2515fc1184e5cae972c86664644e483321dcf0c66a70d962376c0da6c4eaf28ed20c9fd503444863dfd4e10603300000000000000019c454c007acc888355b567748bb2ca3d1627c8feb686dc63275a7d15624b2826f81720a2036e59059f5d53fb1d5996395656dd4ea4853bbdb969a4f446a192eb4f312b3662364d650297649e464e00255058436bde11de42a81aa2ffbbe699cc6015980456613679ace3973626a883e92276431486eb29963fe1f878c2c2bc0f75fc58a938e91131d91373a265a410c899a1d6202aeab702246e394623810d200bcd40361ffb1cb27dba17a940f491d5c52f39b9ab10cc23527f9b5b474ee737deacdc96aac0bd0a86e48af6c65c61df7cefe6a08e7b627a945bb0f2f4344bfd881dc6f84180982b9a2875d13d888fd8049391b857a26076364493156dee4c08ee85fdeaa5397890477f19a61911a6f1833f8e4be9c071efb13ea08fe4b5033cbd012d64669e8720a8e8861a3f10e8bdb7192b71ab6490b46c5a599077986438458b9842f6554146db0525b9647215045aecef44cf9581c7a18c9ce70c9f473b9fe4e02cc82469769a4eaee90f6a538970b749f1b2c9551b3766bcaa423437691b0d1d1291aff660e9c4eb8d87174e826f2124951787ad991444e4c98712dea172f4353c64a7b4c3f706a2706c19fdb5a12c21e479cd85e5564cfef5f50ceda9eb43b5444efad57b2cd9393ecd213fc23d8870d246d84cbf55f64d860cecafc58ab50f0d9aa8654f0210f63e0fe9e53e00b15d60d9df2d2d035d28b1f4ca2525e2bc3de997cb5720fe4c61919e3ab3efc8a1ed61667386795bee66102c42f5cd267e9d8b51f133e0ed2d3a5e84dfa0769a4235315301e3db4dc7a6c3090fb64085d0c7938d56a47b89908d906ba72af5a448028ce077509566ce9ace542d84701958c4f41a1af0b66d4b932a01f6cb6e3448b951ee14be958a89337a6c8ae6b18339630ab8d89d379eab685a9249156d978618d96243ec056c7b551ab8d9c78ddb723eda4e91f457bca064dc0a274cf9c8c35e4fb7c4ee6249b83c7b7c3255931b5be542c3f42f209051e086fa1f44fb6ea4137101d23774c9fd1250e28c74c9fdf0c5270db2ad372937503732d4536a98e650877023afdb78bf61899a46d1f9eabf8c625ece2ad964dee6d7ce196a6c7350a0deda5f4fdd62e54651712f70ba105db60823ea5770d349dc73df5a36486ecf735fced43ec54ad12bcd5d2982479df9ac50f35b390a4a98525015e354733afd43a0cd4073164e9678fb8bf5e54f01998cfd7eb0bc7280bc338878104cf9389c590f9bdd14ef882b6d7b7d621097299c149d07be63bdeaed9c72b7d6a8196a64adb80ca1590ea966e93edb74d76e59719bd37642c7d6a9563f5d5d2910afc6ed6873aee4a547788ea27a0a83bb7979a5405683fcbe21b60f68ec4c7fe8137614bc08de8cfd7a7c901d31aa15be65467fd454079763c2f8a63678a76885cff8a614f72c8024d3998706d1585adc7c881f7cc1b313d1b3efb1d17852ce0ada497d06b6793651467b6878496b16de24e498c81ed2c7532030afc50d3f44aaf5f074978b70be1b3b030648abb21b1a1c151c9f14879f754fd747d05291bcee343d472a8f0c441df883b210777523675d9a5e9957a02ff42b78c87ba66de4cf0661ba67bcbbb15dc891c345b24b7b199d7496e773a3c5638c472a6350c2f0f5916866f17621804147fe4c2448cb9cc9a3664dc4274ddd41aeb6a5966d51400fa6d5ad8d62bf2ef35c868a9341786993e5ac9b4d95dc5808df9f0b3c951d02c2719c3c1657ee4c19aac4b319934a8ce26cd623c03a80a1064f9051b44b8752c4e39a389bd9e5d15bed4e55ba8a2a9b1aa0c1c7556debec71dda65bbed5d777b85f508aa1f55cd02858866c4b7a0149e9b9c3a3bb205035a20d4f53ed3292911ffc7bcade50cc29054a1b7f01ca4fdbdc42c4e45bb9bd828f60270a0bb5f6295a004754e905ce141c947b91010a8ce7f9d35910895a1e10f426b73efcdd44dddff24497bf1d11e2582e3944230af3db859a030a35a7fa8d8d55cbb9490f81d723f7b877c7885280ecad2efd20b28967fd20bf3279eb5412bc1c554283057d69ee496b379a20f1e63a94e1905551518388e01e55ed8a19b3d58be80cb05cc67ddecca010e0b1a1f174cad52349b6fefd125b258d064f145cd9ad8ca5825ebb873c3c8f3e6a0619a5e935232c411d2747505ee2c55bd90b0df1bb74045ffba886f4d66a97efb6d887c652d0632d1bd70cac2b727df4f8cd3c9dfe5e81248409ff984896c81a8481356e74ad953ad4ddf76cc92a9e8d7a4bbf1e01e0c19c97697f275b46191732b66040645873bec05e5b3af5b96b09be4bb90be396947f9c2ab9db9831aff82209cff5e5426d98e715709f03b5f34336c748601ba0eb779a3d7e98bc65181ee39b32c4ff6b565e52c1038836757967cc19e4e79ba9355c138064bbb93329c7ca4efbb1bad96ab537d13febf8505740075f84cd585fce442aa4fd0a34c6c450dd5f8339e1ff79716c71c5c2e5cbdc6c47f889bb7b4cd36c2eed571535f906fa47e60716ca1ac7116e108603b3fe00629a1f2c5db1e1e62d69f3c18e6efaa88c6bf308275997836bd7a1d7c73e9aaefc8f3b174ce251e9f54dc50e4d5b8c6c3410400f5f09749af7757ce4004fe02b13534901796d38e120a997ad3ec159e2f5929ad0ae6dee12afc834a0295037f198994c4440110d275d60640d2b96b420bd95cef52610dd54a062a0210c28ddd4c0ffcd28086f2cc0e8ade5b0c840f33b7448568ecb5a8b9f2bdfdf0f228cf39819c7f46594f3c42c73a25cc63232d0c13afa6149140a3c9a564456fcf3fe833c5ed4717676fe20dba6a4612323722d5e34d4f501317f375162fdc0dc6f47de069cf753552d26e4b31a4b0a79a0e0b20231e4a1ba060cadef9a02a22b3f0a367009555333800311c0e04f4a486a4a2fda4b2707612e8fc52216dec245a764399e45a602fc7947ff4ade74c653c7620569d67c40124d24a410634ee34cb5cda406740cc58682179d42a5a11b6b428eedcc2ab10a42d8084c350e81365c66836450a5ac977290f5be4797023ca6eedcc85123ee1788c0207cb4397774cfbe87859a9e8fd95a4edc8170ef273c32c1417794768b3e34dc1834f65b7b1d30f348a75c122d69a19dee713c937378bab669ff21e888f456866191c62ebf5b15bed964e1f905354f28a1eeac33ad22d8a590e1b6281b7183da6e0e1d07e4e22cb806d8bee4b1a7f076bd22d24f3ba3ef110453d7f29215aa789fe1505d9bb7beb20f34758b47762476c6ae380c3f141afe81b2b4e7c977397fbfd1306f982465e5dcdd142e6b7d1a7a79ae5e48f21d7c0df19206c6bce0c53982452789c232d8e7c55a57cf843d1bea216fab5f0e2f9492a761629cc6aa09f56535351379ce4d52798ce93def26cfb98dc23ca11b26bcb2a0f39c75d7888d2a27f5e121890cd87467c4058707262fcb3a4c188e72a76ea0a230e84b5543d3f6af5577ad691b0e8e31f67e924b207c4b55262c8de505ccea97414e7302b65c95706863a1600f5d6e774b82c2b44786a46cd4f5597b91d079348ab822a277e7091b044dd6b74919bd03e9a6bb9c131c890adb9ec2a6f25aab3e6e77dd0a70f88d2a7fe6851e52f9bea137a72f6faf8ae1a3ba089a1cf24c7da001894be92748067141ce0dcdf8b303b8ed1c6660011610a07ff098b0353de0aca62a90e8e2f85a2d8d20d3044b50dbeb338144037b97eb45f68427ae662bf10560d52a713168154d8b743c817d982ac33cc8db02d2e42b571f4f8008f2abe392eaf852b75bd2d81f0221711cc9026eb657475170179fdf3e37706253f57d693926faaf3b2db3db1f7493b64bff0b273edd6d8fa0ee454991683411ce969e084a4bfec4d7b319c1986cc9a55f2c0f5e254bb48c7dbad4f35f1f17cbf9a487d85d98dd403715492d6a22fa4c78394b5c41dc21b0120b4cccc1163814f83e1c58435912aa19b0a3889fd43699b7b4988a212112c8e6337ce8abeba52d546c5656b1dc437e788bec277047e8ce34f77ee7eb35cbcdcff5e8d015066dc4a0122b5cf283e7b544e582fa8b60f4245cb8038cd1d0863c7c6ba4a4898da9d86eca6c56477721ef91506546db021ba015c9cd71916b1dc91d39b066c2de904b65c83c3bed26271a1933085fc9386050886f09519ad8aff1df360c207546c52ee37d9cf6e8fa961f7009806bfedd4e7df0cfd4dfa9c8ce14edb17751f4b70b7cffa4b7e038f8e6c8f6948dd69f639512f93858916a410e2e0c2fe1e7280179a63b16ddf66f7832e8878f6f10f0ee3ca30afdafe1fd3cf0ba64e044d2d766865cf4e2b0c0de27a050512fe04959ddf7eab3d79405a8a2201c574c29faa72e0922589a2f3962c3d4ee583540bbdabcea6a998e977c181a4329a248aaee5d8df1ec2462ce3895ac7170fe1c9507b3830afaa04426b4ec5856654fe207ee679feb522635db6912d4c6a8387b5c8a319950c976f2d01b7b341467d22a0bee16f82bbd70d4f0ab1fc061c3c3068ec83902f5202e6d23f7f112baf74de372c92e8777ef33a2a0df088a31a5a91ef9c87e208042956e16c3d0ab49e641958e98e1c6730d9f38a1cb59056556e365a3cd5308273c0624cacf8b93bfd5be8d3b64436f653b2fe880f069e7f1f704b4a9651b9cbc88763755445a3ac95d171cae044d6c59c877da29b8c6a9e3a0dcb3221f31696da92481f4e0e1e851c5ab97e5895acee8b7b97d0aa6edf518640fc6a9b6fd04149a9cdfed66e13961f88c98e995d0fc37e2574ee2f2b568b65240ac2565be95e946c7f35624cf7fb02b9f001cbc245082881f09207bcdc90ad3b56243e5e1d8c822f8a4259d2cb83f9631b734dcf7041164439cf7b4592b3c52c7d72ba3dec30db5a0df734532db767c7a0546f87f6479a3967f7326f721336493b44baa6387fa410f967d292c6a649bda9428fa4a5895dd4a4645a5cc4cf9312dfd42908733d9599a267f096d8b3275c686bef0bf00a45a130b8c20b152ef1335a03a42d6fe819a9312a468bdddf7a0419895051afe978e6f7de66a0ae9a0193d224385a9db4aa2416b955a3f29a2ff46221156f453ba47ee13533dd9185d79019440bf03532918ec56271780086bc76e8b50711b9ce75b300390a1bd8e438c529c51be3f5168f74f257025379172646dc9078f2f24f38ea4def86d178fc917cbf3c68fbe8bf178974445bdc46d7b128b136be0f4ddc50ad1324e0bc6f389b9ad97594d9da497d3bfe4ec2492dd2c403f81143f15086e28a8cdf1b09dc670f6e48c7b0fe7b8670f2f0abae335c5c80d8db618fae9b44d869e1e3853d707582f7553e0961d69f10e300eff5558b5baf2d16cec612aacb4f9b3a7176f5d9a528a98c8aafd8dbab8656e215a5592b292e0c4252a6113f43d3b6131cc5e8b7d89f922529e7f2cf8f9c003360a91763300a0e889cfc7390211c1674e9cad793fadd7b661a34277c3cdcb4f4c399b983984ac1e87861789623f3925e77d621e11f49fbec85ed03a7edec321781bbdac3c6bb24c03af3cd6dda9357ddd3cf8e083cce1c15437e1b8933bda0866273df66610494ff409694ab71b857444b006c77dbbd7bd5e3ab6513e81ee704764494b996c752430e738cbcc24b3033aa058616f13b04a71b33ec3a4e7067bc70ddb02cb087b7d8d34c9fe4ecb242e4d74bb8eddc9b13750a8d7ea39d573540d67013bacad4316f03d1b1a81065b20ae4f52df9dd32f413ff6ecbf3a45045eb8cd7d7c65b672d06eaa61d8d68865c66c48b68129013f072375a8f330a23f1938a4bde476edcdcdb876a1619d44aa9a82d6f22ed090a740bd597678be9e8c7cba8655462a1eb7b113ba8fce55851918e57f1e5e0cf334760fbf68fd024dadbc9f1586a8e575a72d".to_string();
        let signed_bytes = hex::decode(&signed_hex)
            .map_err(|e| BoltzError::new("HexDecode".to_string(), e.to_string()))
            .unwrap();
        let signed_tx: elements::Transaction =
            elements::Transaction::consensus_decode(&*signed_bytes).unwrap();
    }
}
