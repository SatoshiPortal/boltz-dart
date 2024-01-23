#!/bin/bash
cd rust
cargo update
cd - || exit 1

flutter_rust_bridge_codegen \
    --rust-input rust/src/api.rs \
    --dart-output lib/bridge_generated.dart \
    --dart-decl-output lib/bridge_definitions.dart
