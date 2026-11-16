# boltz-dart

The top level directory of this project is a dart/flutter pub library.

The `rust` folder containers the core code which uses the `boltz-rust` crate internally to expose an abstracted API to manage boltz swaps.

## Usage

Init the library in your apps main()

Eg:

```dart

Future main({bool fromTest = false}) async {
  if (!fromTest) WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(isOptional: true);
  Bloc.observer = BBlocObserver();
  // await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);

  await setupLocator(fromTest: fromTest);
  final delegate = await Localise.getDelegate();
  LwkCore.init();
  BoltzCore.init();
  runApp(
    LocalizedApp(
      delegate,
      const BullBitcoinWalletApp(),
    ),
  );
}
```

## Dependencies

The Flutter build hook compiles the pinned Rust crate as a Native Asset. Consumers need the matching Rust toolchain and platform targets installed.

```bash
# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# install tools
cargo install flutter_rust_bridge_codegen --version 2.13.0
cargo install cargo-ndk
cargo install cargo-lipo
```

For ios builds, make sure you have xcode and cocoapods installed.

## Update & Build process

Add new types to `types.rs` and static functions to `api.rs`

api.rs contains an `Api` struct that holds all the static functions.

types.rs structures and enums are also re-exported via api.rs

```bash
# in the project root directory

./compile.native.sh # build for your native platform (linux/macos). adds binary to dart test folder.

```

## MacOS as host

macos as the host machine can build binaries for all platforms using:

```bash
# requires dockerd running
./compile.all.sh
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

Also try `flutter run` in the `example` directory.

### Resources:

- [FRB-Docs](https://cjycode.com/flutter_rust_bridge/v1/index.html)
- [FRB-Codebase](https://github.com/fzyzcjy/flutter_rust_bridge/)
- [Article](https://blog.logrocket.com/using-flutter-rust-bridge-cross-platform-development/)

### Regtest

Use `Chain.bitcoinRegtest` or `Chain.liquidRegtest` with caller-supplied Boltz and Electrum URLs. Plaintext Boltz URLs are accepted for testnet and regtest. For a TCP Electrum service, pass `ElectrumSettings` with `tls: false` and `validateDomain: false`. The library does not impose hosts, ports or paths.

`ChainSwap` takes `Network` instead of `isTestnet`. Mainnet/testnet JSON retains the legacy `is_testnet` format; regtest JSON uses an explicit discriminator that older readers reject. Swap creation rejects a master key whose network does not match the requested chain, on every network.

`checkLockupOutspends` requires an explicit `explorerUrl` on regtest, with no public-explorer fallback. Select the explorer for the actual lockup chain (the server's chain for a claim, the user's chain for a refund). Existing mainnet/testnet explorer defaults remain available.
