#!/bin/bash
mkdir -p build/unit_test_assets
cd rust || exit 1
cargo update
cargo build --release
OS=$(uname -s)
if [ "$OS" = "Linux" ]; then
    cp target/release/libboltzdart.so ../build/unit_test_assets
elif [ "$OS" = "Darwin" ]; then
    cp target/release/libboltzdart.a ../build/unit_test_assets
    cp target/release/libboltzdart.dylib ../build/unit_test_assets
else
    echo "Unsupported OS: $OS"
    exit 1
fi
cd - || exit 1
