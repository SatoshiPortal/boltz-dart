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