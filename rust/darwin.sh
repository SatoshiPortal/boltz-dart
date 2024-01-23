#!/bin/bash

# Setup
BUILD_DIR=boltz-dart.0.1.0
MACOS_DIR="../macos" # final binaries stored here
IOS_DIR="../ios" # final binaries stored here
FRAMEWORK="libboltz_dart.xcframework"
LIBNAME=libboltz_dart.a

IOS_LIPO_DIR=$BUILD_DIR/ios-sim-lipo
MAC_LIPO_DIR=$BUILD_DIR/mac-lipo
IOS_LIPO=$IOS_LIPO_DIR/$LIBNAME
MAC_LIPO=$MAC_LIPO_DIR/$LIBNAME


if [ -d "$IOS_DIR/$FRAMEWORK" ]; then rm -r $IOS_DIR/$FRAMEWORK
fi
if [ -d "$MACOS_DIR/$FRAMEWORK" ]; then rm -r $MACOS_DIR/$FRAMEWORK
fi
mkdir -p $IOS_LIPO_DIR $MAC_LIPO_DIR

# Build static libs
for TARGET in \
    aarch64-apple-ios \
    x86_64-apple-ios \
    aarch64-apple-ios-sim \
    x86_64-apple-darwin \
    aarch64-apple-darwin
do
    rustup target add $TARGET
    cargo build -r --target=$TARGET
done

cargo install cargo-lipo
# Create XCFramework zip
lipo -create -output $IOS_LIPO \
        target/aarch64-apple-ios-sim/release/$LIBNAME \
        target/x86_64-apple-ios/release/$LIBNAME
lipo -create -output $MAC_LIPO \
        target/aarch64-apple-darwin/release/$LIBNAME \
        target/x86_64-apple-darwin/release/$LIBNAME

xcodebuild -create-xcframework \
        -library $IOS_LIPO \
        -library $MAC_LIPO \
        -library target/aarch64-apple-ios/release/$LIBNAME \
        -output $BUILD_DIR/$FRAMEWORK

# Copy to destination folder
cp -r $BUILD_DIR/$FRAMEWORK $IOS_DIR
cp -r $BUILD_DIR/$FRAMEWORK $MACOS_DIR

## Cleanup
rm -rf $BUILD_DIR
