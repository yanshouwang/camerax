PIGEONS_OUT=lib/src
TEST_OUT=test

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
    --dart_out ${PIGEONS_OUT}/pigeons.g.dart \
    --dart_test_out ${TEST_OUT}/test_pigeons.g.dart