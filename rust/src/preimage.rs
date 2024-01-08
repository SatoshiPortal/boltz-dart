use boltz_client::util::preimage::Preimage as BoltzPreImage;

pub struct PreImage {
    pub internal: BoltzPreImage,
}

impl PreImage {
    pub(crate) fn new() -> Self {
        PreImage {
            internal: BoltzPreImage::new(),
        }
    }
}

// impl From<BoltzPreImage> for PreImage {
//     fn from(value: S5Error) -> Self {
//         PreImage {
//             bytes: value.bytes,
//             sha256: value.sha256,
//             hash160: value.hash160,
//         }
//     }
// }
