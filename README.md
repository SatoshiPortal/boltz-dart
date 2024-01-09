# boltz-dart

The top level directory of this project is a dart/flutter pub library.

The `rust` folder containers the core code which uses the `boltz-rust` crate internally to expose an abstracted API to manage boltz swaps.


## Update process

Add new types to `types.rs` and static functions to `api.rs`

api.rs contains an `Api` struct that holds all the static functions.

types.rs structures and enums are also re-exported via api.rs

```bash
# in the project root directory

./compile.sh

```

Compile will first build native binaries of the rust code and move them to the dart test folder. 

It will then run flutter_rust_bridge_codegen and generate ffi code in rust and dart. 

## dart classes

Once we have all our structs and functions in dart, we can organize them into classes to improve the UX of the library.

## test

You can now use the `test/boltz-test.dart` file to test whether the expected logic is being exposed correctly over ffi. 


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


The main classes are:

- [ ] BtcLnSwap
- [ ] LbtcLnSwap
- [ ] BtcLbtcSwap


### Resources:

- [FRB-Docs](https://cjycode.com/flutter_rust_bridge/v1/index.html)
- [FRB-Codebase](https://github.com/fzyzcjy/flutter_rust_bridge/)
- [Article](https://blog.logrocket.com/using-flutter-rust-bridge-cross-platform-development/)
