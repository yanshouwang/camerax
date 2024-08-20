#!/bin/bash
set -e

THIS_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
FLUTTER_DIR="$( which flutter )/.."

swiftc -c "$THIS_DIR/../ios/Classes/AuthorizationType.swift" \
    "$THIS_DIR/../ios/Classes/CameraCapturePhotoCaptureDelegate.swift" \
    "$THIS_DIR/../ios/Classes/CameraController.swift" \
    "$THIS_DIR/../ios/Classes/CameraError.swift" \
    "$THIS_DIR/../ios/Classes/CameraSelector.swift" \
    "$THIS_DIR/../ios/Classes/FlashMode.swift" \
    "$THIS_DIR/../ios/Classes/ImageProxy.swift" \
    "$THIS_DIR/../ios/Classes/LensFacing.swift" \
    "$THIS_DIR/../ios/Classes/PreviewView.swift" \
    "$THIS_DIR/../ios/Classes/PreviewViewFactory.swift" \
    "$THIS_DIR/../ios/Classes/ScaleType.swift" \
    "$THIS_DIR/../ios/Classes/TorchState.swift" \
    "$THIS_DIR/../ios/Classes/ZoomState.swift" \
    -module-name camerax_ios \
    -target x86_64-apple-ios12.0-simulator \
    -sdk "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk" \
    -F "$FLUTTER_DIR/cache/artifacts/engine/ios/Flutter.xcframework/ios-arm64_x86_64-simulator" \
    -emit-objc-header-path "$THIS_DIR/camerax_ios.h"