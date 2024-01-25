#!/bin/bash
# Setup jniLibs directory
ROOT="target"
VERSION="0.1.0"
NAME="libboltz"
JNI_DIR=$ROOT/$NAME.$VERSION/jniLibs # final binaries stored here

if [ -d "$JNI_DIR" ]; then rm -r "$JNI_DIR"
fi
mkdir -p $BUILD_DIR/$JNI_DIR

# Set up cargo-ndk
cargo install cargo-ndk
rustup target add \
        aarch64-linux-android \
        armv7-linux-androideabi \
        x86_64-linux-android \
        i686-linux-android

# Build the android libraries in the jniLibs directory
cargo ndk -o $JNI_DIR \
        -t armeabi-v7a \
        -t arm64-v8a \
        -t x86 \
        -t x86_64 \
        build --release


     