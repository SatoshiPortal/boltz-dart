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
