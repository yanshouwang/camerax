$PIGEONS_OUT = "android/src/main/java/dev/yanshouwang/camerax_android"

if (-NOT (Test-Path $PIGEONS_OUT)) {
    New-Item $PIGEONS_OUT -ItemType Directory
}

flutter pub run pigeon `
    --input pigeons.dart `
    --one_language true `
    --java_out "${PIGEONS_OUT}/Pigeons.java" `
    --java_package dev.yanshouwang.camerax_android