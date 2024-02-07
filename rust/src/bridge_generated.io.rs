use super::*;
// Section: wire functions

#[no_mangle]
pub extern "C" fn wire_swap_fees__static_method__Api(
    port_: i64,
    boltz_url: *mut wire_uint_8_list,
    output_amount: u64,
) {
    wire_swap_fees__static_method__Api_impl(port_, boltz_url, output_amount)
}

#[no_mangle]
pub extern "C" fn wire_new_btc_ln_submarine__static_method__Api(
    port_: i64,
    mnemonic: *mut wire_uint_8_list,
    index: u64,
    invoice: *mut wire_uint_8_list,
    network: i32,
    electrum_url: *mut wire_uint_8_list,
    boltz_url: *mut wire_uint_8_list,
    pair_hash: *mut wire_uint_8_list,
) {
    wire_new_btc_ln_submarine__static_method__Api_impl(
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
pub extern "C" fn wire_new_btc_ln_reverse__static_method__Api(
    port_: i64,
    mnemonic: *mut wire_uint_8_list,
    index: u64,
    out_amount: u64,
    network: i32,
    electrum_url: *mut wire_uint_8_list,
    boltz_url: *mut wire_uint_8_list,
    pair_hash: *mut wire_uint_8_list,
) {
    wire_new_btc_ln_reverse__static_method__Api_impl(
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
pub extern "C" fn wire_btc_ln_tx_size__static_method__Api(port_: i64, swap: *mut wire_BtcLnSwap) {
    wire_btc_ln_tx_size__static_method__Api_impl(port_, swap)
}

#[no_mangle]
pub extern "C" fn wire_btc_ln_reverse_claim__static_method__Api(
    port_: i64,
    swap: *mut wire_BtcLnSwap,
    out_address: *mut wire_uint_8_list,
    abs_fee: u64,
) {
    wire_btc_ln_reverse_claim__static_method__Api_impl(port_, swap, out_address, abs_fee)
}

#[no_mangle]
pub extern "C" fn wire_new_lbtc_ln_submarine__static_method__Api(
    port_: i64,
    mnemonic: *mut wire_uint_8_list,
    index: u64,
    invoice: *mut wire_uint_8_list,
    network: i32,
    electrum_url: *mut wire_uint_8_list,
    boltz_url: *mut wire_uint_8_list,
    pair_hash: *mut wire_uint_8_list,
) {
    wire_new_lbtc_ln_submarine__static_method__Api_impl(
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
pub extern "C" fn wire_new_lbtc_ln_reverse__static_method__Api(
    port_: i64,
    mnemonic: *mut wire_uint_8_list,
    index: u64,
    out_amount: u64,
    network: i32,
    electrum_url: *mut wire_uint_8_list,
    boltz_url: *mut wire_uint_8_list,
    pair_hash: *mut wire_uint_8_list,
) {
    wire_new_lbtc_ln_reverse__static_method__Api_impl(
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
pub extern "C" fn wire_lbtc_ln_tx_size__static_method__Api(port_: i64, swap: *mut wire_LbtcLnSwap) {
    wire_lbtc_ln_tx_size__static_method__Api_impl(port_, swap)
}

#[no_mangle]
pub extern "C" fn wire_lbtc_ln_reverse_claim__static_method__Api(
    port_: i64,
    swap: *mut wire_LbtcLnSwap,
    out_address: *mut wire_uint_8_list,
    abs_fee: u64,
) {
    wire_lbtc_ln_reverse_claim__static_method__Api_impl(port_, swap, out_address, abs_fee)
}

#[no_mangle]
pub extern "C" fn wire_swap_status__static_method__Api(
    port_: i64,
    boltz_url: *mut wire_uint_8_list,
    id: *mut wire_uint_8_list,
) {
    wire_swap_status__static_method__Api_impl(port_, boltz_url, id)
}

#[no_mangle]
pub extern "C" fn wire_decode_invoice__static_method__Api(
    port_: i64,
    invoice_str: *mut wire_uint_8_list,
) {
    wire_decode_invoice__static_method__Api_impl(port_, invoice_str)
}

// Section: allocate functions

#[no_mangle]
pub extern "C" fn new_box_autoadd_btc_ln_swap_0() -> *mut wire_BtcLnSwap {
    support::new_leak_box_ptr(wire_BtcLnSwap::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_lbtc_ln_swap_0() -> *mut wire_LbtcLnSwap {
    support::new_leak_box_ptr(wire_LbtcLnSwap::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_uint_8_list_0(len: i32) -> *mut wire_uint_8_list {
    let ans = wire_uint_8_list {
        ptr: support::new_leak_vec_ptr(Default::default(), len),
        len,
    };
    support::new_leak_box_ptr(ans)
}

// Section: related functions

// Section: impl Wire2Api

impl Wire2Api<String> for *mut wire_uint_8_list {
    fn wire2api(self) -> String {
        let vec: Vec<u8> = self.wire2api();
        String::from_utf8_lossy(&vec).into_owned()
    }
}
impl Wire2Api<BtcLnSwap> for *mut wire_BtcLnSwap {
    fn wire2api(self) -> BtcLnSwap {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<BtcLnSwap>::wire2api(*wrap).into()
    }
}
impl Wire2Api<LbtcLnSwap> for *mut wire_LbtcLnSwap {
    fn wire2api(self) -> LbtcLnSwap {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<LbtcLnSwap>::wire2api(*wrap).into()
    }
}
impl Wire2Api<BtcLnSwap> for wire_BtcLnSwap {
    fn wire2api(self) -> BtcLnSwap {
        BtcLnSwap {
            id: self.id.wire2api(),
            kind: self.kind.wire2api(),
            network: self.network.wire2api(),
            keys: self.keys.wire2api(),
            preimage: self.preimage.wire2api(),
            redeem_script: self.redeem_script.wire2api(),
            invoice: self.invoice.wire2api(),
            script_address: self.script_address.wire2api(),
            out_amount: self.out_amount.wire2api(),
            electrum_url: self.electrum_url.wire2api(),
            boltz_url: self.boltz_url.wire2api(),
        }
    }
}

impl Wire2Api<KeyPair> for wire_KeyPair {
    fn wire2api(self) -> KeyPair {
        KeyPair {
            secret_key: self.secret_key.wire2api(),
            public_key: self.public_key.wire2api(),
        }
    }
}
impl Wire2Api<LbtcLnSwap> for wire_LbtcLnSwap {
    fn wire2api(self) -> LbtcLnSwap {
        LbtcLnSwap {
            id: self.id.wire2api(),
            kind: self.kind.wire2api(),
            network: self.network.wire2api(),
            keys: self.keys.wire2api(),
            preimage: self.preimage.wire2api(),
            redeem_script: self.redeem_script.wire2api(),
            invoice: self.invoice.wire2api(),
            out_amount: self.out_amount.wire2api(),
            script_address: self.script_address.wire2api(),
            blinding_key: self.blinding_key.wire2api(),
            electrum_url: self.electrum_url.wire2api(),
            boltz_url: self.boltz_url.wire2api(),
        }
    }
}
impl Wire2Api<PreImage> for wire_PreImage {
    fn wire2api(self) -> PreImage {
        PreImage {
            value: self.value.wire2api(),
            sha256: self.sha256.wire2api(),
            hash160: self.hash160.wire2api(),
        }
    }
}

impl Wire2Api<Vec<u8>> for *mut wire_uint_8_list {
    fn wire2api(self) -> Vec<u8> {
        unsafe {
            let wrap = support::box_from_leak_ptr(self);
            support::vec_from_leak_ptr(wrap.ptr, wrap.len)
        }
    }
}
// Section: wire structs

#[repr(C)]
#[derive(Clone)]
pub struct wire_BtcLnSwap {
    id: *mut wire_uint_8_list,
    kind: i32,
    network: i32,
    keys: wire_KeyPair,
    preimage: wire_PreImage,
    redeem_script: *mut wire_uint_8_list,
    invoice: *mut wire_uint_8_list,
    script_address: *mut wire_uint_8_list,
    out_amount: u64,
    electrum_url: *mut wire_uint_8_list,
    boltz_url: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_KeyPair {
    secret_key: *mut wire_uint_8_list,
    public_key: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_LbtcLnSwap {
    id: *mut wire_uint_8_list,
    kind: i32,
    network: i32,
    keys: wire_KeyPair,
    preimage: wire_PreImage,
    redeem_script: *mut wire_uint_8_list,
    invoice: *mut wire_uint_8_list,
    out_amount: u64,
    script_address: *mut wire_uint_8_list,
    blinding_key: *mut wire_uint_8_list,
    electrum_url: *mut wire_uint_8_list,
    boltz_url: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_PreImage {
    value: *mut wire_uint_8_list,
    sha256: *mut wire_uint_8_list,
    hash160: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_uint_8_list {
    ptr: *mut u8,
    len: i32,
}

// Section: impl NewWithNullPtr

pub trait NewWithNullPtr {
    fn new_with_null_ptr() -> Self;
}

impl<T> NewWithNullPtr for *mut T {
    fn new_with_null_ptr() -> Self {
        std::ptr::null_mut()
    }
}

impl NewWithNullPtr for wire_BtcLnSwap {
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

impl Default for wire_BtcLnSwap {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_KeyPair {
    fn new_with_null_ptr() -> Self {
        Self {
            secret_key: core::ptr::null_mut(),
            public_key: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_KeyPair {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_LbtcLnSwap {
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

impl Default for wire_LbtcLnSwap {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_PreImage {
    fn new_with_null_ptr() -> Self {
        Self {
            value: core::ptr::null_mut(),
            sha256: core::ptr::null_mut(),
            hash160: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_PreImage {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

// Section: sync execution mode utility

#[no_mangle]
pub extern "C" fn free_WireSyncReturn(ptr: support::WireSyncReturn) {
    unsafe {
        let _ = support::box_from_leak_ptr(ptr);
    };
}
