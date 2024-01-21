#!/bin/bash -e
# Android SDK without Android Studio
# https://proandroiddev.com/how-to-setup-android-sdk-without-android-studio-6d60d0f2812a
RUST_REPO="/boltz-dart/rust"

cd $RUST_REPO && make android
cargo build --release

TARGET_DIRECTORY="$RUST_REPO/target"
BUILDS_DIRECTORY="$RUST_REPO/builds"

rm -rf $BUILDS_DIRECTORY

mkdir -p $BUILDS_DIRECTORY/armv7-linux-androideabi
mkdir -p $BUILDS_DIRECTORY/x86_64-linux-android
mkdir -p $BUILDS_DIRECTORY/aarch64-linux-android
mkdir -p $BUILDS_DIRECTORY/i686-linux-android
mkdir -p $BUILDS_DIRECTORY/x86_64-apple-darwin
mkdir -p $BUILDS_DIRECTORY/x86_64-linux-unknown

cp $TARGET_DIRECTORY/aarch64-linux-android/release/libboltz_dart.so $BUILDS_DIRECTORY/aarch64-linux-android/
cp $TARGET_DIRECTORY/x86_64-linux-android/release/libboltz_dart.so $BUILDS_DIRECTORY/x86_64-linux-android/
cp $TARGET_DIRECTORY/i686-linux-android/release/libboltz_dart.so $BUILDS_DIRECTORY/i686-linux-android/
cp $TARGET_DIRECTORY/armv7-linux-androideabi/release/libboltz_dart.so $BUILDS_DIRECTORY/armv7-linux-androideabi/
cp $TARGET_DIRECTORY/release/libboltz_dart.so $BUILDS_DIRECTORY/x86_64-linux-unknown/

exit