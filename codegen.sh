#!/bin/bash
cd rust
cargo update
cd - || exit 1

flutter_rust_bridge_codegen \
    --rust-input rust/src/api.rs \
    --dart-output lib/src/generated/bindings.dart \
    --dart-decl-output lib/src/generated/bridge_definitions.dart
