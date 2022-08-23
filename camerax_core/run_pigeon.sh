PIGEONS_OUT=lib/src/pigeons
TEST_OUT=test/pigeons

if [ ! -d $PIGEONS_OUT ]
then
    mkdir $PIGEONS_OUT
fi

if [ ! -d $TEST_OUT ]
then
    mkdir $TEST_OUT
fi

flutter pub run pigeon \
    --input pigeons.dart \
    --dart_out ${PIGEONS_OUT}/pigeons.dart \
    --dart_test_out ${TEST_OUT}/test_pigeons.dart