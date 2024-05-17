#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
// EXTRA BEGIN
typedef struct DartCObject *WireSyncRust2DartDco;
typedef struct WireSyncRust2DartSse {
  uint8_t *ptr;
  int32_t len;
} WireSyncRust2DartSse;

typedef int64_t DartPort;
typedef bool (*DartPostCObjectFnType)(DartPort port_id, void *message);
void store_dart_post_cobject(DartPostCObjectFnType ptr);
// EXTRA END
typedef struct _Dart_Handle* Dart_Handle;

typedef struct wire_cst_list_prim_u_8_strict {
  uint8_t *ptr;
  int32_t len;
} wire_cst_list_prim_u_8_strict;

typedef struct wire_cst_key_pair {
  struct wire_cst_list_prim_u_8_strict *secret_key;
  struct wire_cst_list_prim_u_8_strict *public_key;
} wire_cst_key_pair;

typedef struct wire_cst_pre_image {
  struct wire_cst_list_prim_u_8_strict *value;
  struct wire_cst_list_prim_u_8_strict *sha256;
  struct wire_cst_list_prim_u_8_strict *hash160;
} wire_cst_pre_image;

typedef struct wire_cst_btc_ln_v_1_swap {
  struct wire_cst_list_prim_u_8_strict *id;
  int32_t kind;
  int32_t network;
  struct wire_cst_key_pair keys;
  struct wire_cst_pre_image preimage;
  struct wire_cst_list_prim_u_8_strict *redeem_script;
  struct wire_cst_list_prim_u_8_strict *invoice;
  struct wire_cst_list_prim_u_8_strict *script_address;
  uint64_t out_amount;
  struct wire_cst_list_prim_u_8_strict *electrum_url;
  struct wire_cst_list_prim_u_8_strict *boltz_url;
} wire_cst_btc_ln_v_1_swap;

typedef struct wire_cst_btc_swap_script_v_2_str {
  int32_t swap_type;
  struct wire_cst_list_prim_u_8_strict *funding_addrs;
  struct wire_cst_list_prim_u_8_strict *hashlock;
  struct wire_cst_list_prim_u_8_strict *receiver_pubkey;
  uint32_t locktime;
  struct wire_cst_list_prim_u_8_strict *sender_pubkey;
} wire_cst_btc_swap_script_v_2_str;

typedef struct wire_cst_btc_ln_v_2_swap {
  struct wire_cst_list_prim_u_8_strict *id;
  int32_t kind;
  int32_t network;
  struct wire_cst_key_pair keys;
  struct wire_cst_pre_image preimage;
  struct wire_cst_btc_swap_script_v_2_str swap_script;
  struct wire_cst_list_prim_u_8_strict *invoice;
  struct wire_cst_list_prim_u_8_strict *script_address;
  uint64_t out_amount;
  struct wire_cst_list_prim_u_8_strict *electrum_url;
  struct wire_cst_list_prim_u_8_strict *boltz_url;
} wire_cst_btc_ln_v_2_swap;

typedef struct wire_cst_lbtc_ln_v_1_swap {
  struct wire_cst_list_prim_u_8_strict *id;
  int32_t kind;
  int32_t network;
  struct wire_cst_key_pair keys;
  struct wire_cst_pre_image preimage;
  struct wire_cst_list_prim_u_8_strict *redeem_script;
  struct wire_cst_list_prim_u_8_strict *invoice;
  uint64_t out_amount;
  struct wire_cst_list_prim_u_8_strict *script_address;
  struct wire_cst_list_prim_u_8_strict *blinding_key;
  struct wire_cst_list_prim_u_8_strict *electrum_url;
  struct wire_cst_list_prim_u_8_strict *boltz_url;
} wire_cst_lbtc_ln_v_1_swap;

typedef struct wire_cst_l_btc_swap_script_v_2_str {
  int32_t swap_type;
  struct wire_cst_list_prim_u_8_strict *funding_addrs;
  struct wire_cst_list_prim_u_8_strict *hashlock;
  struct wire_cst_list_prim_u_8_strict *receiver_pubkey;
  uint32_t locktime;
  struct wire_cst_list_prim_u_8_strict *sender_pubkey;
  struct wire_cst_list_prim_u_8_strict *blinding_key;
} wire_cst_l_btc_swap_script_v_2_str;

typedef struct wire_cst_lbtc_ln_v_2_swap {
  struct wire_cst_list_prim_u_8_strict *id;
  int32_t kind;
  int32_t network;
  struct wire_cst_key_pair keys;
  struct wire_cst_pre_image preimage;
  struct wire_cst_l_btc_swap_script_v_2_str swap_script;
  struct wire_cst_list_prim_u_8_strict *invoice;
  uint64_t out_amount;
  struct wire_cst_list_prim_u_8_strict *script_address;
  struct wire_cst_list_prim_u_8_strict *blinding_key;
  struct wire_cst_list_prim_u_8_strict *electrum_url;
  struct wire_cst_list_prim_u_8_strict *boltz_url;
} wire_cst_lbtc_ln_v_2_swap;

typedef struct wire_cst_list_prim_u_8_loose {
  uint8_t *ptr;
  int32_t len;
} wire_cst_list_prim_u_8_loose;

typedef struct wire_cst_limits {
  uint64_t minimal;
  uint64_t maximal;
} wire_cst_limits;

typedef struct wire_cst_submarine_swap_fees {
  double boltz_fees_rate;
  uint64_t claim_fees;
  uint64_t lockup_fees_estimate;
} wire_cst_submarine_swap_fees;

typedef struct wire_cst_reverse_swap_fees {
  double boltz_fees_rate;
  uint64_t lockup_fees;
  uint64_t claim_fees_estimate;
} wire_cst_reverse_swap_fees;

typedef struct wire_cst_all_fees {
  struct wire_cst_limits btc_limits;
  struct wire_cst_limits lbtc_limits;
  struct wire_cst_submarine_swap_fees btc_submarine;
  struct wire_cst_reverse_swap_fees btc_reverse;
  struct wire_cst_submarine_swap_fees lbtc_submarine;
  struct wire_cst_reverse_swap_fees lbtc_reverse;
  struct wire_cst_list_prim_u_8_strict *btc_pair_hash;
  struct wire_cst_list_prim_u_8_strict *lbtc_pair_hash;
} wire_cst_all_fees;

typedef struct wire_cst_boltz_error {
  struct wire_cst_list_prim_u_8_strict *kind;
  struct wire_cst_list_prim_u_8_strict *message;
} wire_cst_boltz_error;

typedef struct wire_cst_decoded_invoice {
  uint64_t msats;
  uint64_t expiry;
  uint64_t expires_in;
  uint64_t expires_at;
  bool is_expired;
  struct wire_cst_list_prim_u_8_strict *network;
  uint64_t cltv_exp_delta;
  struct wire_cst_list_prim_u_8_strict *bip21;
  struct wire_cst_list_prim_u_8_strict *preimage_hash;
} wire_cst_decoded_invoice;

void frbgen_boltz_dart_wire_btc_ln_v_1_swap_claim(int64_t port_,
                                                  struct wire_cst_btc_ln_v_1_swap *that,
                                                  struct wire_cst_list_prim_u_8_strict *out_address,
                                                  uint64_t abs_fee);

void frbgen_boltz_dart_wire_btc_ln_v_1_swap_new(int64_t port_,
                                                struct wire_cst_list_prim_u_8_strict *id,
                                                int32_t kind,
                                                int32_t network,
                                                struct wire_cst_key_pair *keys,
                                                struct wire_cst_pre_image *preimage,
                                                struct wire_cst_list_prim_u_8_strict *redeem_script,
                                                struct wire_cst_list_prim_u_8_strict *invoice,
                                                struct wire_cst_list_prim_u_8_strict *script_address,
                                                uint64_t out_amount,
                                                struct wire_cst_list_prim_u_8_strict *electrum_url,
                                                struct wire_cst_list_prim_u_8_strict *boltz_url);

void frbgen_boltz_dart_wire_btc_ln_v_1_swap_new_reverse(int64_t port_,
                                                        struct wire_cst_list_prim_u_8_strict *mnemonic,
                                                        uint64_t index,
                                                        uint64_t out_amount,
                                                        int32_t network,
                                                        struct wire_cst_list_prim_u_8_strict *electrum_url,
                                                        struct wire_cst_list_prim_u_8_strict *boltz_url,
                                                        struct wire_cst_list_prim_u_8_strict *pair_hash);

void frbgen_boltz_dart_wire_btc_ln_v_1_swap_new_submarine(int64_t port_,
                                                          struct wire_cst_list_prim_u_8_strict *mnemonic,
                                                          uint64_t index,
                                                          struct wire_cst_list_prim_u_8_strict *invoice,
                                                          int32_t network,
                                                          struct wire_cst_list_prim_u_8_strict *electrum_url,
                                                          struct wire_cst_list_prim_u_8_strict *boltz_url,
                                                          struct wire_cst_list_prim_u_8_strict *pair_hash);

void frbgen_boltz_dart_wire_btc_ln_v_1_swap_refund(int64_t port_,
                                                   struct wire_cst_btc_ln_v_1_swap *that,
                                                   struct wire_cst_list_prim_u_8_strict *out_address,
                                                   uint64_t abs_fee);

void frbgen_boltz_dart_wire_btc_ln_v_1_swap_tx_size(int64_t port_,
                                                    struct wire_cst_btc_ln_v_1_swap *that);

void frbgen_boltz_dart_wire_btc_ln_v_2_swap_claim(int64_t port_,
                                                  struct wire_cst_btc_ln_v_2_swap *that,
                                                  struct wire_cst_list_prim_u_8_strict *out_address,
                                                  uint64_t abs_fee,
                                                  bool try_cooperate);

void frbgen_boltz_dart_wire_btc_ln_v_2_swap_coop_close_submarine(int64_t port_,
                                                                 struct wire_cst_btc_ln_v_2_swap *that);

void frbgen_boltz_dart_wire_btc_ln_v_2_swap_new(int64_t port_,
                                                struct wire_cst_list_prim_u_8_strict *id,
                                                int32_t kind,
                                                int32_t network,
                                                struct wire_cst_key_pair *keys,
                                                struct wire_cst_pre_image *preimage,
                                                struct wire_cst_btc_swap_script_v_2_str *swap_script,
                                                struct wire_cst_list_prim_u_8_strict *invoice,
                                                struct wire_cst_list_prim_u_8_strict *script_address,
                                                uint64_t out_amount,
                                                struct wire_cst_list_prim_u_8_strict *electrum_url,
                                                struct wire_cst_list_prim_u_8_strict *boltz_url);

void frbgen_boltz_dart_wire_btc_ln_v_2_swap_new_reverse(int64_t port_,
                                                        struct wire_cst_list_prim_u_8_strict *mnemonic,
                                                        uint64_t index,
                                                        uint64_t out_amount,
                                                        struct wire_cst_list_prim_u_8_strict *out_address,
                                                        int32_t network,
                                                        struct wire_cst_list_prim_u_8_strict *electrum_url,
                                                        struct wire_cst_list_prim_u_8_strict *boltz_url);

void frbgen_boltz_dart_wire_btc_ln_v_2_swap_new_submarine(int64_t port_,
                                                          struct wire_cst_list_prim_u_8_strict *mnemonic,
                                                          uint64_t index,
                                                          struct wire_cst_list_prim_u_8_strict *invoice,
                                                          int32_t network,
                                                          struct wire_cst_list_prim_u_8_strict *electrum_url,
                                                          struct wire_cst_list_prim_u_8_strict *boltz_url);

void frbgen_boltz_dart_wire_btc_ln_v_2_swap_refund(int64_t port_,
                                                   struct wire_cst_btc_ln_v_2_swap *that,
                                                   struct wire_cst_list_prim_u_8_strict *out_address,
                                                   uint64_t abs_fee,
                                                   bool try_cooperate);

void frbgen_boltz_dart_wire_btc_ln_v_2_swap_tx_size(int64_t port_,
                                                    struct wire_cst_btc_ln_v_2_swap *that);

void frbgen_boltz_dart_wire_boltz_error_new(int64_t port_,
                                            struct wire_cst_list_prim_u_8_strict *kind,
                                            struct wire_cst_list_prim_u_8_strict *message);

void frbgen_boltz_dart_wire_lbtc_ln_v_1_swap_claim(int64_t port_,
                                                   struct wire_cst_lbtc_ln_v_1_swap *that,
                                                   struct wire_cst_list_prim_u_8_strict *out_address,
                                                   uint64_t abs_fee);

void frbgen_boltz_dart_wire_lbtc_ln_v_1_swap_new(int64_t port_,
                                                 struct wire_cst_list_prim_u_8_strict *id,
                                                 int32_t kind,
                                                 int32_t network,
                                                 struct wire_cst_key_pair *keys,
                                                 struct wire_cst_pre_image *preimage,
                                                 struct wire_cst_list_prim_u_8_strict *redeem_script,
                                                 struct wire_cst_list_prim_u_8_strict *invoice,
                                                 uint64_t out_amount,
                                                 struct wire_cst_list_prim_u_8_strict *out_address,
                                                 struct wire_cst_list_prim_u_8_strict *blinding_key,
                                                 struct wire_cst_list_prim_u_8_strict *electrum_url,
                                                 struct wire_cst_list_prim_u_8_strict *boltz_url);

void frbgen_boltz_dart_wire_lbtc_ln_v_1_swap_new_reverse(int64_t port_,
                                                         struct wire_cst_list_prim_u_8_strict *mnemonic,
                                                         uint64_t index,
                                                         uint64_t out_amount,
                                                         int32_t network,
                                                         struct wire_cst_list_prim_u_8_strict *electrum_url,
                                                         struct wire_cst_list_prim_u_8_strict *boltz_url,
                                                         struct wire_cst_list_prim_u_8_strict *pair_hash);

void frbgen_boltz_dart_wire_lbtc_ln_v_1_swap_new_submarine(int64_t port_,
                                                           struct wire_cst_list_prim_u_8_strict *mnemonic,
                                                           uint64_t index,
                                                           struct wire_cst_list_prim_u_8_strict *invoice,
                                                           int32_t network,
                                                           struct wire_cst_list_prim_u_8_strict *electrum_url,
                                                           struct wire_cst_list_prim_u_8_strict *boltz_url,
                                                           struct wire_cst_list_prim_u_8_strict *pair_hash);

void frbgen_boltz_dart_wire_lbtc_ln_v_1_swap_refund(int64_t port_,
                                                    struct wire_cst_lbtc_ln_v_1_swap *that,
                                                    struct wire_cst_list_prim_u_8_strict *out_address,
                                                    uint64_t abs_fee);

void frbgen_boltz_dart_wire_lbtc_ln_v_1_swap_tx_size(int64_t port_,
                                                     struct wire_cst_lbtc_ln_v_1_swap *swap);

void frbgen_boltz_dart_wire_lbtc_ln_v_2_swap_broadcast_tx(int64_t port_,
                                                          struct wire_cst_lbtc_ln_v_2_swap *that,
                                                          struct wire_cst_list_prim_u_8_loose *signed_bytes);

void frbgen_boltz_dart_wire_lbtc_ln_v_2_swap_claim(int64_t port_,
                                                   struct wire_cst_lbtc_ln_v_2_swap *that,
                                                   struct wire_cst_list_prim_u_8_strict *out_address,
                                                   uint64_t abs_fee,
                                                   bool try_cooperate);

void frbgen_boltz_dart_wire_lbtc_ln_v_2_swap_coop_close_submarine(int64_t port_,
                                                                  struct wire_cst_lbtc_ln_v_2_swap *that);

void frbgen_boltz_dart_wire_lbtc_ln_v_2_swap_new(int64_t port_,
                                                 struct wire_cst_list_prim_u_8_strict *id,
                                                 int32_t kind,
                                                 int32_t network,
                                                 struct wire_cst_key_pair *keys,
                                                 struct wire_cst_pre_image *preimage,
                                                 struct wire_cst_l_btc_swap_script_v_2_str *swap_script,
                                                 struct wire_cst_list_prim_u_8_strict *invoice,
                                                 uint64_t out_amount,
                                                 struct wire_cst_list_prim_u_8_strict *out_address,
                                                 struct wire_cst_list_prim_u_8_strict *blinding_key,
                                                 struct wire_cst_list_prim_u_8_strict *electrum_url,
                                                 struct wire_cst_list_prim_u_8_strict *boltz_url);

void frbgen_boltz_dart_wire_lbtc_ln_v_2_swap_new_reverse(int64_t port_,
                                                         struct wire_cst_list_prim_u_8_strict *mnemonic,
                                                         uint64_t index,
                                                         uint64_t out_amount,
                                                         struct wire_cst_list_prim_u_8_strict *out_address,
                                                         int32_t network,
                                                         struct wire_cst_list_prim_u_8_strict *electrum_url,
                                                         struct wire_cst_list_prim_u_8_strict *boltz_url);

void frbgen_boltz_dart_wire_lbtc_ln_v_2_swap_new_submarine(int64_t port_,
                                                           struct wire_cst_list_prim_u_8_strict *mnemonic,
                                                           uint64_t index,
                                                           struct wire_cst_list_prim_u_8_strict *invoice,
                                                           int32_t network,
                                                           struct wire_cst_list_prim_u_8_strict *electrum_url,
                                                           struct wire_cst_list_prim_u_8_strict *boltz_url);

void frbgen_boltz_dart_wire_lbtc_ln_v_2_swap_refund(int64_t port_,
                                                    struct wire_cst_lbtc_ln_v_2_swap *that,
                                                    struct wire_cst_list_prim_u_8_strict *out_address,
                                                    uint64_t abs_fee,
                                                    bool try_cooperate);

void frbgen_boltz_dart_wire_lbtc_ln_v_2_swap_tx_size(int64_t port_,
                                                     struct wire_cst_lbtc_ln_v_2_swap *that);

void frbgen_boltz_dart_wire_all_fees_fetch(int64_t port_,
                                           struct wire_cst_list_prim_u_8_strict *boltz_url);

WireSyncRust2DartDco frbgen_boltz_dart_wire_btc_swap_script_v_2_str_new(int32_t swap_type,
                                                                        struct wire_cst_list_prim_u_8_strict *funding_addrs,
                                                                        struct wire_cst_list_prim_u_8_strict *hashlock,
                                                                        struct wire_cst_list_prim_u_8_strict *receiver_pubkey,
                                                                        uint32_t locktime,
                                                                        struct wire_cst_list_prim_u_8_strict *sender_pubkey);

void frbgen_boltz_dart_wire_decoded_invoice_from_string(int64_t port_,
                                                        struct wire_cst_list_prim_u_8_strict *s,
                                                        struct wire_cst_list_prim_u_8_strict *boltz_url);

void frbgen_boltz_dart_wire_key_pair_generate(int64_t port_,
                                              struct wire_cst_list_prim_u_8_strict *mnemonic,
                                              int32_t network,
                                              uint64_t index,
                                              int32_t swap_type);

WireSyncRust2DartDco frbgen_boltz_dart_wire_key_pair_new(struct wire_cst_list_prim_u_8_strict *secret_key,
                                                         struct wire_cst_list_prim_u_8_strict *public_key);

WireSyncRust2DartDco frbgen_boltz_dart_wire_l_btc_swap_script_v_2_str_new(int32_t swap_type,
                                                                          struct wire_cst_list_prim_u_8_strict *funding_addrs,
                                                                          struct wire_cst_list_prim_u_8_strict *hashlock,
                                                                          struct wire_cst_list_prim_u_8_strict *receiver_pubkey,
                                                                          uint32_t locktime,
                                                                          struct wire_cst_list_prim_u_8_strict *sender_pubkey,
                                                                          struct wire_cst_list_prim_u_8_strict *blinding_key);

void frbgen_boltz_dart_wire_pre_image_generate(int64_t port_);

WireSyncRust2DartDco frbgen_boltz_dart_wire_pre_image_new(struct wire_cst_list_prim_u_8_strict *value,
                                                          struct wire_cst_list_prim_u_8_strict *sha256,
                                                          struct wire_cst_list_prim_u_8_strict *hash160);

struct wire_cst_btc_ln_v_1_swap *frbgen_boltz_dart_cst_new_box_autoadd_btc_ln_v_1_swap(void);

struct wire_cst_btc_ln_v_2_swap *frbgen_boltz_dart_cst_new_box_autoadd_btc_ln_v_2_swap(void);

struct wire_cst_btc_swap_script_v_2_str *frbgen_boltz_dart_cst_new_box_autoadd_btc_swap_script_v_2_str(void);

struct wire_cst_key_pair *frbgen_boltz_dart_cst_new_box_autoadd_key_pair(void);

struct wire_cst_l_btc_swap_script_v_2_str *frbgen_boltz_dart_cst_new_box_autoadd_l_btc_swap_script_v_2_str(void);

struct wire_cst_lbtc_ln_v_1_swap *frbgen_boltz_dart_cst_new_box_autoadd_lbtc_ln_v_1_swap(void);

struct wire_cst_lbtc_ln_v_2_swap *frbgen_boltz_dart_cst_new_box_autoadd_lbtc_ln_v_2_swap(void);

struct wire_cst_pre_image *frbgen_boltz_dart_cst_new_box_autoadd_pre_image(void);

struct wire_cst_list_prim_u_8_loose *frbgen_boltz_dart_cst_new_list_prim_u_8_loose(int32_t len);

struct wire_cst_list_prim_u_8_strict *frbgen_boltz_dart_cst_new_list_prim_u_8_strict(int32_t len);
static int64_t dummy_method_to_enforce_bundling(void) {
    int64_t dummy_var = 0;
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_cst_new_box_autoadd_btc_ln_v_1_swap);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_cst_new_box_autoadd_btc_ln_v_2_swap);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_cst_new_box_autoadd_btc_swap_script_v_2_str);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_cst_new_box_autoadd_key_pair);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_cst_new_box_autoadd_l_btc_swap_script_v_2_str);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_cst_new_box_autoadd_lbtc_ln_v_1_swap);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_cst_new_box_autoadd_lbtc_ln_v_2_swap);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_cst_new_box_autoadd_pre_image);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_cst_new_list_prim_u_8_loose);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_cst_new_list_prim_u_8_strict);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_all_fees_fetch);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_boltz_error_new);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_btc_ln_v_1_swap_claim);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_btc_ln_v_1_swap_new);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_btc_ln_v_1_swap_new_reverse);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_btc_ln_v_1_swap_new_submarine);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_btc_ln_v_1_swap_refund);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_btc_ln_v_1_swap_tx_size);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_btc_ln_v_2_swap_claim);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_btc_ln_v_2_swap_coop_close_submarine);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_btc_ln_v_2_swap_new);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_btc_ln_v_2_swap_new_reverse);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_btc_ln_v_2_swap_new_submarine);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_btc_ln_v_2_swap_refund);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_btc_ln_v_2_swap_tx_size);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_btc_swap_script_v_2_str_new);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_decoded_invoice_from_string);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_key_pair_generate);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_key_pair_new);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_l_btc_swap_script_v_2_str_new);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_lbtc_ln_v_1_swap_claim);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_lbtc_ln_v_1_swap_new);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_lbtc_ln_v_1_swap_new_reverse);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_lbtc_ln_v_1_swap_new_submarine);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_lbtc_ln_v_1_swap_refund);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_lbtc_ln_v_1_swap_tx_size);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_lbtc_ln_v_2_swap_broadcast_tx);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_lbtc_ln_v_2_swap_claim);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_lbtc_ln_v_2_swap_coop_close_submarine);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_lbtc_ln_v_2_swap_new);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_lbtc_ln_v_2_swap_new_reverse);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_lbtc_ln_v_2_swap_new_submarine);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_lbtc_ln_v_2_swap_refund);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_lbtc_ln_v_2_swap_tx_size);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_pre_image_generate);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_dart_wire_pre_image_new);
    dummy_var ^= ((int64_t) (void*) store_dart_post_cobject);
    return dummy_var;
}
