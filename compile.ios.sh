#!/bin/bash
cd rust || exit 1

OS=$(uname -s)
if [ "$OS" = "Linux" ]; then
    echo "Linux build for IOS currently unsupported"
elif [ "$OS" = "Darwin" ]; then
    cargo update
    bash darwin.sh
else
    echo "Unsupported OS: $OS"
    exit 1
fi
cd - || exit 1

flutter_rust_bridge_codegen --rust-input rust/src/api.rs --dart-output lib/bridge_generated.dart --dart-decl-output lib/bridge_definitions.dart
