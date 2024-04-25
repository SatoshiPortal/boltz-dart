// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.31.

// Section: imports

use super::*;
use flutter_rust_bridge::for_generated::byteorder::{NativeEndian, ReadBytesExt, WriteBytesExt};
use flutter_rust_bridge::for_generated::transform_result_dco;
use flutter_rust_bridge::{Handler, IntoIntoDart};

// Section: boilerplate

flutter_rust_bridge::frb_generated_boilerplate_io!();

// Section: dart2rust

impl CstDecode<String> for *mut wire_cst_list_prim_u_8_strict {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> String {
        let vec: Vec<u8> = self.cst_decode();
        String::from_utf8(vec).unwrap()
    }
}
impl CstDecode<crate::api::types::AllFees> for wire_cst_all_fees {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> crate::api::types::AllFees {
        crate::api::types::AllFees {
            btc_limits: self.btc_limits.cst_decode(),
            lbtc_limits: self.lbtc_limits.cst_decode(),
            btc_submarine: self.btc_submarine.cst_decode(),
            btc_reverse: self.btc_reverse.cst_decode(),
            lbtc_submarine: self.lbtc_submarine.cst_decode(),
            lbtc_reverse: self.lbtc_reverse.cst_decode(),
            btc_pair_hash: self.btc_pair_hash.cst_decode(),
            lbtc_pair_hash: self.lbtc_pair_hash.cst_decode(),
        }
    }
}
impl CstDecode<crate::api::error::BoltzError> for wire_cst_boltz_error {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> crate::api::error::BoltzError {
        crate::api::error::BoltzError {
            kind: self.kind.cst_decode(),
            message: self.message.cst_decode(),
        }
    }
}
impl CstDecode<crate::api::btc_ln::BtcLnV1Swap> for *mut wire_cst_btc_ln_v_1_swap {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> crate::api::btc_ln::BtcLnV1Swap {
        let wrap = unsafe { flutter_rust_bridge::for_generated::box_from_leak_ptr(self) };
        CstDecode::<crate::api::btc_ln::BtcLnV1Swap>::cst_decode(*wrap).into()
    }
}
impl CstDecode<crate::api::btc_ln::BtcLnV2Swap> for *mut wire_cst_btc_ln_v_2_swap {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> crate::api::btc_ln::BtcLnV2Swap {
        let wrap = unsafe { flutter_rust_bridge::for_generated::box_from_leak_ptr(self) };
        CstDecode::<crate::api::btc_ln::BtcLnV2Swap>::cst_decode(*wrap).into()
    }
}
impl CstDecode<crate::api::types::BtcSwapScriptV2Str> for *mut wire_cst_btc_swap_script_v_2_str {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> crate::api::types::BtcSwapScriptV2Str {
        let wrap = unsafe { flutter_rust_bridge::for_generated::box_from_leak_ptr(self) };
        CstDecode::<crate::api::types::BtcSwapScriptV2Str>::cst_decode(*wrap).into()
    }
}
impl CstDecode<crate::api::types::KeyPair> for *mut wire_cst_key_pair {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> crate::api::types::KeyPair {
        let wrap = unsafe { flutter_rust_bridge::for_generated::box_from_leak_ptr(self) };
        CstDecode::<crate::api::types::KeyPair>::cst_decode(*wrap).into()
    }
}
impl CstDecode<crate::api::types::LBtcSwapScriptV2Str> for *mut wire_cst_l_btc_swap_script_v_2_str {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> crate::api::types::LBtcSwapScriptV2Str {
        let wrap = unsafe { flutter_rust_bridge::for_generated::box_from_leak_ptr(self) };
        CstDecode::<crate::api::types::LBtcSwapScriptV2Str>::cst_decode(*wrap).into()
    }
}
impl CstDecode<crate::api::lbtc_ln::LbtcLnV1Swap> for *mut wire_cst_lbtc_ln_v_1_swap {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> crate::api::lbtc_ln::LbtcLnV1Swap {
        let wrap = unsafe { flutter_rust_bridge::for_generated::box_from_leak_ptr(self) };
        CstDecode::<crate::api::lbtc_ln::LbtcLnV1Swap>::cst_decode(*wrap).into()
    }
}
impl CstDecode<crate::api::lbtc_ln::LbtcLnV2Swap> for *mut wire_cst_lbtc_ln_v_2_swap {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> crate::api::lbtc_ln::LbtcLnV2Swap {
        let wrap = unsafe { flutter_rust_bridge::for_generated::box_from_leak_ptr(self) };
        CstDecode::<crate::api::lbtc_ln::LbtcLnV2Swap>::cst_decode(*wrap).into()
    }
}
impl CstDecode<crate::api::types::PreImage> for *mut wire_cst_pre_image {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> crate::api::types::PreImage {
        let wrap = unsafe { flutter_rust_bridge::for_generated::box_from_leak_ptr(self) };
        CstDecode::<crate::api::types::PreImage>::cst_decode(*wrap).into()
    }
}
impl CstDecode<crate::api::btc_ln::BtcLnV1Swap> for wire_cst_btc_ln_v_1_swap {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> crate::api::btc_ln::BtcLnV1Swap {
        crate::api::btc_ln::BtcLnV1Swap {
            id: self.id.cst_decode(),
            kind: self.kind.cst_decode(),
            network: self.network.cst_decode(),
            keys: self.keys.cst_decode(),
            preimage: self.preimage.cst_decode(),
            redeem_script: self.redeem_script.cst_decode(),
            invoice: self.invoice.cst_decode(),
            script_address: self.script_address.cst_decode(),
            out_amount: self.out_amount.cst_decode(),
            electrum_url: self.electrum_url.cst_decode(),
            boltz_url: self.boltz_url.cst_decode(),
        }
    }
}
impl CstDecode<crate::api::btc_ln::BtcLnV2Swap> for wire_cst_btc_ln_v_2_swap {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> crate::api::btc_ln::BtcLnV2Swap {
        crate::api::btc_ln::BtcLnV2Swap {
            id: self.id.cst_decode(),
            kind: self.kind.cst_decode(),
            network: self.network.cst_decode(),
            keys: self.keys.cst_decode(),
            preimage: self.preimage.cst_decode(),
            swap_script: self.swap_script.cst_decode(),
            invoice: self.invoice.cst_decode(),
            script_address: self.script_address.cst_decode(),
            out_amount: self.out_amount.cst_decode(),
            electrum_url: self.electrum_url.cst_decode(),
            boltz_url: self.boltz_url.cst_decode(),
        }
    }
}
impl CstDecode<crate::api::types::BtcSwapScriptV2Str> for wire_cst_btc_swap_script_v_2_str {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> crate::api::types::BtcSwapScriptV2Str {
        crate::api::types::BtcSwapScriptV2Str {
            swap_type: self.swap_type.cst_decode(),
            funding_addrs: self.funding_addrs.cst_decode(),
            hashlock: self.hashlock.cst_decode(),
            receiver_pubkey: self.receiver_pubkey.cst_decode(),
            locktime: self.locktime.cst_decode(),
            sender_pubkey: self.sender_pubkey.cst_decode(),
        }
    }
}
impl CstDecode<crate::api::types::DecodedInvoice> for wire_cst_decoded_invoice {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> crate::api::types::DecodedInvoice {
        crate::api::types::DecodedInvoice {
            msats: self.msats.cst_decode(),
            expiry: self.expiry.cst_decode(),
            expires_in: self.expires_in.cst_decode(),
            expires_at: self.expires_at.cst_decode(),
            is_expired: self.is_expired.cst_decode(),
            network: self.network.cst_decode(),
            cltv_exp_delta: self.cltv_exp_delta.cst_decode(),
        }
    }
}
impl CstDecode<crate::api::types::KeyPair> for wire_cst_key_pair {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> crate::api::types::KeyPair {
        crate::api::types::KeyPair {
            secret_key: self.secret_key.cst_decode(),
            public_key: self.public_key.cst_decode(),
        }
    }
}
impl CstDecode<crate::api::types::LBtcSwapScriptV2Str> for wire_cst_l_btc_swap_script_v_2_str {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> crate::api::types::LBtcSwapScriptV2Str {
        crate::api::types::LBtcSwapScriptV2Str {
            swap_type: self.swap_type.cst_decode(),
            funding_addrs: self.funding_addrs.cst_decode(),
            hashlock: self.hashlock.cst_decode(),
            receiver_pubkey: self.receiver_pubkey.cst_decode(),
            locktime: self.locktime.cst_decode(),
            sender_pubkey: self.sender_pubkey.cst_decode(),
            blinding_key: self.blinding_key.cst_decode(),
        }
    }
}
impl CstDecode<crate::api::lbtc_ln::LbtcLnV1Swap> for wire_cst_lbtc_ln_v_1_swap {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> crate::api::lbtc_ln::LbtcLnV1Swap {
        crate::api::lbtc_ln::LbtcLnV1Swap {
            id: self.id.cst_decode(),
            kind: self.kind.cst_decode(),
            network: self.network.cst_decode(),
            keys: self.keys.cst_decode(),
            preimage: self.preimage.cst_decode(),
            redeem_script: self.redeem_script.cst_decode(),
            invoice: self.invoice.cst_decode(),
            out_amount: self.out_amount.cst_decode(),
            script_address: self.script_address.cst_decode(),
            blinding_key: self.blinding_key.cst_decode(),
            electrum_url: self.electrum_url.cst_decode(),
            boltz_url: self.boltz_url.cst_decode(),
        }
    }
}
impl CstDecode<crate::api::lbtc_ln::LbtcLnV2Swap> for wire_cst_lbtc_ln_v_2_swap {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> crate::api::lbtc_ln::LbtcLnV2Swap {
        crate::api::lbtc_ln::LbtcLnV2Swap {
            id: self.id.cst_decode(),
            kind: self.kind.cst_decode(),
            network: self.network.cst_decode(),
            keys: self.keys.cst_decode(),
            preimage: self.preimage.cst_decode(),
            swap_script: self.swap_script.cst_decode(),
            invoice: self.invoice.cst_decode(),
            out_amount: self.out_amount.cst_decode(),
            script_address: self.script_address.cst_decode(),
            blinding_key: self.blinding_key.cst_decode(),
            electrum_url: self.electrum_url.cst_decode(),
            boltz_url: self.boltz_url.cst_decode(),
        }
    }
}
impl CstDecode<crate::api::types::Limits> for wire_cst_limits {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> crate::api::types::Limits {
        crate::api::types::Limits {
            minimal: self.minimal.cst_decode(),
            maximal: self.maximal.cst_decode(),
        }
    }
}
impl CstDecode<Vec<u8>> for *mut wire_cst_list_prim_u_8_strict {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> Vec<u8> {
        unsafe {
            let wrap = flutter_rust_bridge::for_generated::box_from_leak_ptr(self);
            flutter_rust_bridge::for_generated::vec_from_leak_ptr(wrap.ptr, wrap.len)
        }
    }
}
impl CstDecode<crate::api::types::PreImage> for wire_cst_pre_image {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> crate::api::types::PreImage {
        crate::api::types::PreImage {
            value: self.value.cst_decode(),
            sha256: self.sha256.cst_decode(),
            hash160: self.hash160.cst_decode(),
        }
    }
}
impl CstDecode<crate::api::types::ReverseSwapFees> for wire_cst_reverse_swap_fees {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> crate::api::types::ReverseSwapFees {
        crate::api::types::ReverseSwapFees {
            boltz_fees_rate: self.boltz_fees_rate.cst_decode(),
            lockup_fees: self.lockup_fees.cst_decode(),
            claim_fees_estimate: self.claim_fees_estimate.cst_decode(),
        }
    }
}
impl CstDecode<crate::api::types::SubmarineSwapFees> for wire_cst_submarine_swap_fees {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> crate::api::types::SubmarineSwapFees {
        crate::api::types::SubmarineSwapFees {
            boltz_fees_rate: self.boltz_fees_rate.cst_decode(),
            claim_fees: self.claim_fees.cst_decode(),
            lockup_fees_estimate: self.lockup_fees_estimate.cst_decode(),
        }
    }
}
impl NewWithNullPtr for wire_cst_all_fees {
    fn new_with_null_ptr() -> Self {
        Self {
            btc_limits: Default::default(),
            lbtc_limits: Default::default(),
            btc_submarine: Default::default(),
            btc_reverse: Default::default(),
            lbtc_submarine: Default::default(),
            lbtc_reverse: Default::default(),
            btc_pair_hash: core::ptr::null_mut(),
            lbtc_pair_hash: core::ptr::null_mut(),
        }
    }
}
impl Default for wire_cst_all_fees {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}
impl NewWithNullPtr for wire_cst_boltz_error {
    fn new_with_null_ptr() -> Self {
        Self {
            kind: core::ptr::null_mut(),
            message: core::ptr::null_mut(),
        }
    }
}
impl Default for wire_cst_boltz_error {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}
impl NewWithNullPtr for wire_cst_btc_ln_v_1_swap {
    fn new_with_null_ptr() -> Self {
        Self {
            id: core::ptr::null_mut(),
            kind: Default::default(),
            network: Default::default(),
            keys: Default::default(),
            preimage: Default::default(),
            redeem_script: core::ptr::null_mut(),
            invoice: core::ptr::null_mut(),
            script_address: core::ptr::null_mut(),
            out_amount: Default::default(),
            electrum_url: core::ptr::null_mut(),
            boltz_url: core::ptr::null_mut(),
        }
    }
}
impl Default for wire_cst_btc_ln_v_1_swap {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}
impl NewWithNullPtr for wire_cst_btc_ln_v_2_swap {
    fn new_with_null_ptr() -> Self {
        Self {
            id: core::ptr::null_mut(),
            kind: Default::default(),
            network: Default::default(),
            keys: Default::default(),
            preimage: Default::default(),
            swap_script: Default::default(),
            invoice: core::ptr::null_mut(),
            script_address: core::ptr::null_mut(),
            out_amount: Default::default(),
            electrum_url: core::ptr::null_mut(),
            boltz_url: core::ptr::null_mut(),
        }
    }
}
impl Default for wire_cst_btc_ln_v_2_swap {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}
impl NewWithNullPtr for wire_cst_btc_swap_script_v_2_str {
    fn new_with_null_ptr() -> Self {
        Self {
            swap_type: Default::default(),
            funding_addrs: core::ptr::null_mut(),
            hashlock: core::ptr::null_mut(),
            receiver_pubkey: core::ptr::null_mut(),
            locktime: Default::default(),
            sender_pubkey: core::ptr::null_mut(),
        }
    }
}
impl Default for wire_cst_btc_swap_script_v_2_str {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}
impl NewWithNullPtr for wire_cst_decoded_invoice {
    fn new_with_null_ptr() -> Self {
        Self {
            msats: Default::default(),
            expiry: Default::default(),
            expires_in: Default::default(),
            expires_at: Default::default(),
            is_expired: Default::default(),
            network: core::ptr::null_mut(),
            cltv_exp_delta: Default::default(),
        }
    }
}
impl Default for wire_cst_decoded_invoice {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}
impl NewWithNullPtr for wire_cst_key_pair {
    fn new_with_null_ptr() -> Self {
        Self {
            secret_key: core::ptr::null_mut(),
            public_key: core::ptr::null_mut(),
        }
    }
}
impl Default for wire_cst_key_pair {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}
impl NewWithNullPtr for wire_cst_l_btc_swap_script_v_2_str {
    fn new_with_null_ptr() -> Self {
        Self {
            swap_type: Default::default(),
            funding_addrs: core::ptr::null_mut(),
            hashlock: core::ptr::null_mut(),
            receiver_pubkey: core::ptr::null_mut(),
            locktime: Default::default(),
            sender_pubkey: core::ptr::null_mut(),
            blinding_key: core::ptr::null_mut(),
        }
    }
}
impl Default for wire_cst_l_btc_swap_script_v_2_str {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}
impl NewWithNullPtr for wire_cst_lbtc_ln_v_1_swap {
    fn new_with_null_ptr() -> Self {
        Self {
            id: core::ptr::null_mut(),
            kind: Default::default(),
            network: Default::default(),
            keys: Default::default(),
            preimage: Default::default(),
            redeem_script: core::ptr::null_mut(),
            invoice: core::ptr::null_mut(),
            out_amount: Default::default(),
            script_address: core::ptr::null_mut(),
            blinding_key: core::ptr::null_mut(),
            electrum_url: core::ptr::null_mut(),
            boltz_url: core::ptr::null_mut(),
        }
    }
}
impl Default for wire_cst_lbtc_ln_v_1_swap {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}
impl NewWithNullPtr for wire_cst_lbtc_ln_v_2_swap {
    fn new_with_null_ptr() -> Self {
        Self {
            id: core::ptr::null_mut(),
            kind: Default::default(),
            network: Default::default(),
            keys: Default::default(),
            preimage: Default::default(),
            swap_script: Default::default(),
            invoice: core::ptr::null_mut(),
            out_amount: Default::default(),
            script_address: core::ptr::null_mut(),
            blinding_key: core::ptr::null_mut(),
            electrum_url: core::ptr::null_mut(),
            boltz_url: core::ptr::null_mut(),
        }
    }
}
impl Default for wire_cst_lbtc_ln_v_2_swap {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}
impl NewWithNullPtr for wire_cst_limits {
    fn new_with_null_ptr() -> Self {
        Self {
            minimal: Default::default(),
            maximal: Default::default(),
        }
    }
}
impl Default for wire_cst_limits {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}
impl NewWithNullPtr for wire_cst_pre_image {
    fn new_with_null_ptr() -> Self {
        Self {
            value: core::ptr::null_mut(),
            sha256: core::ptr::null_mut(),
            hash160: core::ptr::null_mut(),
        }
    }
}
impl Default for wire_cst_pre_image {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}
impl NewWithNullPtr for wire_cst_reverse_swap_fees {
    fn new_with_null_ptr() -> Self {
        Self {
            boltz_fees_rate: Default::default(),
            lockup_fees: Default::default(),
            claim_fees_estimate: Default::default(),
        }
    }
}
impl Default for wire_cst_reverse_swap_fees {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}
impl NewWithNullPtr for wire_cst_submarine_swap_fees {
    fn new_with_null_ptr() -> Self {
        Self {
            boltz_fees_rate: Default::default(),
            claim_fees: Default::default(),
            lockup_fees_estimate: Default::default(),
        }
    }
}
impl Default for wire_cst_submarine_swap_fees {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_btc_ln_v_1_swap_claim(
    port_: i64,
    that: *mut wire_cst_btc_ln_v_1_swap,
    out_address: *mut wire_cst_list_prim_u_8_strict,
    abs_fee: u64,
) {
    wire_btc_ln_v_1_swap_claim_impl(port_, that, out_address, abs_fee)
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_btc_ln_v_1_swap_new(
    port_: i64,
    id: *mut wire_cst_list_prim_u_8_strict,
    kind: i32,
    network: i32,
    keys: *mut wire_cst_key_pair,
    preimage: *mut wire_cst_pre_image,
    redeem_script: *mut wire_cst_list_prim_u_8_strict,
    invoice: *mut wire_cst_list_prim_u_8_strict,
    script_address: *mut wire_cst_list_prim_u_8_strict,
    out_amount: u64,
    electrum_url: *mut wire_cst_list_prim_u_8_strict,
    boltz_url: *mut wire_cst_list_prim_u_8_strict,
) {
    wire_btc_ln_v_1_swap_new_impl(
        port_,
        id,
        kind,
        network,
        keys,
        preimage,
        redeem_script,
        invoice,
        script_address,
        out_amount,
        electrum_url,
        boltz_url,
    )
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_btc_ln_v_1_swap_new_reverse(
    port_: i64,
    mnemonic: *mut wire_cst_list_prim_u_8_strict,
    index: u64,
    out_amount: u64,
    network: i32,
    electrum_url: *mut wire_cst_list_prim_u_8_strict,
    boltz_url: *mut wire_cst_list_prim_u_8_strict,
    pair_hash: *mut wire_cst_list_prim_u_8_strict,
) {
    wire_btc_ln_v_1_swap_new_reverse_impl(
        port_,
        mnemonic,
        index,
        out_amount,
        network,
        electrum_url,
        boltz_url,
        pair_hash,
    )
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_btc_ln_v_1_swap_new_submarine(
    port_: i64,
    mnemonic: *mut wire_cst_list_prim_u_8_strict,
    index: u64,
    invoice: *mut wire_cst_list_prim_u_8_strict,
    network: i32,
    electrum_url: *mut wire_cst_list_prim_u_8_strict,
    boltz_url: *mut wire_cst_list_prim_u_8_strict,
    pair_hash: *mut wire_cst_list_prim_u_8_strict,
) {
    wire_btc_ln_v_1_swap_new_submarine_impl(
        port_,
        mnemonic,
        index,
        invoice,
        network,
        electrum_url,
        boltz_url,
        pair_hash,
    )
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_btc_ln_v_1_swap_refund(
    port_: i64,
    that: *mut wire_cst_btc_ln_v_1_swap,
    out_address: *mut wire_cst_list_prim_u_8_strict,
    abs_fee: u64,
) {
    wire_btc_ln_v_1_swap_refund_impl(port_, that, out_address, abs_fee)
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_btc_ln_v_1_swap_tx_size(
    port_: i64,
    that: *mut wire_cst_btc_ln_v_1_swap,
) {
    wire_btc_ln_v_1_swap_tx_size_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_btc_ln_v_2_swap_claim(
    port_: i64,
    that: *mut wire_cst_btc_ln_v_2_swap,
    out_address: *mut wire_cst_list_prim_u_8_strict,
    abs_fee: u64,
) {
    wire_btc_ln_v_2_swap_claim_impl(port_, that, out_address, abs_fee)
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_btc_ln_v_2_swap_new(
    port_: i64,
    id: *mut wire_cst_list_prim_u_8_strict,
    kind: i32,
    network: i32,
    keys: *mut wire_cst_key_pair,
    preimage: *mut wire_cst_pre_image,
    swap_script: *mut wire_cst_btc_swap_script_v_2_str,
    invoice: *mut wire_cst_list_prim_u_8_strict,
    script_address: *mut wire_cst_list_prim_u_8_strict,
    out_amount: u64,
    electrum_url: *mut wire_cst_list_prim_u_8_strict,
    boltz_url: *mut wire_cst_list_prim_u_8_strict,
) {
    wire_btc_ln_v_2_swap_new_impl(
        port_,
        id,
        kind,
        network,
        keys,
        preimage,
        swap_script,
        invoice,
        script_address,
        out_amount,
        electrum_url,
        boltz_url,
    )
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_btc_ln_v_2_swap_new_reverse(
    port_: i64,
    mnemonic: *mut wire_cst_list_prim_u_8_strict,
    index: u64,
    out_amount: u64,
    network: i32,
    electrum_url: *mut wire_cst_list_prim_u_8_strict,
    boltz_url: *mut wire_cst_list_prim_u_8_strict,
) {
    wire_btc_ln_v_2_swap_new_reverse_impl(
        port_,
        mnemonic,
        index,
        out_amount,
        network,
        electrum_url,
        boltz_url,
    )
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_btc_ln_v_2_swap_new_submarine(
    port_: i64,
    mnemonic: *mut wire_cst_list_prim_u_8_strict,
    index: u64,
    invoice: *mut wire_cst_list_prim_u_8_strict,
    network: i32,
    electrum_url: *mut wire_cst_list_prim_u_8_strict,
    boltz_url: *mut wire_cst_list_prim_u_8_strict,
) {
    wire_btc_ln_v_2_swap_new_submarine_impl(
        port_,
        mnemonic,
        index,
        invoice,
        network,
        electrum_url,
        boltz_url,
    )
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_btc_ln_v_2_swap_refund(
    port_: i64,
    that: *mut wire_cst_btc_ln_v_2_swap,
    out_address: *mut wire_cst_list_prim_u_8_strict,
    abs_fee: u64,
) {
    wire_btc_ln_v_2_swap_refund_impl(port_, that, out_address, abs_fee)
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_btc_ln_v_2_swap_tx_size(
    port_: i64,
    that: *mut wire_cst_btc_ln_v_2_swap,
) {
    wire_btc_ln_v_2_swap_tx_size_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_boltz_error_new(
    port_: i64,
    kind: *mut wire_cst_list_prim_u_8_strict,
    message: *mut wire_cst_list_prim_u_8_strict,
) {
    wire_boltz_error_new_impl(port_, kind, message)
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_lbtc_ln_v_1_swap_claim(
    port_: i64,
    that: *mut wire_cst_lbtc_ln_v_1_swap,
    out_address: *mut wire_cst_list_prim_u_8_strict,
    abs_fee: u64,
) {
    wire_lbtc_ln_v_1_swap_claim_impl(port_, that, out_address, abs_fee)
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_lbtc_ln_v_1_swap_new(
    port_: i64,
    id: *mut wire_cst_list_prim_u_8_strict,
    kind: i32,
    network: i32,
    keys: *mut wire_cst_key_pair,
    preimage: *mut wire_cst_pre_image,
    redeem_script: *mut wire_cst_list_prim_u_8_strict,
    invoice: *mut wire_cst_list_prim_u_8_strict,
    out_amount: u64,
    out_address: *mut wire_cst_list_prim_u_8_strict,
    blinding_key: *mut wire_cst_list_prim_u_8_strict,
    electrum_url: *mut wire_cst_list_prim_u_8_strict,
    boltz_url: *mut wire_cst_list_prim_u_8_strict,
) {
    wire_lbtc_ln_v_1_swap_new_impl(
        port_,
        id,
        kind,
        network,
        keys,
        preimage,
        redeem_script,
        invoice,
        out_amount,
        out_address,
        blinding_key,
        electrum_url,
        boltz_url,
    )
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_lbtc_ln_v_1_swap_new_reverse(
    port_: i64,
    mnemonic: *mut wire_cst_list_prim_u_8_strict,
    index: u64,
    out_amount: u64,
    network: i32,
    electrum_url: *mut wire_cst_list_prim_u_8_strict,
    boltz_url: *mut wire_cst_list_prim_u_8_strict,
    pair_hash: *mut wire_cst_list_prim_u_8_strict,
) {
    wire_lbtc_ln_v_1_swap_new_reverse_impl(
        port_,
        mnemonic,
        index,
        out_amount,
        network,
        electrum_url,
        boltz_url,
        pair_hash,
    )
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_lbtc_ln_v_1_swap_new_submarine(
    port_: i64,
    mnemonic: *mut wire_cst_list_prim_u_8_strict,
    index: u64,
    invoice: *mut wire_cst_list_prim_u_8_strict,
    network: i32,
    electrum_url: *mut wire_cst_list_prim_u_8_strict,
    boltz_url: *mut wire_cst_list_prim_u_8_strict,
    pair_hash: *mut wire_cst_list_prim_u_8_strict,
) {
    wire_lbtc_ln_v_1_swap_new_submarine_impl(
        port_,
        mnemonic,
        index,
        invoice,
        network,
        electrum_url,
        boltz_url,
        pair_hash,
    )
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_lbtc_ln_v_1_swap_refund(
    port_: i64,
    that: *mut wire_cst_lbtc_ln_v_1_swap,
    out_address: *mut wire_cst_list_prim_u_8_strict,
    abs_fee: u64,
) {
    wire_lbtc_ln_v_1_swap_refund_impl(port_, that, out_address, abs_fee)
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_lbtc_ln_v_1_swap_tx_size(
    port_: i64,
    swap: *mut wire_cst_lbtc_ln_v_1_swap,
) {
    wire_lbtc_ln_v_1_swap_tx_size_impl(port_, swap)
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_lbtc_ln_v_2_swap_claim(
    port_: i64,
    that: *mut wire_cst_lbtc_ln_v_2_swap,
    out_address: *mut wire_cst_list_prim_u_8_strict,
    abs_fee: u64,
) {
    wire_lbtc_ln_v_2_swap_claim_impl(port_, that, out_address, abs_fee)
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_lbtc_ln_v_2_swap_new(
    port_: i64,
    id: *mut wire_cst_list_prim_u_8_strict,
    kind: i32,
    network: i32,
    keys: *mut wire_cst_key_pair,
    preimage: *mut wire_cst_pre_image,
    swap_script: *mut wire_cst_l_btc_swap_script_v_2_str,
    invoice: *mut wire_cst_list_prim_u_8_strict,
    out_amount: u64,
    out_address: *mut wire_cst_list_prim_u_8_strict,
    blinding_key: *mut wire_cst_list_prim_u_8_strict,
    electrum_url: *mut wire_cst_list_prim_u_8_strict,
    boltz_url: *mut wire_cst_list_prim_u_8_strict,
) {
    wire_lbtc_ln_v_2_swap_new_impl(
        port_,
        id,
        kind,
        network,
        keys,
        preimage,
        swap_script,
        invoice,
        out_amount,
        out_address,
        blinding_key,
        electrum_url,
        boltz_url,
    )
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_lbtc_ln_v_2_swap_new_reverse(
    port_: i64,
    mnemonic: *mut wire_cst_list_prim_u_8_strict,
    index: u64,
    out_amount: u64,
    network: i32,
    electrum_url: *mut wire_cst_list_prim_u_8_strict,
    boltz_url: *mut wire_cst_list_prim_u_8_strict,
) {
    wire_lbtc_ln_v_2_swap_new_reverse_impl(
        port_,
        mnemonic,
        index,
        out_amount,
        network,
        electrum_url,
        boltz_url,
    )
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_lbtc_ln_v_2_swap_new_submarine(
    port_: i64,
    mnemonic: *mut wire_cst_list_prim_u_8_strict,
    index: u64,
    invoice: *mut wire_cst_list_prim_u_8_strict,
    network: i32,
    electrum_url: *mut wire_cst_list_prim_u_8_strict,
    boltz_url: *mut wire_cst_list_prim_u_8_strict,
) {
    wire_lbtc_ln_v_2_swap_new_submarine_impl(
        port_,
        mnemonic,
        index,
        invoice,
        network,
        electrum_url,
        boltz_url,
    )
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_lbtc_ln_v_2_swap_refund(
    port_: i64,
    that: *mut wire_cst_lbtc_ln_v_2_swap,
    out_address: *mut wire_cst_list_prim_u_8_strict,
    abs_fee: u64,
) {
    wire_lbtc_ln_v_2_swap_refund_impl(port_, that, out_address, abs_fee)
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_lbtc_ln_v_2_swap_tx_size(
    port_: i64,
    that: *mut wire_cst_lbtc_ln_v_2_swap,
) {
    wire_lbtc_ln_v_2_swap_tx_size_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_all_fees_fetch(
    port_: i64,
    boltz_url: *mut wire_cst_list_prim_u_8_strict,
) {
    wire_all_fees_fetch_impl(port_, boltz_url)
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_decoded_invoice_from_string(
    port_: i64,
    s: *mut wire_cst_list_prim_u_8_strict,
) {
    wire_decoded_invoice_from_string_impl(port_, s)
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_key_pair_generate(
    port_: i64,
    mnemonic: *mut wire_cst_list_prim_u_8_strict,
    network: i32,
    index: u64,
    swap_type: i32,
) {
    wire_key_pair_generate_impl(port_, mnemonic, network, index, swap_type)
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_key_pair_new(
    secret_key: *mut wire_cst_list_prim_u_8_strict,
    public_key: *mut wire_cst_list_prim_u_8_strict,
) -> flutter_rust_bridge::for_generated::WireSyncRust2DartDco {
    wire_key_pair_new_impl(secret_key, public_key)
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_pre_image_generate(port_: i64) {
    wire_pre_image_generate_impl(port_)
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_wire_pre_image_new(
    value: *mut wire_cst_list_prim_u_8_strict,
    sha256: *mut wire_cst_list_prim_u_8_strict,
    hash160: *mut wire_cst_list_prim_u_8_strict,
) -> flutter_rust_bridge::for_generated::WireSyncRust2DartDco {
    wire_pre_image_new_impl(value, sha256, hash160)
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_cst_new_box_autoadd_btc_ln_v_1_swap(
) -> *mut wire_cst_btc_ln_v_1_swap {
    flutter_rust_bridge::for_generated::new_leak_box_ptr(
        wire_cst_btc_ln_v_1_swap::new_with_null_ptr(),
    )
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_cst_new_box_autoadd_btc_ln_v_2_swap(
) -> *mut wire_cst_btc_ln_v_2_swap {
    flutter_rust_bridge::for_generated::new_leak_box_ptr(
        wire_cst_btc_ln_v_2_swap::new_with_null_ptr(),
    )
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_cst_new_box_autoadd_btc_swap_script_v_2_str(
) -> *mut wire_cst_btc_swap_script_v_2_str {
    flutter_rust_bridge::for_generated::new_leak_box_ptr(
        wire_cst_btc_swap_script_v_2_str::new_with_null_ptr(),
    )
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_cst_new_box_autoadd_key_pair() -> *mut wire_cst_key_pair {
    flutter_rust_bridge::for_generated::new_leak_box_ptr(wire_cst_key_pair::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_cst_new_box_autoadd_l_btc_swap_script_v_2_str(
) -> *mut wire_cst_l_btc_swap_script_v_2_str {
    flutter_rust_bridge::for_generated::new_leak_box_ptr(
        wire_cst_l_btc_swap_script_v_2_str::new_with_null_ptr(),
    )
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_cst_new_box_autoadd_lbtc_ln_v_1_swap(
) -> *mut wire_cst_lbtc_ln_v_1_swap {
    flutter_rust_bridge::for_generated::new_leak_box_ptr(
        wire_cst_lbtc_ln_v_1_swap::new_with_null_ptr(),
    )
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_cst_new_box_autoadd_lbtc_ln_v_2_swap(
) -> *mut wire_cst_lbtc_ln_v_2_swap {
    flutter_rust_bridge::for_generated::new_leak_box_ptr(
        wire_cst_lbtc_ln_v_2_swap::new_with_null_ptr(),
    )
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_cst_new_box_autoadd_pre_image() -> *mut wire_cst_pre_image {
    flutter_rust_bridge::for_generated::new_leak_box_ptr(wire_cst_pre_image::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn frbgen_boltz_dart_cst_new_list_prim_u_8_strict(
    len: i32,
) -> *mut wire_cst_list_prim_u_8_strict {
    let ans = wire_cst_list_prim_u_8_strict {
        ptr: flutter_rust_bridge::for_generated::new_leak_vec_ptr(Default::default(), len),
        len,
    };
    flutter_rust_bridge::for_generated::new_leak_box_ptr(ans)
}

#[repr(C)]
#[derive(Clone, Copy)]
pub struct wire_cst_all_fees {
    btc_limits: wire_cst_limits,
    lbtc_limits: wire_cst_limits,
    btc_submarine: wire_cst_submarine_swap_fees,
    btc_reverse: wire_cst_reverse_swap_fees,
    lbtc_submarine: wire_cst_submarine_swap_fees,
    lbtc_reverse: wire_cst_reverse_swap_fees,
    btc_pair_hash: *mut wire_cst_list_prim_u_8_strict,
    lbtc_pair_hash: *mut wire_cst_list_prim_u_8_strict,
}
#[repr(C)]
#[derive(Clone, Copy)]
pub struct wire_cst_boltz_error {
    kind: *mut wire_cst_list_prim_u_8_strict,
    message: *mut wire_cst_list_prim_u_8_strict,
}
#[repr(C)]
#[derive(Clone, Copy)]
pub struct wire_cst_btc_ln_v_1_swap {
    id: *mut wire_cst_list_prim_u_8_strict,
    kind: i32,
    network: i32,
    keys: wire_cst_key_pair,
    preimage: wire_cst_pre_image,
    redeem_script: *mut wire_cst_list_prim_u_8_strict,
    invoice: *mut wire_cst_list_prim_u_8_strict,
    script_address: *mut wire_cst_list_prim_u_8_strict,
    out_amount: u64,
    electrum_url: *mut wire_cst_list_prim_u_8_strict,
    boltz_url: *mut wire_cst_list_prim_u_8_strict,
}
#[repr(C)]
#[derive(Clone, Copy)]
pub struct wire_cst_btc_ln_v_2_swap {
    id: *mut wire_cst_list_prim_u_8_strict,
    kind: i32,
    network: i32,
    keys: wire_cst_key_pair,
    preimage: wire_cst_pre_image,
    swap_script: wire_cst_btc_swap_script_v_2_str,
    invoice: *mut wire_cst_list_prim_u_8_strict,
    script_address: *mut wire_cst_list_prim_u_8_strict,
    out_amount: u64,
    electrum_url: *mut wire_cst_list_prim_u_8_strict,
    boltz_url: *mut wire_cst_list_prim_u_8_strict,
}
#[repr(C)]
#[derive(Clone, Copy)]
pub struct wire_cst_btc_swap_script_v_2_str {
    swap_type: i32,
    funding_addrs: *mut wire_cst_list_prim_u_8_strict,
    hashlock: *mut wire_cst_list_prim_u_8_strict,
    receiver_pubkey: *mut wire_cst_list_prim_u_8_strict,
    locktime: u32,
    sender_pubkey: *mut wire_cst_list_prim_u_8_strict,
}
#[repr(C)]
#[derive(Clone, Copy)]
pub struct wire_cst_decoded_invoice {
    msats: u64,
    expiry: u64,
    expires_in: u64,
    expires_at: u64,
    is_expired: bool,
    network: *mut wire_cst_list_prim_u_8_strict,
    cltv_exp_delta: u64,
}
#[repr(C)]
#[derive(Clone, Copy)]
pub struct wire_cst_key_pair {
    secret_key: *mut wire_cst_list_prim_u_8_strict,
    public_key: *mut wire_cst_list_prim_u_8_strict,
}
#[repr(C)]
#[derive(Clone, Copy)]
pub struct wire_cst_l_btc_swap_script_v_2_str {
    swap_type: i32,
    funding_addrs: *mut wire_cst_list_prim_u_8_strict,
    hashlock: *mut wire_cst_list_prim_u_8_strict,
    receiver_pubkey: *mut wire_cst_list_prim_u_8_strict,
    locktime: u32,
    sender_pubkey: *mut wire_cst_list_prim_u_8_strict,
    blinding_key: *mut wire_cst_list_prim_u_8_strict,
}
#[repr(C)]
#[derive(Clone, Copy)]
pub struct wire_cst_lbtc_ln_v_1_swap {
    id: *mut wire_cst_list_prim_u_8_strict,
    kind: i32,
    network: i32,
    keys: wire_cst_key_pair,
    preimage: wire_cst_pre_image,
    redeem_script: *mut wire_cst_list_prim_u_8_strict,
    invoice: *mut wire_cst_list_prim_u_8_strict,
    out_amount: u64,
    script_address: *mut wire_cst_list_prim_u_8_strict,
    blinding_key: *mut wire_cst_list_prim_u_8_strict,
    electrum_url: *mut wire_cst_list_prim_u_8_strict,
    boltz_url: *mut wire_cst_list_prim_u_8_strict,
}
#[repr(C)]
#[derive(Clone, Copy)]
pub struct wire_cst_lbtc_ln_v_2_swap {
    id: *mut wire_cst_list_prim_u_8_strict,
    kind: i32,
    network: i32,
    keys: wire_cst_key_pair,
    preimage: wire_cst_pre_image,
    swap_script: wire_cst_l_btc_swap_script_v_2_str,
    invoice: *mut wire_cst_list_prim_u_8_strict,
    out_amount: u64,
    script_address: *mut wire_cst_list_prim_u_8_strict,
    blinding_key: *mut wire_cst_list_prim_u_8_strict,
    electrum_url: *mut wire_cst_list_prim_u_8_strict,
    boltz_url: *mut wire_cst_list_prim_u_8_strict,
}
#[repr(C)]
#[derive(Clone, Copy)]
pub struct wire_cst_limits {
    minimal: u64,
    maximal: u64,
}
#[repr(C)]
#[derive(Clone, Copy)]
pub struct wire_cst_list_prim_u_8_strict {
    ptr: *mut u8,
    len: i32,
}
#[repr(C)]
#[derive(Clone, Copy)]
pub struct wire_cst_pre_image {
    value: *mut wire_cst_list_prim_u_8_strict,
    sha256: *mut wire_cst_list_prim_u_8_strict,
    hash160: *mut wire_cst_list_prim_u_8_strict,
}
#[repr(C)]
#[derive(Clone, Copy)]
pub struct wire_cst_reverse_swap_fees {
    boltz_fees_rate: f64,
    lockup_fees: u64,
    claim_fees_estimate: u64,
}
#[repr(C)]
#[derive(Clone, Copy)]
pub struct wire_cst_submarine_swap_fees {
    boltz_fees_rate: f64,
    claim_fees: u64,
    lockup_fees_estimate: u64,
}
