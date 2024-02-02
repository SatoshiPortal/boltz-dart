#!/bin/bash
ROOT="target"
VERSION="0.1.2"
NAME="libboltz"
LINUX_DIR=$ROOT/$NAME.$VERSION/linux # final binaries stored here
# aarch64-unknown-linux-gnu \
# arm-unknown-linux-gnueabi \
# armv7-unknown-linux-gnueabi \
# i686-unknown-linux-gnu \

cd boltz-dart || exit

for TARGET in \
    x86_64-unknown-linux-gnu 
    # aarch64-unknown-linux-gnu install using docker image amd-64/rust:slim-bullseye requires aarch64-linux-gnu-gcc

do
    rustup target add $TARGET
    cargo build --target-dir $LINUX_DIR -r --target=$TARGET
done
