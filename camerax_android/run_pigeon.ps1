$JAVA_OUT = "android/src/main/java/dev/yanshouwang/camerax"

if (-NOT (Test-Path $JAVA_OUT)) {
    New-Item $JAVA_OUT -ItemType Directory
}

flutter pub run pigeon `
    --input pigeons.dart `
    --one_language true `
    --java_out android/src/main/java/dev/yanshouwang/camerax/Pigeons.java `
    --java_package dev.yanshouwang.camerax