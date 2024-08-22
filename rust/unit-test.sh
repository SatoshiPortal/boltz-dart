#!/bin/bash
VERSION=$1
mkdir -p target/unittest.libboltz_dart.$VERSION
cargo build --release
OS=$(uname -s)
if [ "$OS" = "Linux" ]; then
    cp target/release/libboltz_dart.so target/unittest.libboltz_dart.$VERSION
    cp target/release/libboltz_dart.so ../build/unit_test_assets/lib
elif [ "$OS" = "Darwin" ]; then
    cp target/release/libboltz_dart.dylib target/unittest.libboltz_dart.$VERSION
else
    echo "Unsupported OS: $OS"
    exit 1
fi
