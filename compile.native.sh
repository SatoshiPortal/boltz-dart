#!/bin/bash
cd rust || exit 1
cargo update
cargo build --release
OS=$(uname -s)
if [ "$OS" = "Linux" ]; then
    cp target/release/libboltz_dart.so ../test/
elif [ "$OS" = "Darwin" ]; then
    cp target/release/libboltz_dart.dylib ../test/
else
    echo "Unsupported OS: $OS"
    exit 1
fi
cd - || exit 1
flutter_rust_bridge_codegen --rust-input rust/src/api.rs --dart-output lib/bridge_generated.dart --dart-decl-output lib/bridge_definitions.dart
