# 0.1.7

- Initial version

# 0.1.8

- fix libboltz.a not found

# 0.1.9

- Discount CT (Confidential Transaction)
- Tx fees options absolute and relative
- CI nightly to stable

# 0.1.10

- Added methods to get preimage from completed submarine swap
- Updated methods to support using passphrase.
- fix: method name cannot be the same as struct property name
- updated passphrase to be an Option; leaving dart interface unchanged
- boltz-0.3.0: Updated lbtc_ln + renamed Chain type
- boltz-0.3.0: Updated fees
- dep(update): using latest boltz-rust. added description to decoded invoice
- fix: lock boltz-client version 

# 0.2.0
- upgrade: frb 2.9.0 (breaking)
- fix: added into() for submarine limits.
- Added lnurl freezed. Updated generated files 
- feat: claim/refund sizes

# 0.2.1
- fix: do not build swap tx for chain claim and coop close
- fix: Update to latest boltz-rust commit

# 0.3.0
- feat: add transactions module to track claim/refund transaction outspends
- feat: add ElectrumSettings class to pass custom electrum settings to swap objects
- feat: add transaction.direct support
- feat: add tx to swap stream
- feat: add claim tx size to chain swaps
- feat: update Cooperative struct; added get submarine preimage method
- fix: pass referral id to chain swaps
- fix: support for 16kb page size on Android
- fix: building for flutter >3.32.0
- fix: bad dependency to boltz-rust
- dep: update flutter_rust_bridge to 2.11.1

# 0.4.0
- feat: move swap_status types from Dart to Rust (SwapStatus, SwapStatusResponse, SwapStreamStatus, Transaction)
- feat: add fromJson/toJson methods to SwapStreamStatus, SwapStatusResponse and Transaction
- feat: add bull_sdk feature to cfg-gate frb_generated
- upgrade: flutter_rust_bridge to 2.12.0; flutter 3.44.1, dart 3.12.1, frb codegen 2.12.0
- chore: pin lockfiles and update deps to latest

# 0.5.0
- feat(breaking): derive all swap keys from a single SwapMasterKey (BIP85-derived swap mnemonic); `new_submarine`/`new_reverse`/`new_swap` now take a `SwapMasterKey` + `index` instead of a keypair, and the caller manages the index
- feat: add swap restore via the swap xpub — `restore_swap_summaries`, `restore_swap_index`, `restore_ln_btc_swaps`, `restore_ln_lbtc_swaps`, `restore_chain_swaps`
- feat: expose invoice, secrets and restore modules from `boltz.dart`
- refactor: reorganize wrapper types (KeyPair, PreImage, SwapMasterKey, fee structs)
- dep: use published `boltz-client` 0.4.1 crate (was a pinned git rev)
- test(rust): cover secrets derivation, invoice decode and swap status parsing
- ci: add GitHub Actions (cargo test + dart analyze); pin Flutter 3.44.1

# 0.5.1
- fix(rustls): install the `ring` crypto provider before opening electrum TLS, preventing a process abort (SIGABRT) when both `ring` and `aws-lc-rs` are linked (e.g. in the bull_sdk aggregate) and rustls 0.23 cannot auto-pick a default provider
- ci: log `ldd` of the built `libboltz.so` in the unit-test job to surface unresolved native deps
- test: include the dylib path and underlying error in the "unable to open unit test dylib" exception

# 0.5.2
- feat: `check_lockup_outspends` — outspend status of EVERY lockup output (spender txid, block time, amount where visible), replacing the vout-0 assumption of `check_vout_0_outspend`; callers must verify the spender paid them before settling a swap
