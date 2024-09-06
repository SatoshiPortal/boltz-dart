use crate::util::check_protocol;

use super::{
    error::BoltzError,
    types::{
        BtcSwapScriptStr, Chain, ChainSwapDirection, KeyPair, LBtcSwapScriptStr, PreImage,
        SwapTxKind, SwapType,
    },
};
use hex::FromHex;

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
            btc_electrum_url,
            lbtc_electrum_url,
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
        let boltz_client = BoltzApiClientV2::new(&check_protocol(&boltz_url));
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
                    btc_electrum_url,
                    lbtc_electrum_url,
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
                    btc_electrum_url,
                    lbtc_electrum_url,
                    boltz_url,
                    referral_id,
                    lockup_script.blinding_key.display_secret().to_string(),
                ))
            }
        }
    }

    pub fn get_server_lockup(&self) -> Result<String, BoltzError> {
        let boltz_client = BoltzApiClientV2::new(&check_protocol(&self.boltz_url));
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
        let boltz_client = BoltzApiClientV2::new(&check_protocol(&self.boltz_url));
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
        let boltz_client = BoltzApiClientV2::new(&check_protocol(&self.boltz_url));

        match self.direction {
            ChainSwapDirection::BtcToLbtc => {
                let lbtc_claim_script: LBtcSwapScript = self.lbtc_script_str.clone().try_into()?;
                let claim_tx: LBtcSwapTx = LBtcSwapTx::new_claim(
                    lbtc_claim_script.clone(),
                    out_address.clone(),
                    &lbtc_network_config,
                    check_protocol(&self.boltz_url),
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
                        check_protocol(&self.boltz_url),
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
        let boltz_client = BoltzApiClientV2::new(&check_protocol(&self.boltz_url));
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
                    check_protocol(&self.boltz_url),
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
        let signed_hex = Vec::from_hex(&signed_hex)
            .map_err(|e| BoltzError::new("HexDecode".to_string(), e.to_string()))?;
        let (network, electrum_url) = self.get_network(kind);
        let signed_tx: Transaction = match deserialize(&signed_hex) {
            Ok(r) => r,
            Err(e) => return Err(BoltzError::new("Deserialize Tx".to_string(), e.to_string())),
        };
        let network_config = ElectrumConfig::new(network.into(), &electrum_url, true, true, 10);
        let txid: Txid = match network_config
            .build_client()?
            .transaction_broadcast(&signed_tx)
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
        let boltz_client = BoltzApiClientV2::new(&check_protocol(&self.boltz_url));
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
    use super::*;
    #[test]
    fn test_recover_swap() {
        // let btc_swap_script_str = BtcSwapScriptStr {
        //     swap_type: SwapType::Chain,
        //     funding_addrs: Some(String::from(
        //         "bc1p2yzcehpgk92lgvkn2cccr099ehqwtxd5668r8lvywmv33pnxhl4qfxp8j7",
        //     )),
        //     hashlock: String::from(
        //         "63739262cff76c906fd6a81c8a6badc9e0160b98",
        //     ),
        //     receiver_pubkey: String::from(
        //         "02c6f4fd10c706eb18a0842edd9d04a0e7151337aed207d9dd6fb8c0793ec4416b",
        //     ),
        //     locktime: 3018370,
        //     sender_pubkey: String::from(
        //         "0286af8eb29d42d335786fd2e67ae67b3087c66b481c2328bfbfb8cfd282aaeae7",
        //     ),
        //     side: Some(Side::Claim.into()),
        // };

        let lbtc_swap_script_str = LBtcSwapScriptStr {
            swap_type: SwapType::Chain,
            funding_addrs: Some(String::from("lq1pqfg0g8jg079pykuz7rucdcpxnk7drevrx5th2py4mlt3h497ztxc8mtz55elwx235dvhnh0uxpsca8t3asfzleun3ygzxjm6jc0xfv6rk2zmjd64cx0j")),
            hashlock: String::from("63739262cff76c906fd6a81c8a6badc9e0160b98"),
            receiver_pubkey: String::from("03cc3c3dc9d1178c0b77eab2520e886e4056ef3197c7a862948d48ba1ac811cae8"),
            locktime: 3018370,
            sender_pubkey: String::from("03269cdbc0dcc44c4d956d41ee89067568c437012caf9dcc660130af734533d2c1"),
            blinding_key: String::from("130fc6324eee3239556c6b3669503dd4a6a538a6e9f786b3436aeff0720024c2"),
            side: Some(Side::Claim.into()),
        };

        let lbtc_claim_script: LBtcSwapScript = lbtc_swap_script_str.clone().try_into().unwrap();
        let _claim_tx: LBtcSwapTx = LBtcSwapTx::new_claim(
            lbtc_claim_script.clone(),
            "lq1qq2mxq26ugwsuq3zpqapledq5kjjpwk39teq4f0d0faqvqumsnjlakl78gkeakhtdey84ltjassdejzvq9h6pzet9z54rd2urh".to_string(),
            &ElectrumConfig::default(Chain::Liquid.into(), None).unwrap(),
            check_protocol("api.boltz.exchange/v2"),
            "3BIJf8UqGaSC".to_string(),
        ).unwrap();

        // let lbtc_claim_script = LB
    }
}
