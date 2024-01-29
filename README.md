# boltz-dart

The top level directory of this project is a dart/flutter pub library.

The `rust` folder containers the core code which uses the `boltz-rust` crate internally to expose an abstracted API to manage boltz swaps.

## Dependencies

```bash
cargo install flutter_rust_bridge_codegen
cargo install cargo-expand
cargo install cargo-ndk
@if [ $$(uname) == "Darwin" ] ; then cargo install cargo-lipo ; fi
```

For ios builds, make sure you have xcode installed.

## Update & Build process

Add new types to `types.rs` and static functions to `api.rs`

api.rs contains an `Api` struct that holds all the static functions.

types.rs structures and enums are also re-exported via api.rs

```bash
# in the project root directory

./compile.native.sh # build for your native platform (linux/macos). adds binary to dart test folder.
./compile.android.sh # build for android (workds on linux and macos hosts)
./compile.ios.sh # build for ios (can only build on macos hosts)

```

Compile will first build native binaries of the rust code and move them to the dart test folder. 

It will then run flutter_rust_bridge_codegen and generate ffi code in rust and dart. 

### Non-debian linux users

On non-debian systems you will get some errors with the `bridge_generated.dart` files.

Error would be related to:
```rust
  void store_dart_post_cobject(
    int ptr,
  ) {
    return _store_dart_post_cobject(
      ptr,
    );
  }
```

You may need to set the path the clang in CPATH manually.
Run the following:
```bash
export CPATH="$(clang -v 2>&1 | grep "Selected GCC installation" | rev | cut -d' ' -f1 | rev)/include"
```

## dart classes

Once we have all our structs and functions in dart, we can organize them into classes to improve the UX of the library.

## test

You can now use the `test/boltz-test.dart` file to test whether the expected logic is being exposed correctly over ffi. 

## NOTE

The reverse swap test can be run without any updates to local variables.

The submarine swap test requires using a new invoice for every test. You can generate test invoices here:

https://starblocks.acinq.co

Order half a ton of coffee, since minimum swap output is 50,000 sats

These invoices will work for ruidentary tests, but the entire swap flow will not complete as boltz does not have a route to pay this channel since we last checked.

When we reach testing the complete flow we will have to use our own local node and ensure we are directly connected to boltz's testnet node.

For Invoices < 1m sats: (recommended for testing)

https://1ml.com/testnet/node/029040945df331e634fba152ce6a21e3dfca87b68d275e078caeee4753f43e9acb

Invoices > 1m sats: 

https://1ml.com/testnet/node/03f060953bef5b777dc77e44afa3859d022fc1a77c55138deb232ad7255e869c00

## project status

This project is in extreme alpha and undergoing active development. Any support will be greatly appreciated.

Each swap flow is abstracted into a class with similar methods:

Constructors: 

- newSubmarine
- newReverse

Info: 
- paymentDetails
- status

Transaction(Sweep):
- claim
- refund


The main classes and their methods are:

- [ ] BtcLnSwap
  - [x] newSubmarine
  - [x] newReverse
  - [x] paymentDetails
  - [x] status
  - [x] claim
  - [ ] refund
- [ ] LbtcLnSwap
  - [x] newSubmarine
  - [x] newReverse
  - [x] paymentDetails
  - [x] status
  - [x] claim
  - [ ] refund
- [ ] BtcLbtcSwap

## Dependencies

To stay in sync with `boltz-rust` following updates, use: 

```
cargo update
```

### Resources:

- [FRB-Docs](https://cjycode.com/flutter_rust_bridge/v1/index.html)
- [FRB-Codebase](https://github.com/fzyzcjy/flutter_rust_bridge/)
- [Article](https://blog.logrocket.com/using-flutter-rust-bridge-cross-platform-development/)
