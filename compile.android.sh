#!/bin/bash
cd rust
cargo update
bash android.sh
cd - || exit 1
flutter_rust_bridge_codegen \
    --rust-input rust/src/api.rs \
    --dart-output lib/bridge_generated.dart \
    --dart-decl-output lib/bridge_definitions.dart

# docker build --platform linux/x86_64 --build-arg USER_ID=$(id -u) -t bcbuilder .
# cd .. || exit 1
# docker run --platform linux/x86_64 --name bcbuilder01 -v $PWD:/boltz-dart bcbuilder ; docker stop bcbuilder01 ; docker rm bcbuilder01
# flutter_rust_bridge_codegen --rust-input rust/src/api.rs --dart-output lib/bridge_generated.dart --dart-decl-output lib/bridge_definitions.dart

