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

### Regtest networks

Use `Chain.bitcoinRegtest` or `Chain.liquidRegtest` for Lightning swaps, and `Network.regtest` for `ChainSwap` creation and recovery. `ChainSwap` constructors now take `network` instead of `isTestnet`. The swap master key must carry the same network. Existing key derivation is unchanged; callers must continue allocating monotonically increasing child indices for shared key material.

`await RegtestNetworkProfile.forHost(host: host)` captures the explicitly selected host; `await RegtestNetworkProfile.localhost()` defaults to `127.0.0.1`. The localhost profile provides Boltz at `http://127.0.0.1:9001/v2`, Bitcoin/Liquid Electrum at ports `50000`/`50001`, and Esplora at ports `3000`/`3001` without an `/api` suffix. Use its Electrum settings for TCP and pass the matching explorer URL to `checkLockupOutspends`. Pass `regtestProfile` to creation, recovery and transaction calls. Regtest accepts only the exact endpoints of that profile and never falls back to another host or explorer. Quotes use `Fees.forRegtest(profile: profile)`. Local clients do not follow redirects or inherit an HTTP proxy. The deprecated vout-zero API is not extended for regtest.

Persisted mainnet/testnet chain swaps retain the original `is_testnet` JSON boolean on both read and rewrite. Regtest uses `network: "Regtest"` without that boolean, so older readers reject it. Missing, duplicate or conflicting network fields are rejected. Regtest objects also retain their endpoint profile. Recovery preserves the network from the swap master key and checks regtest lockup addresses before deriving child keys. Hydrating JSON alone does not validate an operational context; operations validate the captured profile before signing or network access.

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
