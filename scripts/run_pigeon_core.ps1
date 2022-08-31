$PIGEONS_OUT = "lib/src"
$TEST_OUT = "test"

if (-NOT (Test-Path $PIGEONS_OUT)) {
    New-Item $PIGEONS_OUT -ItemType Directory
}
if (-NOT (Test-Path $TEST_OUT)) {
    New-Item $TEST_OUT -ItemType Directory
}

flutter pub run pigeon `
    --input pigeons.dart `
    --dart_out "${PIGEONS_OUT}/pigeons.g.dart" `
    --dart_test_out "${TEST_OUT}/test_pigeons.g.dart"