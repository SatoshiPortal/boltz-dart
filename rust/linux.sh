#!/bin/bash
ROOT="target"
VERSION="0.1.2"
NAME="libboltz"
LINUX_DIR=$ROOT/$NAME.$VERSION/linux # final binaries stored here
# aarch64-unknown-linux-gnu \
# arm-unknown-linux-gnueabi \
# armv7-unknown-linux-gnueabi \
# i686-unknown-linux-gnu \

cd boltz-dart

#cd ./src || exit

for TARGET in \
    x86_64-unknown-linux-gnu
do
    rustup target add $TARGET
    cargo build --target-dir $LINUX_DIR -r --target=x86_64-unknown-linux-gnu
done
