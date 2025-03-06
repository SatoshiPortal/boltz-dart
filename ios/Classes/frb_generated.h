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

typedef struct wire_cst_btc_swap_script_str {
  int32_t swap_type;
  struct wire_cst_list_prim_u_8_strict *funding_addrs;
  struct wire_cst_list_prim_u_8_strict *hashlock;
  struct wire_cst_list_prim_u_8_strict *receiver_pubkey;
  uint32_t locktime;
  struct wire_cst_list_prim_u_8_strict *sender_pubkey;
  int32_t *side;
} wire_cst_btc_swap_script_str;

typedef struct wire_cst_btc_ln_swap {
  struct wire_cst_list_prim_u_8_strict *id;
  int32_t kind;
  int32_t network;
  struct wire_cst_key_pair keys;
  uint64_t key_index;
  struct wire_cst_pre_image preimage;
  struct wire_cst_btc_swap_script_str swap_script;
  struct wire_cst_list_prim_u_8_strict *invoice;
  struct wire_cst_list_prim_u_8_strict *script_address;
  uint64_t out_amount;
  struct wire_cst_list_prim_u_8_strict *electrum_url;
  struct wire_cst_list_prim_u_8_strict *boltz_url;
  struct wire_cst_list_prim_u_8_strict *referral_id;
} wire_cst_btc_ln_swap;

typedef struct wire_cst_TxFee_Absolute {
  uint64_t field0;
} wire_cst_TxFee_Absolute;

typedef struct wire_cst_TxFee_Relative {
  double field0;
} wire_cst_TxFee_Relative;

typedef union TxFeeKind {
  struct wire_cst_TxFee_Absolute Absolute;
  struct wire_cst_TxFee_Relative Relative;
} TxFeeKind;

typedef struct wire_cst_tx_fee {
  int32_t tag;
  union TxFeeKind kind;
} wire_cst_tx_fee;

typedef struct wire_cst_l_btc_swap_script_str {
  int32_t swap_type;
  struct wire_cst_list_prim_u_8_strict *funding_addrs;
  struct wire_cst_list_prim_u_8_strict *hashlock;
  struct wire_cst_list_prim_u_8_strict *receiver_pubkey;
  uint32_t locktime;
  struct wire_cst_list_prim_u_8_strict *sender_pubkey;
  struct wire_cst_list_prim_u_8_strict *blinding_key;
  int32_t *side;
} wire_cst_l_btc_swap_script_str;

typedef struct wire_cst_chain_swap {
  struct wire_cst_list_prim_u_8_strict *id;
  bool is_testnet;
  int32_t direction;
  struct wire_cst_key_pair refund_keys;
  uint64_t refund_index;
  struct wire_cst_key_pair claim_keys;
  uint64_t claim_index;
  struct wire_cst_pre_image preimage;
  struct wire_cst_btc_swap_script_str btc_script_str;
  struct wire_cst_l_btc_swap_script_str lbtc_script_str;
  struct wire_cst_list_prim_u_8_strict *script_address;
  uint64_t out_amount;
  struct wire_cst_list_prim_u_8_strict *btc_electrum_url;
  struct wire_cst_list_prim_u_8_strict *lbtc_electrum_url;
  struct wire_cst_list_prim_u_8_strict *boltz_url;
  struct wire_cst_list_prim_u_8_strict *referral_id;
  struct wire_cst_list_prim_u_8_strict *blinding_key;
} wire_cst_chain_swap;

typedef struct wire_cst_fees {
  struct wire_cst_list_prim_u_8_strict *boltz_url;
} wire_cst_fees;

typedef struct wire_cst_lbtc_ln_swap {
  struct wire_cst_list_prim_u_8_strict *id;
  int32_t kind;
  int32_t network;
  struct wire_cst_key_pair keys;
  uint64_t key_index;
  struct wire_cst_pre_image preimage;
  struct wire_cst_l_btc_swap_script_str swap_script;
  struct wire_cst_list_prim_u_8_strict *invoice;
  uint64_t out_amount;
  struct wire_cst_list_prim_u_8_strict *script_address;
  struct wire_cst_list_prim_u_8_strict *blinding_key;
  struct wire_cst_list_prim_u_8_strict *electrum_url;
  struct wire_cst_list_prim_u_8_strict *boltz_url;
  struct wire_cst_list_prim_u_8_strict *referral_id;
} wire_cst_lbtc_ln_swap;

typedef struct wire_cst_boltz_error {
  struct wire_cst_list_prim_u_8_strict *kind;
  struct wire_cst_list_prim_u_8_strict *message;
} wire_cst_boltz_error;

typedef struct wire_cst_swap_limits {
  uint64_t minimal;
  uint64_t maximal;
} wire_cst_swap_limits;

typedef struct wire_cst_chain_swap_fees {
  double percentage;
  uint64_t user_lockup;
  uint64_t user_claim;
  uint64_t server;
} wire_cst_chain_swap_fees;

typedef struct wire_cst_chain_fees_and_limits {
  struct wire_cst_swap_limits btc_limits;
  struct wire_cst_swap_limits lbtc_limits;
  struct wire_cst_chain_swap_fees btc_fees;
  struct wire_cst_chain_swap_fees lbtc_fees;
} wire_cst_chain_fees_and_limits;

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

typedef struct wire_cst_miner_fees {
  uint64_t lockup;
  uint64_t claim;
} wire_cst_miner_fees;

typedef struct wire_cst_record_swap_action_swap_state {
  int32_t field0;
  int32_t field1;
} wire_cst_record_swap_action_swap_state;

typedef struct wire_cst_rev_swap_fees {
  double percentage;
  struct wire_cst_miner_fees miner_fees;
} wire_cst_rev_swap_fees;

typedef struct wire_cst_reverse_fees_and_limits {
  struct wire_cst_swap_limits btc_limits;
  struct wire_cst_swap_limits lbtc_limits;
  struct wire_cst_rev_swap_fees btc_fees;
  struct wire_cst_rev_swap_fees lbtc_fees;
} wire_cst_reverse_fees_and_limits;

typedef struct wire_cst_sub_swap_fees {
  double percentage;
  uint64_t miner_fees;
} wire_cst_sub_swap_fees;

typedef struct wire_cst_submarine_fees_and_limits {
  struct wire_cst_swap_limits btc_limits;
  struct wire_cst_swap_limits lbtc_limits;
  struct wire_cst_sub_swap_fees btc_fees;
  struct wire_cst_sub_swap_fees lbtc_fees;
} wire_cst_submarine_fees_and_limits;

void frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_broadcast_boltz(int64_t port_,
                                                                        struct wire_cst_btc_ln_swap *that,
                                                                        struct wire_cst_list_prim_u_8_strict *signed_hex);

void frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_broadcast_local(int64_t port_,
                                                                        struct wire_cst_btc_ln_swap *that,
                                                                        struct wire_cst_list_prim_u_8_strict *signed_hex);

void frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_claim(int64_t port_,
                                                              struct wire_cst_btc_ln_swap *that,
                                                              struct wire_cst_list_prim_u_8_strict *out_address,
                                                              struct wire_cst_tx_fee *miner_fee,
                                                              bool try_cooperate);

void frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_coop_close_submarine(int64_t port_,
                                                                             struct wire_cst_btc_ln_swap *that);

void frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_from_json(int64_t port_,
                                                                  struct wire_cst_list_prim_u_8_strict *json_str);

void frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_new(int64_t port_,
                                                            struct wire_cst_list_prim_u_8_strict *id,
                                                            int32_t kind,
                                                            int32_t network,
                                                            struct wire_cst_key_pair *keys,
                                                            uint64_t key_index,
                                                            struct wire_cst_pre_image *preimage,
                                                            struct wire_cst_btc_swap_script_str *swap_script,
                                                            struct wire_cst_list_prim_u_8_strict *invoice,
                                                            struct wire_cst_list_prim_u_8_strict *script_address,
                                                            uint64_t out_amount,
                                                            struct wire_cst_list_prim_u_8_strict *electrum_url,
                                                            struct wire_cst_list_prim_u_8_strict *boltz_url,
                                                            struct wire_cst_list_prim_u_8_strict *referral_id);

void frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_new_reverse(int64_t port_,
                                                                    struct wire_cst_list_prim_u_8_strict *mnemonic,
                                                                    uint64_t index,
                                                                    uint64_t out_amount,
                                                                    struct wire_cst_list_prim_u_8_strict *out_address,
                                                                    int32_t network,
                                                                    struct wire_cst_list_prim_u_8_strict *electrum_url,
                                                                    struct wire_cst_list_prim_u_8_strict *boltz_url,
                                                                    struct wire_cst_list_prim_u_8_strict *description,
                                                                    struct wire_cst_list_prim_u_8_strict *referral_id);

void frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_new_submarine(int64_t port_,
                                                                      struct wire_cst_list_prim_u_8_strict *mnemonic,
                                                                      uint64_t index,
                                                                      struct wire_cst_list_prim_u_8_strict *invoice,
                                                                      int32_t network,
                                                                      struct wire_cst_list_prim_u_8_strict *electrum_url,
                                                                      struct wire_cst_list_prim_u_8_strict *boltz_url,
                                                                      struct wire_cst_list_prim_u_8_strict *referral_id);

void frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_process(int64_t port_,
                                                                struct wire_cst_btc_ln_swap *that,
                                                                struct wire_cst_list_prim_u_8_strict *status);

void frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_refund(int64_t port_,
                                                               struct wire_cst_btc_ln_swap *that,
                                                               struct wire_cst_list_prim_u_8_strict *out_address,
                                                               struct wire_cst_tx_fee *miner_fee,
                                                               bool try_cooperate);

void frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_to_json(int64_t port_,
                                                                struct wire_cst_btc_ln_swap *that);

void frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_tx_size(int64_t port_,
                                                                struct wire_cst_btc_ln_swap *that,
                                                                bool is_cooperative);

void frbgen_boltz_wire__crate__api__chain_swap__chain_swap_broadcast_boltz(int64_t port_,
                                                                           struct wire_cst_chain_swap *that,
                                                                           struct wire_cst_list_prim_u_8_strict *signed_hex,
                                                                           int32_t kind);

void frbgen_boltz_wire__crate__api__chain_swap__chain_swap_broadcast_local(int64_t port_,
                                                                           struct wire_cst_chain_swap *that,
                                                                           struct wire_cst_list_prim_u_8_strict *signed_hex,
                                                                           int32_t kind);

void frbgen_boltz_wire__crate__api__chain_swap__chain_swap_claim(int64_t port_,
                                                                 struct wire_cst_chain_swap *that,
                                                                 struct wire_cst_list_prim_u_8_strict *out_address,
                                                                 struct wire_cst_list_prim_u_8_strict *refund_address,
                                                                 struct wire_cst_tx_fee *miner_fee,
                                                                 bool try_cooperate);

void frbgen_boltz_wire__crate__api__chain_swap__chain_swap_from_json(int64_t port_,
                                                                     struct wire_cst_list_prim_u_8_strict *json_str);

void frbgen_boltz_wire__crate__api__chain_swap__chain_swap_get_server_lockup(int64_t port_,
                                                                             struct wire_cst_chain_swap *that);

void frbgen_boltz_wire__crate__api__chain_swap__chain_swap_get_user_lockup(int64_t port_,
                                                                           struct wire_cst_chain_swap *that);

void frbgen_boltz_wire__crate__api__chain_swap__chain_swap_new(int64_t port_,
                                                               struct wire_cst_list_prim_u_8_strict *id,
                                                               bool is_testnet,
                                                               int32_t direction,
                                                               struct wire_cst_key_pair *refund_keys,
                                                               uint64_t refund_index,
                                                               struct wire_cst_key_pair *claim_keys,
                                                               uint64_t claim_index,
                                                               struct wire_cst_pre_image *preimage,
                                                               struct wire_cst_btc_swap_script_str *btc_script_str,
                                                               struct wire_cst_l_btc_swap_script_str *lbtc_script_str,
                                                               struct wire_cst_list_prim_u_8_strict *script_address,
                                                               uint64_t out_amount,
                                                               struct wire_cst_list_prim_u_8_strict *btc_electrum_url,
                                                               struct wire_cst_list_prim_u_8_strict *lbtc_electrum_url,
                                                               struct wire_cst_list_prim_u_8_strict *boltz_url,
                                                               struct wire_cst_list_prim_u_8_strict *referral_id,
                                                               struct wire_cst_list_prim_u_8_strict *blinding_key);

void frbgen_boltz_wire__crate__api__chain_swap__chain_swap_new_swap(int64_t port_,
                                                                    int32_t direction,
                                                                    struct wire_cst_list_prim_u_8_strict *mnemonic,
                                                                    uint64_t index,
                                                                    uint64_t amount,
                                                                    bool is_testnet,
                                                                    struct wire_cst_list_prim_u_8_strict *btc_electrum_url,
                                                                    struct wire_cst_list_prim_u_8_strict *lbtc_electrum_url,
                                                                    struct wire_cst_list_prim_u_8_strict *boltz_url,
                                                                    struct wire_cst_list_prim_u_8_strict *referral_id);

void frbgen_boltz_wire__crate__api__chain_swap__chain_swap_process(int64_t port_,
                                                                   struct wire_cst_chain_swap *that,
                                                                   struct wire_cst_list_prim_u_8_strict *status);

void frbgen_boltz_wire__crate__api__chain_swap__chain_swap_refund(int64_t port_,
                                                                  struct wire_cst_chain_swap *that,
                                                                  struct wire_cst_list_prim_u_8_strict *refund_address,
                                                                  struct wire_cst_tx_fee *miner_fee,
                                                                  bool try_cooperate);

void frbgen_boltz_wire__crate__api__chain_swap__chain_swap_to_json(int64_t port_,
                                                                   struct wire_cst_chain_swap *that);

void frbgen_boltz_wire__crate__api__error__boltz_error_new(int64_t port_,
                                                           struct wire_cst_list_prim_u_8_strict *kind,
                                                           struct wire_cst_list_prim_u_8_strict *message);

void frbgen_boltz_wire__crate__api__fees__fees_chain(int64_t port_, struct wire_cst_fees *that);

void frbgen_boltz_wire__crate__api__fees__fees_new(int64_t port_,
                                                   struct wire_cst_list_prim_u_8_strict *boltz_url);

void frbgen_boltz_wire__crate__api__fees__fees_reverse(int64_t port_, struct wire_cst_fees *that);

void frbgen_boltz_wire__crate__api__fees__fees_submarine(int64_t port_, struct wire_cst_fees *that);

void frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_broadcast_boltz(int64_t port_,
                                                                          struct wire_cst_lbtc_ln_swap *that,
                                                                          struct wire_cst_list_prim_u_8_strict *signed_hex);

void frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_broadcast_local(int64_t port_,
                                                                          struct wire_cst_lbtc_ln_swap *that,
                                                                          struct wire_cst_list_prim_u_8_strict *signed_hex);

void frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_claim(int64_t port_,
                                                                struct wire_cst_lbtc_ln_swap *that,
                                                                struct wire_cst_list_prim_u_8_strict *out_address,
                                                                struct wire_cst_tx_fee *miner_fee,
                                                                bool try_cooperate);

void frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_coop_close_submarine(int64_t port_,
                                                                               struct wire_cst_lbtc_ln_swap *that);

void frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_from_json(int64_t port_,
                                                                    struct wire_cst_list_prim_u_8_strict *json_str);

void frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_new(int64_t port_,
                                                              struct wire_cst_list_prim_u_8_strict *id,
                                                              int32_t kind,
                                                              int32_t network,
                                                              struct wire_cst_key_pair *keys,
                                                              uint64_t key_index,
                                                              struct wire_cst_pre_image *preimage,
                                                              struct wire_cst_l_btc_swap_script_str *swap_script,
                                                              struct wire_cst_list_prim_u_8_strict *invoice,
                                                              uint64_t out_amount,
                                                              struct wire_cst_list_prim_u_8_strict *out_address,
                                                              struct wire_cst_list_prim_u_8_strict *blinding_key,
                                                              struct wire_cst_list_prim_u_8_strict *electrum_url,
                                                              struct wire_cst_list_prim_u_8_strict *boltz_url,
                                                              struct wire_cst_list_prim_u_8_strict *referral_id);

void frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_new_reverse(int64_t port_,
                                                                      struct wire_cst_list_prim_u_8_strict *mnemonic,
                                                                      uint64_t index,
                                                                      uint64_t out_amount,
                                                                      struct wire_cst_list_prim_u_8_strict *out_address,
                                                                      int32_t network,
                                                                      struct wire_cst_list_prim_u_8_strict *electrum_url,
                                                                      struct wire_cst_list_prim_u_8_strict *boltz_url,
                                                                      struct wire_cst_list_prim_u_8_strict *description,
                                                                      struct wire_cst_list_prim_u_8_strict *referral_id);

void frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_new_submarine(int64_t port_,
                                                                        struct wire_cst_list_prim_u_8_strict *mnemonic,
                                                                        uint64_t index,
                                                                        struct wire_cst_list_prim_u_8_strict *invoice,
                                                                        int32_t network,
                                                                        struct wire_cst_list_prim_u_8_strict *electrum_url,
                                                                        struct wire_cst_list_prim_u_8_strict *boltz_url,
                                                                        struct wire_cst_list_prim_u_8_strict *referral_id);

void frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_process(int64_t port_,
                                                                  struct wire_cst_lbtc_ln_swap *that,
                                                                  struct wire_cst_list_prim_u_8_strict *status);

void frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_refund(int64_t port_,
                                                                 struct wire_cst_lbtc_ln_swap *that,
                                                                 struct wire_cst_list_prim_u_8_strict *out_address,
                                                                 struct wire_cst_tx_fee *miner_fee,
                                                                 bool try_cooperate);

void frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_to_json(int64_t port_,
                                                                  struct wire_cst_lbtc_ln_swap *that);

void frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_tx_size(int64_t port_,
                                                                  struct wire_cst_lbtc_ln_swap *that,
                                                                  bool is_cooperative);

void frbgen_boltz_wire__crate__api__types__btc_swap_script_str_new(int64_t port_,
                                                                   int32_t swap_type,
                                                                   struct wire_cst_list_prim_u_8_strict *funding_addrs,
                                                                   struct wire_cst_list_prim_u_8_strict *hashlock,
                                                                   struct wire_cst_list_prim_u_8_strict *receiver_pubkey,
                                                                   uint32_t locktime,
                                                                   struct wire_cst_list_prim_u_8_strict *sender_pubkey,
                                                                   int32_t *side);

void frbgen_boltz_wire__crate__api__types__decoded_invoice_from_string(int64_t port_,
                                                                       struct wire_cst_list_prim_u_8_strict *s,
                                                                       struct wire_cst_list_prim_u_8_strict *boltz_url);

void frbgen_boltz_wire__crate__api__types__get_voucher_max_amount(int64_t port_,
                                                                  struct wire_cst_list_prim_u_8_strict *lnurl);

void frbgen_boltz_wire__crate__api__types__invoice_from_lnurl(int64_t port_,
                                                              struct wire_cst_list_prim_u_8_strict *lnurl,
                                                              uint64_t msats);

void frbgen_boltz_wire__crate__api__types__key_pair_generate(int64_t port_,
                                                             struct wire_cst_list_prim_u_8_strict *mnemonic,
                                                             int32_t network,
                                                             uint64_t index,
                                                             int32_t swap_type);

void frbgen_boltz_wire__crate__api__types__key_pair_new(int64_t port_,
                                                        struct wire_cst_list_prim_u_8_strict *secret_key,
                                                        struct wire_cst_list_prim_u_8_strict *public_key);

void frbgen_boltz_wire__crate__api__types__l_btc_swap_script_str_new(int64_t port_,
                                                                     int32_t swap_type,
                                                                     struct wire_cst_list_prim_u_8_strict *funding_addrs,
                                                                     struct wire_cst_list_prim_u_8_strict *hashlock,
                                                                     struct wire_cst_list_prim_u_8_strict *receiver_pubkey,
                                                                     uint32_t locktime,
                                                                     struct wire_cst_list_prim_u_8_strict *sender_pubkey,
                                                                     struct wire_cst_list_prim_u_8_strict *blinding_key,
                                                                     int32_t *side);

void frbgen_boltz_wire__crate__api__types__pre_image_generate(int64_t port_);

void frbgen_boltz_wire__crate__api__types__pre_image_new(int64_t port_,
                                                         struct wire_cst_list_prim_u_8_strict *value,
                                                         struct wire_cst_list_prim_u_8_strict *sha256,
                                                         struct wire_cst_list_prim_u_8_strict *hash160);

void frbgen_boltz_wire__crate__api__types__validate_lnurl(int64_t port_,
                                                          struct wire_cst_list_prim_u_8_strict *lnurl);

void frbgen_boltz_wire__crate__api__types__withdraw(int64_t port_,
                                                    struct wire_cst_list_prim_u_8_strict *lnurl,
                                                    struct wire_cst_list_prim_u_8_strict *invoice);

struct wire_cst_btc_ln_swap *frbgen_boltz_cst_new_box_autoadd_btc_ln_swap(void);

struct wire_cst_btc_swap_script_str *frbgen_boltz_cst_new_box_autoadd_btc_swap_script_str(void);

struct wire_cst_chain_swap *frbgen_boltz_cst_new_box_autoadd_chain_swap(void);

struct wire_cst_fees *frbgen_boltz_cst_new_box_autoadd_fees(void);

struct wire_cst_key_pair *frbgen_boltz_cst_new_box_autoadd_key_pair(void);

struct wire_cst_l_btc_swap_script_str *frbgen_boltz_cst_new_box_autoadd_l_btc_swap_script_str(void);

struct wire_cst_lbtc_ln_swap *frbgen_boltz_cst_new_box_autoadd_lbtc_ln_swap(void);

struct wire_cst_pre_image *frbgen_boltz_cst_new_box_autoadd_pre_image(void);

int32_t *frbgen_boltz_cst_new_box_autoadd_side(int32_t value);

struct wire_cst_tx_fee *frbgen_boltz_cst_new_box_autoadd_tx_fee(void);

struct wire_cst_list_prim_u_8_strict *frbgen_boltz_cst_new_list_prim_u_8_strict(int32_t len);
static int64_t dummy_method_to_enforce_bundling(void) {
    int64_t dummy_var = 0;
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_btc_ln_swap);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_btc_swap_script_str);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_chain_swap);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_fees);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_key_pair);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_l_btc_swap_script_str);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_lbtc_ln_swap);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_pre_image);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_side);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_tx_fee);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_list_prim_u_8_strict);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_broadcast_boltz);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_broadcast_local);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_claim);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_coop_close_submarine);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_from_json);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_new);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_new_reverse);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_new_submarine);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_process);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_refund);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_to_json);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_tx_size);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__chain_swap__chain_swap_broadcast_boltz);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__chain_swap__chain_swap_broadcast_local);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__chain_swap__chain_swap_claim);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__chain_swap__chain_swap_from_json);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__chain_swap__chain_swap_get_server_lockup);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__chain_swap__chain_swap_get_user_lockup);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__chain_swap__chain_swap_new);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__chain_swap__chain_swap_new_swap);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__chain_swap__chain_swap_process);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__chain_swap__chain_swap_refund);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__chain_swap__chain_swap_to_json);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__error__boltz_error_new);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__fees__fees_chain);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__fees__fees_new);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__fees__fees_reverse);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__fees__fees_submarine);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_broadcast_boltz);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_broadcast_local);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_claim);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_coop_close_submarine);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_from_json);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_new);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_new_reverse);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_new_submarine);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_process);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_refund);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_to_json);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_tx_size);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__types__btc_swap_script_str_new);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__types__decoded_invoice_from_string);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__types__get_voucher_max_amount);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__types__invoice_from_lnurl);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__types__key_pair_generate);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__types__key_pair_new);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__types__l_btc_swap_script_str_new);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__types__pre_image_generate);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__types__pre_image_new);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__types__validate_lnurl);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__types__withdraw);
    dummy_var ^= ((int64_t) (void*) store_dart_post_cobject);
    return dummy_var;
}
