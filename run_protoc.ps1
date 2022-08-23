$DART_OUT = "camerax_core/lib/src/messages"
$JAVA_OUT = "camerax_android/android/src/main/java"
$KOTLIN_OUT = "camerax_android/android/src/main/kotlin"

$PACKAGE = "dev/yanshouwang/camerax/messages"

if (Test-Path $DART_OUT) {
    Get-ChildItem $DART_OUT | Remove-Item -Recurse
}
else {
    New-Item $DART_OUT -ItemType Directory
}
if (Test-Path $JAVA_OUT) {
    if (Test-Path "${JAVA_OUT}/$PACKAGE") {
        Get-Item "${JAVA_OUT}/$PACKAGE" | Remove-Item -Recurse
    }
}
else {
    New-Item $JAVA_OUT -ItemType Directory
}
if (Test-Path $KOTLIN_OUT) {
    if (Test-Path "${KOTLIN_OUT}/$PACKAGE") {
        Get-Item "${KOTLIN_OUT}/$PACKAGE" | Remove-Item -Recurse
    }
}
else {
    New-Item $KOTLIN_OUT -ItemType Directory
}

protoc `
    --dart_out $DART_OUT `
    --java_out $JAVA_OUT `
    --kotlin_out $KOTLIN_OUT `
    messages.proto