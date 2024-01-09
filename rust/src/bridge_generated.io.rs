use super::*;
// Section: wire functions

#[no_mangle]
pub extern "C" fn wire_swap_fees__static_method__Api(port_: i64, boltz_url: *mut wire_uint_8_list) {
    wire_swap_fees__static_method__Api_impl(port_, boltz_url)
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
) {
    wire_new_btc_ln_submarine__static_method__Api_impl(
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
pub extern "C" fn wire_swap_status__static_method__Api(
    port_: i64,
    boltz_url: *mut wire_uint_8_list,
    id: *mut wire_uint_8_list,
) {
    wire_swap_status__static_method__Api_impl(port_, boltz_url, id)
}

// Section: allocate functions

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

// Section: sync execution mode utility

#[no_mangle]
pub extern "C" fn free_WireSyncReturn(ptr: support::WireSyncReturn) {
    unsafe {
        let _ = support::box_from_leak_ptr(ptr);
    };
}
