use crate::types::{KeyPair, PreImage, Network, SwapType};

pub struct BtcLnSwap {
    pub id: String,
    pub kind: SwapType,
    pub network: Network,
    pub keys: KeyPair,
    pub preimage: PreImage,
    pub redeem_script:String,
    pub invoice: String,
    pub electrum_url: String,
    pub boltz_url: String,
}

impl BtcLnSwap {
    pub fn new(
        id: String,
        kind: SwapType,
        network: Network,
        keys: KeyPair,
        preimage: PreImage,
        redeem_script: String,
        invoice: String,
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
        }
    }
}
