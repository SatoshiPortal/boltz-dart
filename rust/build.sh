#!/bin/bash -e
# Android SDK without Android Studio
# https://proandroiddev.com/how-to-setup-android-sdk-without-android-studio-6d60d0f2812a
REPO="/boltz-dart"

cd $REPO/rust && make android
# cargo build --release

TARGET_DIRECTORY="$REPO/rust/target"
BUILDS_DIRECTORY="$REPO/rust/builds"

# rm -rf $BUILDS_DIRECTORY

ARM64_DIR=$REPO/android/src/main/jniLibs/arm64-v8a
ARMV7_DIR=$REPO/android/src/main/jniLibs/armeabi-v7a
I686_DIR=$REPO/android/src/main/jniLibs/x86
X64_DIR=$REPO/android/src/main/jniLibs/x86_86

mkdir -p $ARM64_DIR
mkdir -p $ARMV7_DIR
mkdir -p $I686_DIR
mkdir -p $X64_DIR

mkdir -p $BUILDS_DIRECTORY/armv7-linux-androideabi
mkdir -p $BUILDS_DIRECTORY/x86_64-linux-android
mkdir -p $BUILDS_DIRECTORY/aarch64-linux-android
mkdir -p $BUILDS_DIRECTORY/i686-linux-android
# mkdir -p $BUILDS_DIRECTORY/x86_64-apple-darwin
# mkdir -p $BUILDS_DIRECTORY/x86_64-linux-unknown

cp $TARGET_DIRECTORY/aarch64-linux-android/release/libboltz_dart.so $ARM64_DIR/
cp $TARGET_DIRECTORY/x86_64-linux-android/release/libboltz_dart.so $X64_DIR
cp $TARGET_DIRECTORY/i686-linux-android/release/libboltz_dart.so $I686_DIR
cp $TARGET_DIRECTORY/armv7-linux-androideabi/release/libboltz_dart.so $ARMV7_DIR
# cp $TARGET_DIRECTORY/release/libboltz_dart.so $BUILDS_DIRECTORY/x86_64-linux-unknown/

exit