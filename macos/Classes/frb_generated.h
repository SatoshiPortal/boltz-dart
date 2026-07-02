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

typedef struct wire_cst_boltz_error {
  struct wire_cst_list_prim_u_8_strict *kind;
  struct wire_cst_list_prim_u_8_strict *message;
} wire_cst_boltz_error;

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

typedef struct wire_cst_electrum_settings {
  struct wire_cst_list_prim_u_8_strict *url;
  bool validate_domain;
  bool tls;
  uint8_t timeout;
} wire_cst_electrum_settings;

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

typedef struct wire_cst_swap_master_key {
  struct wire_cst_list_prim_u_8_strict *xprv;
  struct wire_cst_list_prim_u_8_strict *xpub;
  int32_t network;
  struct wire_cst_list_prim_u_8_strict *mnemonic;
  struct wire_cst_list_prim_u_8_strict *fingerprint;
} wire_cst_swap_master_key;

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

typedef struct wire_cst_lnurl {
  struct wire_cst_list_prim_u_8_strict *value;
} wire_cst_lnurl;

typedef struct wire_cst_transaction {
  struct wire_cst_list_prim_u_8_strict *id;
  struct wire_cst_list_prim_u_8_strict *hex;
  uint32_t *eta;
} wire_cst_transaction;

typedef struct wire_cst_swap_status_response {
  int32_t status;
  struct wire_cst_transaction *transaction;
  struct wire_cst_list_prim_u_8_strict *failure_reason;
  struct wire_cst_list_prim_u_8_strict *error;
} wire_cst_swap_status_response;

typedef struct wire_cst_swap_stream_status {
  struct wire_cst_list_prim_u_8_strict *id;
  int32_t status;
  struct wire_cst_list_prim_u_8_strict *error;
  struct wire_cst_transaction *transaction;
} wire_cst_swap_stream_status;

typedef struct wire_cst_list_btc_ln_swap {
  struct wire_cst_btc_ln_swap *ptr;
  int32_t len;
} wire_cst_list_btc_ln_swap;

typedef struct wire_cst_list_chain_swap {
  struct wire_cst_chain_swap *ptr;
  int32_t len;
} wire_cst_list_chain_swap;

typedef struct wire_cst_list_lbtc_ln_swap {
  struct wire_cst_lbtc_ln_swap *ptr;
  int32_t len;
} wire_cst_list_lbtc_ln_swap;

typedef struct wire_cst_restored_swap_summary {
  struct wire_cst_list_prim_u_8_strict *id;
  int32_t kind;
  struct wire_cst_list_prim_u_8_strict *status;
  uint64_t created_at;
  struct wire_cst_list_prim_u_8_strict *from;
  struct wire_cst_list_prim_u_8_strict *to;
  uint64_t amount;
  bool recoverable;
} wire_cst_restored_swap_summary;

typedef struct wire_cst_list_restored_swap_summary {
  struct wire_cst_restored_swap_summary *ptr;
  int32_t len;
} wire_cst_list_restored_swap_summary;

typedef struct wire_cst_swap_limits {
  uint64_t minimal;
  uint64_t maximal;
  uint64_t *maximal_zero_conf;
  uint64_t *minimal_batched;
} wire_cst_swap_limits;

typedef struct wire_cst_chain_swap_fees {
  double percentage;
  uint64_t user_lockup;
  uint64_t user_claim;
  uint64_t server;
} wire_cst_chain_swap_fees;

typedef struct wire_cst_chain_fees_and_limits {
  struct wire_cst_swap_limits lbtc_to_btc_limits;
  struct wire_cst_swap_limits btc_to_lbtc_limits;
  struct wire_cst_chain_swap_fees lbtc_to_btc_fees;
  struct wire_cst_chain_swap_fees btc_to_lbtc_fees;
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
  struct wire_cst_list_prim_u_8_strict *description;
} wire_cst_decoded_invoice;

typedef struct wire_cst_miner_fees {
  uint64_t lockup;
  uint64_t claim;
} wire_cst_miner_fees;

typedef struct wire_cst_outspend_status {
  int32_t kind;
  struct wire_cst_list_prim_u_8_strict *txid;
  uint64_t *timestamp;
} wire_cst_outspend_status;

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

void frbgen_boltz_wire__crate__api__error__boltz_error_detail(int64_t port_,
                                                              struct wire_cst_boltz_error *that);

void frbgen_boltz_wire__crate__api__error__boltz_error_new(int64_t port_,
                                                           struct wire_cst_list_prim_u_8_strict *kind,
                                                           struct wire_cst_list_prim_u_8_strict *message);

void frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_broadcast_boltz(int64_t port_,
                                                                        struct wire_cst_btc_ln_swap *that,
                                                                        struct wire_cst_list_prim_u_8_strict *signed_hex);

void frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_broadcast_local(int64_t port_,
                                                                        struct wire_cst_btc_ln_swap *that,
                                                                        struct wire_cst_list_prim_u_8_strict *signed_hex,
                                                                        struct wire_cst_electrum_settings *electrum_settings);

void frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_claim(int64_t port_,
                                                              struct wire_cst_btc_ln_swap *that,
                                                              struct wire_cst_list_prim_u_8_strict *out_address,
                                                              struct wire_cst_tx_fee *miner_fee,
                                                              bool try_cooperate,
                                                              struct wire_cst_electrum_settings *electrum_settings);

void frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_claim_tx_size(int64_t port_,
                                                                      struct wire_cst_btc_ln_swap *that,
                                                                      bool is_cooperative,
                                                                      struct wire_cst_electrum_settings *electrum_settings);

void frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_coop_close_submarine(int64_t port_,
                                                                             struct wire_cst_btc_ln_swap *that);

void frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_from_json(int64_t port_,
                                                                  struct wire_cst_list_prim_u_8_strict *json_str);

void frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_get_completed_submarine_preimage(int64_t port_,
                                                                                         struct wire_cst_btc_ln_swap *that);

void frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_get_preimage(int64_t port_,
                                                                     struct wire_cst_btc_ln_swap *that);

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
                                                                    struct wire_cst_swap_master_key *swap_master_key,
                                                                    uint64_t index,
                                                                    uint64_t out_amount,
                                                                    struct wire_cst_list_prim_u_8_strict *out_address,
                                                                    int32_t network,
                                                                    struct wire_cst_list_prim_u_8_strict *electrum_url,
                                                                    struct wire_cst_list_prim_u_8_strict *boltz_url,
                                                                    struct wire_cst_list_prim_u_8_strict *description,
                                                                    struct wire_cst_list_prim_u_8_strict *referral_id);

void frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_new_submarine(int64_t port_,
                                                                      struct wire_cst_swap_master_key *swap_master_key,
                                                                      uint64_t index,
                                                                      struct wire_cst_list_prim_u_8_strict *invoice,
                                                                      int32_t network,
                                                                      struct wire_cst_list_prim_u_8_strict *electrum_url,
                                                                      struct wire_cst_list_prim_u_8_strict *boltz_url,
                                                                      struct wire_cst_list_prim_u_8_strict *referral_id);

void frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_refund(int64_t port_,
                                                               struct wire_cst_btc_ln_swap *that,
                                                               struct wire_cst_list_prim_u_8_strict *out_address,
                                                               struct wire_cst_tx_fee *miner_fee,
                                                               bool try_cooperate,
                                                               struct wire_cst_electrum_settings *electrum_settings);

void frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_refund_tx_size(int64_t port_,
                                                                       struct wire_cst_btc_ln_swap *that,
                                                                       bool is_cooperative,
                                                                       struct wire_cst_electrum_settings *electrum_settings);

void frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_to_json(int64_t port_,
                                                                struct wire_cst_btc_ln_swap *that);

void frbgen_boltz_wire__crate__api__types__btc_swap_script_str_new(int64_t port_,
                                                                   int32_t swap_type,
                                                                   struct wire_cst_list_prim_u_8_strict *funding_addrs,
                                                                   struct wire_cst_list_prim_u_8_strict *hashlock,
                                                                   struct wire_cst_list_prim_u_8_strict *receiver_pubkey,
                                                                   uint32_t locktime,
                                                                   struct wire_cst_list_prim_u_8_strict *sender_pubkey,
                                                                   int32_t *side);

void frbgen_boltz_wire__crate__api__chain_swap__chain_swap_broadcast_boltz(int64_t port_,
                                                                           struct wire_cst_chain_swap *that,
                                                                           struct wire_cst_list_prim_u_8_strict *signed_hex,
                                                                           int32_t kind);

void frbgen_boltz_wire__crate__api__chain_swap__chain_swap_broadcast_local(int64_t port_,
                                                                           struct wire_cst_chain_swap *that,
                                                                           struct wire_cst_list_prim_u_8_strict *signed_hex,
                                                                           int32_t kind,
                                                                           struct wire_cst_electrum_settings *electrum_settings);

void frbgen_boltz_wire__crate__api__chain_swap__chain_swap_claim(int64_t port_,
                                                                 struct wire_cst_chain_swap *that,
                                                                 struct wire_cst_list_prim_u_8_strict *out_address,
                                                                 struct wire_cst_tx_fee *miner_fee,
                                                                 bool try_cooperate,
                                                                 struct wire_cst_electrum_settings *btc_electrum_settings,
                                                                 struct wire_cst_electrum_settings *lbtc_electrum_settings);

void frbgen_boltz_wire__crate__api__chain_swap__chain_swap_claim_tx_size(int64_t port_,
                                                                         struct wire_cst_chain_swap *that,
                                                                         struct wire_cst_list_prim_u_8_strict *out_address,
                                                                         bool try_cooperate,
                                                                         struct wire_cst_electrum_settings *btc_electrum_settings,
                                                                         struct wire_cst_electrum_settings *lbtc_electrum_settings);

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
                                                                    struct wire_cst_swap_master_key *swap_master_key,
                                                                    uint64_t index,
                                                                    uint64_t amount,
                                                                    bool is_testnet,
                                                                    struct wire_cst_list_prim_u_8_strict *btc_electrum_url,
                                                                    struct wire_cst_list_prim_u_8_strict *lbtc_electrum_url,
                                                                    struct wire_cst_list_prim_u_8_strict *boltz_url,
                                                                    struct wire_cst_list_prim_u_8_strict *referral_id);

void frbgen_boltz_wire__crate__api__chain_swap__chain_swap_refund(int64_t port_,
                                                                  struct wire_cst_chain_swap *that,
                                                                  struct wire_cst_list_prim_u_8_strict *refund_address,
                                                                  struct wire_cst_tx_fee *miner_fee,
                                                                  bool try_cooperate,
                                                                  struct wire_cst_electrum_settings *btc_electrum_settings,
                                                                  struct wire_cst_electrum_settings *lbtc_electrum_settings);

void frbgen_boltz_wire__crate__api__chain_swap__chain_swap_refund_tx_size(int64_t port_,
                                                                          struct wire_cst_chain_swap *that,
                                                                          struct wire_cst_list_prim_u_8_strict *refund_address,
                                                                          bool try_cooperate,
                                                                          struct wire_cst_electrum_settings *btc_electrum_settings,
                                                                          struct wire_cst_electrum_settings *lbtc_electrum_settings);

void frbgen_boltz_wire__crate__api__chain_swap__chain_swap_to_json(int64_t port_,
                                                                   struct wire_cst_chain_swap *that);

void frbgen_boltz_wire__crate__api__transactions__check_vout_0_outspend(int64_t port_,
                                                                        struct wire_cst_list_prim_u_8_strict *swap_id,
                                                                        int32_t swap_type,
                                                                        int32_t tx_kind,
                                                                        int32_t network,
                                                                        struct wire_cst_list_prim_u_8_strict *boltz_url,
                                                                        int32_t *chain_swap_direction);

void frbgen_boltz_wire__crate__api__invoice__decoded_invoice_from_string(int64_t port_,
                                                                         struct wire_cst_list_prim_u_8_strict *s,
                                                                         struct wire_cst_list_prim_u_8_strict *boltz_url);

void frbgen_boltz_wire__crate__api__fees__fees_chain(int64_t port_, struct wire_cst_fees *that);

void frbgen_boltz_wire__crate__api__fees__fees_new(int64_t port_,
                                                   struct wire_cst_list_prim_u_8_strict *boltz_url);

void frbgen_boltz_wire__crate__api__fees__fees_reverse(int64_t port_, struct wire_cst_fees *that);

void frbgen_boltz_wire__crate__api__fees__fees_submarine(int64_t port_, struct wire_cst_fees *that);

void frbgen_boltz_wire__crate__api__types__l_btc_swap_script_str_new(int64_t port_,
                                                                     int32_t swap_type,
                                                                     struct wire_cst_list_prim_u_8_strict *funding_addrs,
                                                                     struct wire_cst_list_prim_u_8_strict *hashlock,
                                                                     struct wire_cst_list_prim_u_8_strict *receiver_pubkey,
                                                                     uint32_t locktime,
                                                                     struct wire_cst_list_prim_u_8_strict *sender_pubkey,
                                                                     struct wire_cst_list_prim_u_8_strict *blinding_key,
                                                                     int32_t *side);

void frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_broadcast_boltz(int64_t port_,
                                                                          struct wire_cst_lbtc_ln_swap *that,
                                                                          struct wire_cst_list_prim_u_8_strict *signed_hex);

void frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_broadcast_local(int64_t port_,
                                                                          struct wire_cst_lbtc_ln_swap *that,
                                                                          struct wire_cst_list_prim_u_8_strict *signed_hex,
                                                                          struct wire_cst_electrum_settings *electrum_settings);

void frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_claim(int64_t port_,
                                                                struct wire_cst_lbtc_ln_swap *that,
                                                                struct wire_cst_list_prim_u_8_strict *out_address,
                                                                struct wire_cst_tx_fee *miner_fee,
                                                                bool try_cooperate,
                                                                struct wire_cst_electrum_settings *electrum_settings);

void frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_claim_tx_size(int64_t port_,
                                                                        struct wire_cst_lbtc_ln_swap *that,
                                                                        bool is_cooperative,
                                                                        struct wire_cst_electrum_settings *electrum_settings);

void frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_coop_close_submarine(int64_t port_,
                                                                               struct wire_cst_lbtc_ln_swap *that);

void frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_from_json(int64_t port_,
                                                                    struct wire_cst_list_prim_u_8_strict *json_str);

void frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_get_completed_submarine_preimage(int64_t port_,
                                                                                           struct wire_cst_lbtc_ln_swap *that);

void frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_get_preimage(int64_t port_,
                                                                       struct wire_cst_lbtc_ln_swap *that);

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
                                                                      struct wire_cst_swap_master_key *swap_master_key,
                                                                      uint64_t index,
                                                                      uint64_t out_amount,
                                                                      struct wire_cst_list_prim_u_8_strict *out_address,
                                                                      int32_t network,
                                                                      struct wire_cst_list_prim_u_8_strict *electrum_url,
                                                                      struct wire_cst_list_prim_u_8_strict *boltz_url,
                                                                      struct wire_cst_list_prim_u_8_strict *description,
                                                                      struct wire_cst_list_prim_u_8_strict *referral_id);

void frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_new_submarine(int64_t port_,
                                                                        struct wire_cst_swap_master_key *swap_master_key,
                                                                        uint64_t index,
                                                                        struct wire_cst_list_prim_u_8_strict *invoice,
                                                                        int32_t network,
                                                                        struct wire_cst_list_prim_u_8_strict *electrum_url,
                                                                        struct wire_cst_list_prim_u_8_strict *boltz_url,
                                                                        struct wire_cst_list_prim_u_8_strict *referral_id);

void frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_refund(int64_t port_,
                                                                 struct wire_cst_lbtc_ln_swap *that,
                                                                 struct wire_cst_list_prim_u_8_strict *out_address,
                                                                 struct wire_cst_tx_fee *miner_fee,
                                                                 bool try_cooperate,
                                                                 struct wire_cst_electrum_settings *electrum_settings);

void frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_refund_tx_size(int64_t port_,
                                                                         struct wire_cst_lbtc_ln_swap *that,
                                                                         bool is_cooperative,
                                                                         struct wire_cst_electrum_settings *electrum_settings);

void frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_to_json(int64_t port_,
                                                                  struct wire_cst_lbtc_ln_swap *that);

void frbgen_boltz_wire__crate__api__lnurl__lnurl_fetch_invoice(int64_t port_,
                                                               struct wire_cst_lnurl *that,
                                                               uint64_t msats);

void frbgen_boltz_wire__crate__api__lnurl__lnurl_get_voucher_max_amount(int64_t port_,
                                                                        struct wire_cst_lnurl *that);

void frbgen_boltz_wire__crate__api__lnurl__lnurl_new(int64_t port_,
                                                     struct wire_cst_list_prim_u_8_strict *value);

void frbgen_boltz_wire__crate__api__lnurl__lnurl_validate(int64_t port_,
                                                          struct wire_cst_lnurl *that);

void frbgen_boltz_wire__crate__api__lnurl__lnurl_withdraw(int64_t port_,
                                                          struct wire_cst_lnurl *that,
                                                          struct wire_cst_list_prim_u_8_strict *invoice);

void frbgen_boltz_wire__crate__api__secrets__pre_image_from_invoice_str(int64_t port_,
                                                                        struct wire_cst_list_prim_u_8_strict *invoice);

void frbgen_boltz_wire__crate__api__secrets__pre_image_new(int64_t port_,
                                                           struct wire_cst_list_prim_u_8_strict *value,
                                                           struct wire_cst_list_prim_u_8_strict *sha256,
                                                           struct wire_cst_list_prim_u_8_strict *hash160);

void frbgen_boltz_wire__crate__api__restore__restore_chain_swaps(int64_t port_,
                                                                 struct wire_cst_swap_master_key *swap_master_key,
                                                                 struct wire_cst_list_prim_u_8_strict *btc_electrum_url,
                                                                 struct wire_cst_list_prim_u_8_strict *lbtc_electrum_url,
                                                                 struct wire_cst_list_prim_u_8_strict *boltz_url);

void frbgen_boltz_wire__crate__api__restore__restore_ln_btc_swaps(int64_t port_,
                                                                  struct wire_cst_swap_master_key *swap_master_key,
                                                                  struct wire_cst_list_prim_u_8_strict *electrum_url,
                                                                  struct wire_cst_list_prim_u_8_strict *boltz_url);

void frbgen_boltz_wire__crate__api__restore__restore_ln_lbtc_swaps(int64_t port_,
                                                                   struct wire_cst_swap_master_key *swap_master_key,
                                                                   struct wire_cst_list_prim_u_8_strict *electrum_url,
                                                                   struct wire_cst_list_prim_u_8_strict *boltz_url);

void frbgen_boltz_wire__crate__api__restore__restore_swap_index(int64_t port_,
                                                                struct wire_cst_swap_master_key *swap_master_key,
                                                                struct wire_cst_list_prim_u_8_strict *boltz_url);

void frbgen_boltz_wire__crate__api__restore__restore_swap_summaries(int64_t port_,
                                                                    struct wire_cst_swap_master_key *swap_master_key,
                                                                    struct wire_cst_list_prim_u_8_strict *boltz_url);

void frbgen_boltz_wire__crate__api__secrets__swap_master_key_create(int64_t port_,
                                                                    struct wire_cst_list_prim_u_8_strict *wallet_mnemonic,
                                                                    struct wire_cst_list_prim_u_8_strict *wallet_passphrase,
                                                                    int32_t network);

WireSyncRust2DartDco frbgen_boltz_wire__crate__api__swap_status__swap_status_as_string(int32_t that);

WireSyncRust2DartDco frbgen_boltz_wire__crate__api__swap_status__swap_status_from_json_string(struct wire_cst_list_prim_u_8_strict *status);

WireSyncRust2DartDco frbgen_boltz_wire__crate__api__swap_status__swap_status_response_from_json(struct wire_cst_list_prim_u_8_strict *json);

WireSyncRust2DartDco frbgen_boltz_wire__crate__api__swap_status__swap_status_response_to_json(struct wire_cst_swap_status_response *that);

WireSyncRust2DartDco frbgen_boltz_wire__crate__api__swap_status__swap_status_to_json_string(int32_t that);

WireSyncRust2DartDco frbgen_boltz_wire__crate__api__swap_status__swap_stream_status_from_json(struct wire_cst_list_prim_u_8_strict *json);

WireSyncRust2DartDco frbgen_boltz_wire__crate__api__swap_status__swap_stream_status_to_json(struct wire_cst_swap_stream_status *that);

WireSyncRust2DartDco frbgen_boltz_wire__crate__api__swap_status__transaction_from_json(struct wire_cst_list_prim_u_8_strict *json);

WireSyncRust2DartDco frbgen_boltz_wire__crate__api__swap_status__transaction_to_json(struct wire_cst_transaction *that);

struct wire_cst_boltz_error *frbgen_boltz_cst_new_box_autoadd_boltz_error(void);

struct wire_cst_btc_ln_swap *frbgen_boltz_cst_new_box_autoadd_btc_ln_swap(void);

struct wire_cst_btc_swap_script_str *frbgen_boltz_cst_new_box_autoadd_btc_swap_script_str(void);

struct wire_cst_chain_swap *frbgen_boltz_cst_new_box_autoadd_chain_swap(void);

int32_t *frbgen_boltz_cst_new_box_autoadd_chain_swap_direction(int32_t value);

struct wire_cst_electrum_settings *frbgen_boltz_cst_new_box_autoadd_electrum_settings(void);

struct wire_cst_fees *frbgen_boltz_cst_new_box_autoadd_fees(void);

struct wire_cst_key_pair *frbgen_boltz_cst_new_box_autoadd_key_pair(void);

struct wire_cst_l_btc_swap_script_str *frbgen_boltz_cst_new_box_autoadd_l_btc_swap_script_str(void);

struct wire_cst_lbtc_ln_swap *frbgen_boltz_cst_new_box_autoadd_lbtc_ln_swap(void);

struct wire_cst_lnurl *frbgen_boltz_cst_new_box_autoadd_lnurl(void);

struct wire_cst_pre_image *frbgen_boltz_cst_new_box_autoadd_pre_image(void);

int32_t *frbgen_boltz_cst_new_box_autoadd_side(int32_t value);

struct wire_cst_swap_master_key *frbgen_boltz_cst_new_box_autoadd_swap_master_key(void);

struct wire_cst_swap_status_response *frbgen_boltz_cst_new_box_autoadd_swap_status_response(void);

struct wire_cst_swap_stream_status *frbgen_boltz_cst_new_box_autoadd_swap_stream_status(void);

struct wire_cst_transaction *frbgen_boltz_cst_new_box_autoadd_transaction(void);

struct wire_cst_tx_fee *frbgen_boltz_cst_new_box_autoadd_tx_fee(void);

uint32_t *frbgen_boltz_cst_new_box_autoadd_u_32(uint32_t value);

uint64_t *frbgen_boltz_cst_new_box_autoadd_u_64(uint64_t value);

struct wire_cst_list_btc_ln_swap *frbgen_boltz_cst_new_list_btc_ln_swap(int32_t len);

struct wire_cst_list_chain_swap *frbgen_boltz_cst_new_list_chain_swap(int32_t len);

struct wire_cst_list_lbtc_ln_swap *frbgen_boltz_cst_new_list_lbtc_ln_swap(int32_t len);

struct wire_cst_list_prim_u_8_strict *frbgen_boltz_cst_new_list_prim_u_8_strict(int32_t len);

struct wire_cst_list_restored_swap_summary *frbgen_boltz_cst_new_list_restored_swap_summary(int32_t len);
static int64_t dummy_method_to_enforce_bundling(void) {
    int64_t dummy_var = 0;
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_boltz_error);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_btc_ln_swap);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_btc_swap_script_str);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_chain_swap);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_chain_swap_direction);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_electrum_settings);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_fees);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_key_pair);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_l_btc_swap_script_str);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_lbtc_ln_swap);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_lnurl);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_pre_image);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_side);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_swap_master_key);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_swap_status_response);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_swap_stream_status);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_transaction);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_tx_fee);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_u_32);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_box_autoadd_u_64);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_list_btc_ln_swap);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_list_chain_swap);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_list_lbtc_ln_swap);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_list_prim_u_8_strict);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_cst_new_list_restored_swap_summary);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_broadcast_boltz);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_broadcast_local);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_claim);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_claim_tx_size);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_coop_close_submarine);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_from_json);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_get_completed_submarine_preimage);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_get_preimage);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_new);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_new_reverse);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_new_submarine);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_refund);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_refund_tx_size);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__btc_ln__btc_ln_swap_to_json);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__chain_swap__chain_swap_broadcast_boltz);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__chain_swap__chain_swap_broadcast_local);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__chain_swap__chain_swap_claim);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__chain_swap__chain_swap_claim_tx_size);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__chain_swap__chain_swap_from_json);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__chain_swap__chain_swap_get_server_lockup);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__chain_swap__chain_swap_get_user_lockup);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__chain_swap__chain_swap_new);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__chain_swap__chain_swap_new_swap);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__chain_swap__chain_swap_refund);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__chain_swap__chain_swap_refund_tx_size);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__chain_swap__chain_swap_to_json);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__error__boltz_error_detail);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__error__boltz_error_new);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__fees__fees_chain);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__fees__fees_new);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__fees__fees_reverse);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__fees__fees_submarine);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__invoice__decoded_invoice_from_string);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_broadcast_boltz);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_broadcast_local);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_claim);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_claim_tx_size);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_coop_close_submarine);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_from_json);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_get_completed_submarine_preimage);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_get_preimage);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_new);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_new_reverse);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_new_submarine);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_refund);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_refund_tx_size);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lbtc_ln__lbtc_ln_swap_to_json);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lnurl__lnurl_fetch_invoice);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lnurl__lnurl_get_voucher_max_amount);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lnurl__lnurl_new);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lnurl__lnurl_validate);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__lnurl__lnurl_withdraw);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__restore__restore_chain_swaps);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__restore__restore_ln_btc_swaps);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__restore__restore_ln_lbtc_swaps);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__restore__restore_swap_index);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__restore__restore_swap_summaries);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__secrets__pre_image_from_invoice_str);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__secrets__pre_image_new);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__secrets__swap_master_key_create);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__swap_status__swap_status_as_string);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__swap_status__swap_status_from_json_string);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__swap_status__swap_status_response_from_json);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__swap_status__swap_status_response_to_json);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__swap_status__swap_status_to_json_string);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__swap_status__swap_stream_status_from_json);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__swap_status__swap_stream_status_to_json);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__swap_status__transaction_from_json);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__swap_status__transaction_to_json);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__transactions__check_vout_0_outspend);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__types__btc_swap_script_str_new);
    dummy_var ^= ((int64_t) (void*) frbgen_boltz_wire__crate__api__types__l_btc_swap_script_str_new);
    dummy_var ^= ((int64_t) (void*) store_dart_post_cobject);
    return dummy_var;
}
