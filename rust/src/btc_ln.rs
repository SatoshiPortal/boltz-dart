use crate::types::{KeyPair, PreImage, Network};

pub struct BtcLnSwap{
    id: String,
    network: Network,
    keys: KeyPair,
    preimage: PreImage,
    electrum_url: String,
    boltz_url: String,
}
