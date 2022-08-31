$DART_OUT = "camerax/lib/src/models"
$JAVA_OUT = "camerax_android/android/src/main/java"
$KOTLIN_OUT = "camerax_android/android/src/main/kotlin"

$PACKAGE = "dev/yanshouwang/camerax/models/proto"

if (Test-Path $DART_OUT) {
    if (Test-Path "${DART_OUT}/proto") {
        Get-Item "${DART_OUT}/proto" | Remove-Item -Recurse
    }
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
    proto/messages.proto