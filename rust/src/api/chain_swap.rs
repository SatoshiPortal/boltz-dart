use crate::util::{ensure_http_prefix, strip_tcp_prefix};

use super::{
    error::BoltzError,
    types::{
        BtcSwapScriptStr, Chain, ChainSwapDirection, KeyPair, LBtcSwapScriptStr, PreImage,
        SwapTxKind, SwapType, TxFee,
    },
};

use boltz_client::{
    bitcoin::{
        consensus::{serialize, Decodable},
        hex::DisplayHex,
        Transaction as BitcoinTransaction, Txid,
    },
    boltz::{ChainSwapDetails, Cooperative, Side},
    elements::Transaction as LiquidTransaction,
    error::Error,
    network::{
        electrum::{ElectrumBitcoinClient, ElectrumLiquidClient},
        BitcoinChain, BitcoinClient, Chain as AllChains, LiquidChain, LiquidClient,
    },
    swaps::boltz::BoltzApiClientV2,
    util::secrets::Preimage,
    BtcSwapScript, BtcSwapTx, Keypair, LBtcSwapScript, LBtcSwapTx, PublicKey, Serialize, ToHex,
};
use flutter_rust_bridge::frb;
use serde_json::Value;

#[frb(dart_metadata=("freezed"))]
/// Bitcoin-Liquid Swap Class
#[derive(Clone, PartialEq, Eq, serde::Serialize, serde::Deserialize)]
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
    /// Convert instance to a JSON string.
    pub async fn to_json(&self) -> Result<String, BoltzError> {
        match serde_json::to_string(self) {
            Ok(result) => Ok(result),
            Err(e) => Err(BoltzError::new("JSON".to_string(), e.to_string())),
        }
    }
    /// Parse from a JSON string.
    pub async fn from_json(json_str: &str) -> Result<Self, BoltzError> {
        match serde_json::from_str(json_str) {
            Ok(result) => Ok(result),
            Err(e) => Err(BoltzError::new("JSON".to_string(), e.to_string())),
        }
    }
    /// Manually create the class. Primarily used when recovering a swap.
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
            boltz_url: ensure_http_prefix(&boltz_url.clone()),
            script_address,
            out_amount,
            referral_id: Some(referral_id.unwrap_or_default()),
            blinding_key,
        }
    }
    /// Used to create the class when starting a chain swap between Bitcoin and Liquid.
    /// Note: The mnemonic should be your wallets mnemonic, the library will derive the keys for the swap from the appropriate path.
    /// The client is expected to manage (increment) the use of index to ensure keys are not reused.
    pub async fn new_swap(
        direction: ChainSwapDirection,
        mnemonic: String,
        passphrase: Option<String>,
        index: u64,
        amount: u64,
        is_testnet: bool,
        btc_electrum_url: String,
        lbtc_electrum_url: String,
        boltz_url: String,
        referral_id: Option<String>,
    ) -> Result<ChainSwap, BoltzError> {
        let swap_type = SwapType::Chain;
        let (refund_network, claim_network) = if is_testnet {
            if direction == ChainSwapDirection::BtcToLbtc {
                (
                    AllChains::Bitcoin(BitcoinChain::BitcoinTestnet),
                    AllChains::Liquid(LiquidChain::LiquidTestnet),
                )
            } else {
                (
                    AllChains::Liquid(LiquidChain::LiquidTestnet),
                    AllChains::Bitcoin(BitcoinChain::BitcoinTestnet),
                )
            }
        } else {
            if direction == ChainSwapDirection::BtcToLbtc {
                (
                    AllChains::Bitcoin(BitcoinChain::Bitcoin),
                    AllChains::Liquid(LiquidChain::Liquid),
                )
            } else {
                (
                    AllChains::Liquid(LiquidChain::Liquid),
                    AllChains::Bitcoin(BitcoinChain::Bitcoin),
                )
            }
        };

        let refund_keypair = match KeyPair::generate(
            mnemonic.clone(),
            passphrase.clone(),
            refund_network.clone().into(),
            index,
            swap_type,
        ) {
            Ok(keypair) => keypair,
            Err(err) => return Err(err.into()),
        };
        let refund_kps: Keypair = refund_keypair.clone().try_into()?;
        let refund_public_key = PublicKey {
            inner: refund_kps.public_key(),
            compressed: true,
        };
        let claim_keypair = match KeyPair::generate(
            mnemonic,
            passphrase,
            claim_network.clone().into(),
            index + 1,
            swap_type,
        ) {
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
                let create_chain_response = boltz_client.post_chain_req(create_swap_req).await?;
                let lockup_details: ChainSwapDetails = create_chain_response.clone().lockup_details;
                let lockup_script = BtcSwapScript::chain_from_swap_resp(
                    Side::Lockup,
                    lockup_details.clone(),
                    refund_public_key,
                )?;
                let bitcoin_chain = match refund_network.clone() {
                    AllChains::Bitcoin(inner_chain) => inner_chain,
                    _ => {
                        return Err(BoltzError::new(
                            "ChainType".to_string(),
                            "Expected Bitcoin chain but got Liquid chain".to_string(),
                        ))
                    }
                };

                let lockup_address = lockup_script.clone().to_address(bitcoin_chain)?;
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
                    ensure_http_prefix(&boltz_url),
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
                let create_chain_response = boltz_client.post_chain_req(create_swap_req).await?;
                let lockup_details: ChainSwapDetails = create_chain_response.clone().lockup_details;
                let lockup_script = LBtcSwapScript::chain_from_swap_resp(
                    Side::Lockup,
                    lockup_details.clone(),
                    refund_public_key,
                )?;

                let liquid_chain = match refund_network {
                    AllChains::Liquid(inner_chain) => inner_chain,
                    _ => {
                        return Err(BoltzError::new(
                            "ChainType".to_string(),
                            "Expected Liquid chain but got Bitcoin chain".to_string(),
                        ))
                    }
                };

                let lockup_address = lockup_script.clone().to_address(liquid_chain)?;
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
                    ensure_http_prefix(&boltz_url),
                    referral_id,
                    lockup_script.blinding_key.display_secret().to_string(),
                ))
            }
        }
    }
    /// Get the transaction id of the server's lockup transaction
    pub async fn get_server_lockup(&self) -> Result<String, BoltzError> {
        let boltz_client = BoltzApiClientV2::new(&ensure_http_prefix(&self.boltz_url));
        let txs = boltz_client.get_chain_txs(&self.id.clone()).await?;
        if txs.server_lock.is_none() {
            Err(BoltzError::new(
                "Not Found".to_string(),
                "No Server Lockup Tx Detected.".to_string(),
            ))
        } else {
            Ok(txs.server_lock.unwrap().transaction.id)
        }
    }
    /// Get the transaction id of the user's lockup transaction
    pub async fn get_user_lockup(&self) -> Result<String, BoltzError> {
        let boltz_client = BoltzApiClientV2::new(&ensure_http_prefix(&self.boltz_url));
        let txs = boltz_client.get_chain_txs(&self.id.clone()).await?;
        if txs.user_lock.is_none() {
            Err(BoltzError::new(
                "Not Found".to_string(),
                "No User Lockup Tx Detected.".to_string(),
            ))
        } else {
            Ok(txs.user_lock.unwrap().transaction.id)
        }
    }
    /// Claim a successful swap
    pub async fn claim(
        &self,
        out_address: String,
        refund_address: String,
        miner_fee: TxFee,
        try_cooperate: bool,
    ) -> Result<String, BoltzError> {
        let btc_chain = if self.is_testnet {
            BitcoinChain::BitcoinTestnet
        } else {
            BitcoinChain::Bitcoin
        };
        let lbtc_chain = if self.is_testnet {
            LiquidChain::LiquidTestnet
        } else {
            LiquidChain::Liquid
        };
        let id: String = self.id.clone();

        let btc_network_config =
            ElectrumBitcoinClient::new(btc_chain, &self.btc_electrum_url, true, true, 10)?;

        let lbtc_network_config =
            ElectrumLiquidClient::new(lbtc_chain, &self.lbtc_electrum_url, true, true, 10)?;
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
                )
                .await?;
                let ckp: Keypair = self.claim_keys.clone().try_into()?;
                let preimage = self.preimage.clone();
                if try_cooperate {
                    let btc_lockup_script: BtcSwapScript =
                        self.btc_script_str.clone().try_into()?;
                    let refund_tx = BtcSwapTx::new_refund(
                        btc_lockup_script.clone(),
                        &refund_address,
                        &btc_network_config,
                        ensure_http_prefix(&self.boltz_url),
                        self.id.clone(),
                    )
                    .await?;
                    let claim_tx_response = boltz_client.get_chain_claim_tx_details(&id).await?;
                    let rkp: Keypair = self.refund_keys.clone().try_into()?;
                    let (partial_sig, pub_nonce) = refund_tx.partial_sign(
                        &rkp,
                        &claim_tx_response.pub_nonce,
                        &claim_tx_response.transaction_hash,
                    )?;
                    let signed = match claim_tx
                        .sign_claim(
                            &ckp,
                            &preimage.try_into()?,
                            miner_fee.into(),
                            Some(Cooperative {
                                boltz_api: &boltz_client,
                                swap_id: id,
                                pub_nonce: Some(pub_nonce),
                                partial_sig: Some(partial_sig),
                            }),
                            false,
                        )
                        .await
                    {
                        Ok(result) => result,
                        Err(e) => return Err(e.into()),
                    };
                    Ok(signed.serialize().to_lower_hex_string())
                } else {
                    let signed = match claim_tx
                        .sign_claim(&ckp, &preimage.try_into()?, miner_fee.into(), None, false)
                        .await
                    {
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
                    ensure_http_prefix(&self.boltz_url),
                    self.id.clone(),
                )
                .await?;
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
                    )
                    .await?;
                    let claim_tx_response = boltz_client.get_chain_claim_tx_details(&id).await?;
                    let rkp: Keypair = self.refund_keys.clone().try_into()?;
                    let (partial_sig, pub_nonce) = refund_tx.partial_sign(
                        &rkp,
                        &claim_tx_response.pub_nonce,
                        &claim_tx_response.transaction_hash,
                    )?;
                    let signed = match claim_tx
                        .sign_claim(
                            &ckp,
                            &preimage.try_into()?,
                            miner_fee.into(),
                            Some(Cooperative {
                                boltz_api: &boltz_client,
                                swap_id: id,
                                pub_nonce: Some(pub_nonce),
                                partial_sig: Some(partial_sig),
                            }),
                        )
                        .await
                    {
                        Ok(result) => result,
                        Err(e) => return Err(e.into()),
                    };
                    let serialized_tx: Vec<u8> = serialize(&signed);
                    Ok(serialized_tx.to_hex())
                } else {
                    let signed = match claim_tx
                        .sign_claim(&ckp, &preimage.try_into()?, miner_fee.into(), None)
                        .await
                    {
                        Ok(result) => result,
                        Err(e) => return Err(e.into()),
                    };
                    let serialized_tx: Vec<u8> = serialize(&signed);
                    Ok(serialized_tx.to_hex())
                }
            }
        }
    }
    /// Refund a failed swap
    pub async fn refund(
        &self,
        refund_address: String,
        miner_fee: TxFee,
        try_cooperate: bool,
    ) -> Result<String, BoltzError> {
        let btc_chain = if self.is_testnet {
            BitcoinChain::BitcoinTestnet
        } else {
            BitcoinChain::Bitcoin
        };
        let lbtc_chain = if self.is_testnet {
            LiquidChain::LiquidTestnet
        } else {
            LiquidChain::Liquid
        };
        let id: String = self.id.clone();

        let btc_network_config =
            ElectrumBitcoinClient::new(btc_chain, &self.btc_electrum_url, true, true, 10)?;

        let lbtc_network_config =
            ElectrumLiquidClient::new(lbtc_chain, &self.lbtc_electrum_url, true, true, 10)?;

        let boltz_client = BoltzApiClientV2::new(&ensure_http_prefix(&self.boltz_url));
        match self.direction {
            ChainSwapDirection::BtcToLbtc => {
                let btc_lockup_script: BtcSwapScript = self.btc_script_str.clone().try_into()?;
                let refund_tx = BtcSwapTx::new_refund(
                    btc_lockup_script.clone(),
                    &refund_address,
                    &btc_network_config,
                    ensure_http_prefix(&self.boltz_url),
                    self.id.clone(),
                )
                .await?;
                let rkp: Keypair = self.refund_keys.clone().try_into()?;
                let signed = match refund_tx
                    .sign_refund(
                        &rkp,
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
                    )
                    .await
                {
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
                )
                .await?;
                let rkp: Keypair = self.refund_keys.clone().try_into()?;
                let signed = match refund_tx
                    .sign_refund(
                        &rkp,
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
                        false,
                    )
                    .await
                {
                    Ok(result) => result,
                    Err(e) => return Err(e.into()),
                };
                Ok(signed.serialize().to_lower_hex_string())
            }
        }
    }
    /// Get the network of the swap given a SwapTxKind
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
    /// Broadcast a signed transaction via your own electrum server used when the swap was created.
    pub async fn broadcast_local(
        &self,
        signed_hex: String,
        kind: SwapTxKind,
    ) -> Result<String, BoltzError> {
        let signed_bytes = hex::decode(&signed_hex)
            .map_err(|e| BoltzError::new("HexDecode".to_string(), e.to_string()))?;
        let (network, electrum_url) = self.get_network(kind);
        match network {
            Chain::Bitcoin | Chain::BitcoinTestnet => {
                let network_config = ElectrumBitcoinClient::new(
                    network.into(),
                    &strip_tcp_prefix(&electrum_url),
                    true,
                    true,
                    10,
                )?;

                let transaction = BitcoinTransaction::consensus_decode(&mut &signed_bytes[..])
                    .map_err(|e| BoltzError::new("Bitcoin".to_string(), e.to_string()))?;

                let txid: Txid = match network_config.broadcast_tx(&transaction).await {
                    Ok(r) => r,
                    Err(e) => {
                        return Err(BoltzError::new("Electrum".to_string(), format!("{:?}", e)))
                    }
                };
                Ok(txid.to_string())
            }
            Chain::Liquid | Chain::LiquidTestnet => {
                let network_config = ElectrumLiquidClient::new(
                    network.into(),
                    &strip_tcp_prefix(&electrum_url),
                    true,
                    true,
                    10,
                )?;
                let transaction = <LiquidTransaction as boltz_client::elements::encode::Decodable>::consensus_decode(&mut &signed_bytes[..])
                    .map_err(|e| BoltzError::new("Bitcoin".to_string(), e.to_string()))?;
                let txid = match network_config.broadcast_tx(&transaction).await {
                    Ok(r) => r,
                    Err(e) => {
                        return Err(BoltzError::new("Electrum".to_string(), format!("{:?}", e)))
                    }
                };
                Ok(txid.to_string())
            }
        }
    }
    /// Broadcast a signed transaction using boltz's electrum server
    pub async fn broadcast_boltz(
        &self,
        signed_hex: String,
        kind: SwapTxKind,
    ) -> Result<String, BoltzError> {
        let (network, _) = self.get_network(kind);
        let boltz_client = BoltzApiClientV2::new(&ensure_http_prefix(&self.boltz_url));
        let txid = match boltz_client.broadcast_tx(network.into(), &signed_hex).await {
            Ok(result) => result,
            Err(e) => return Err(e.into()),
        };
        Ok(extract_id(txid)?)
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
