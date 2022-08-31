PIGEONS_OUT=ios/Classes

if [ ! -d $PIGEONS_OUT ]
then
    mkdir $PIGEONS_OUT
fi

flutter pub run pigeon \
    --input pigeons.dart \
    --one_language true \
    --experimental_swift_out ${PIGEONS_OUT}/Pigeons.swift