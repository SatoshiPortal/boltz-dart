#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
typedef struct _Dart_Handle* Dart_Handle;

typedef struct DartCObject DartCObject;

typedef int64_t DartPort;

typedef bool (*DartPostCObjectFnType)(DartPort port_id, void *message);

typedef struct wire_uint_8_list {
  uint8_t *ptr;
  int32_t len;
} wire_uint_8_list;

typedef struct wire_KeyPair {
  struct wire_uint_8_list *secret_key;
  struct wire_uint_8_list *public_key;
} wire_KeyPair;

typedef struct wire_PreImage {
  struct wire_uint_8_list *value;
  struct wire_uint_8_list *sha256;
  struct wire_uint_8_list *hash160;
} wire_PreImage;

typedef struct wire_BtcLnSwap {
  struct wire_uint_8_list *id;
  int32_t kind;
  int32_t network;
  struct wire_KeyPair keys;
  struct wire_PreImage preimage;
  struct wire_uint_8_list *redeem_script;
  struct wire_uint_8_list *invoice;
  struct wire_uint_8_list *script_address;
  uint64_t out_amount;
  struct wire_uint_8_list *electrum_url;
  struct wire_uint_8_list *boltz_url;
} wire_BtcLnSwap;

typedef struct wire_LbtcLnSwap {
  struct wire_uint_8_list *id;
  int32_t kind;
  int32_t network;
  struct wire_KeyPair keys;
  struct wire_PreImage preimage;
  struct wire_uint_8_list *redeem_script;
  struct wire_uint_8_list *invoice;
  uint64_t out_amount;
  struct wire_uint_8_list *script_address;
  struct wire_uint_8_list *blinding_key;
  struct wire_uint_8_list *electrum_url;
  struct wire_uint_8_list *boltz_url;
} wire_LbtcLnSwap;

typedef struct DartCObject *WireSyncReturn;

void store_dart_post_cobject(DartPostCObjectFnType ptr);

Dart_Handle get_dart_object(uintptr_t ptr);

void drop_dart_object(uintptr_t ptr);

uintptr_t new_dart_opaque(Dart_Handle handle);

intptr_t init_frb_dart_api_dl(void *obj);

void wire_swap_fees__static_method__Api(int64_t port_,
                                        struct wire_uint_8_list *boltz_url,
                                        uint64_t output_amount);

void wire_new_btc_ln_submarine__static_method__Api(int64_t port_,
                                                   struct wire_uint_8_list *mnemonic,
                                                   uint64_t index,
                                                   struct wire_uint_8_list *invoice,
                                                   int32_t network,
                                                   struct wire_uint_8_list *electrum_url,
                                                   struct wire_uint_8_list *boltz_url,
                                                   struct wire_uint_8_list *pair_hash);

void wire_new_btc_ln_reverse__static_method__Api(int64_t port_,
                                                 struct wire_uint_8_list *mnemonic,
                                                 uint64_t index,
                                                 uint64_t out_amount,
                                                 int32_t network,
                                                 struct wire_uint_8_list *electrum_url,
                                                 struct wire_uint_8_list *boltz_url,
                                                 struct wire_uint_8_list *pair_hash);

void wire_btc_ln_tx_size__static_method__Api(int64_t port_, struct wire_BtcLnSwap *swap);

void wire_btc_ln_reverse_claim__static_method__Api(int64_t port_,
                                                   struct wire_BtcLnSwap *swap,
                                                   struct wire_uint_8_list *out_address,
                                                   uint64_t abs_fee);

void wire_new_lbtc_ln_submarine__static_method__Api(int64_t port_,
                                                    struct wire_uint_8_list *mnemonic,
                                                    uint64_t index,
                                                    struct wire_uint_8_list *invoice,
                                                    int32_t network,
                                                    struct wire_uint_8_list *electrum_url,
                                                    struct wire_uint_8_list *boltz_url,
                                                    struct wire_uint_8_list *pair_hash);

void wire_new_lbtc_ln_reverse__static_method__Api(int64_t port_,
                                                  struct wire_uint_8_list *mnemonic,
                                                  uint64_t index,
                                                  uint64_t out_amount,
                                                  int32_t network,
                                                  struct wire_uint_8_list *electrum_url,
                                                  struct wire_uint_8_list *boltz_url,
                                                  struct wire_uint_8_list *pair_hash);

void wire_lbtc_ln_tx_size__static_method__Api(int64_t port_, struct wire_LbtcLnSwap *swap);

void wire_lbtc_ln_reverse_claim__static_method__Api(int64_t port_,
                                                    struct wire_LbtcLnSwap *swap,
                                                    struct wire_uint_8_list *out_address,
                                                    uint64_t abs_fee);

void wire_swap_status__static_method__Api(int64_t port_,
                                          struct wire_uint_8_list *boltz_url,
                                          struct wire_uint_8_list *id);

struct wire_BtcLnSwap *new_box_autoadd_btc_ln_swap_0(void);

struct wire_LbtcLnSwap *new_box_autoadd_lbtc_ln_swap_0(void);

struct wire_uint_8_list *new_uint_8_list_0(int32_t len);

void free_WireSyncReturn(WireSyncReturn ptr);

static int64_t dummy_method_to_enforce_bundling(void) {
    int64_t dummy_var = 0;
    dummy_var ^= ((int64_t) (void*) wire_swap_fees__static_method__Api);
    dummy_var ^= ((int64_t) (void*) wire_new_btc_ln_submarine__static_method__Api);
    dummy_var ^= ((int64_t) (void*) wire_new_btc_ln_reverse__static_method__Api);
    dummy_var ^= ((int64_t) (void*) wire_btc_ln_tx_size__static_method__Api);
    dummy_var ^= ((int64_t) (void*) wire_btc_ln_reverse_claim__static_method__Api);
    dummy_var ^= ((int64_t) (void*) wire_new_lbtc_ln_submarine__static_method__Api);
    dummy_var ^= ((int64_t) (void*) wire_new_lbtc_ln_reverse__static_method__Api);
    dummy_var ^= ((int64_t) (void*) wire_lbtc_ln_tx_size__static_method__Api);
    dummy_var ^= ((int64_t) (void*) wire_lbtc_ln_reverse_claim__static_method__Api);
    dummy_var ^= ((int64_t) (void*) wire_swap_status__static_method__Api);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_btc_ln_swap_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_lbtc_ln_swap_0);
    dummy_var ^= ((int64_t) (void*) new_uint_8_list_0);
    dummy_var ^= ((int64_t) (void*) free_WireSyncReturn);
    dummy_var ^= ((int64_t) (void*) store_dart_post_cobject);
    dummy_var ^= ((int64_t) (void*) get_dart_object);
    dummy_var ^= ((int64_t) (void*) drop_dart_object);
    dummy_var ^= ((int64_t) (void*) new_dart_opaque);
    return dummy_var;
}
