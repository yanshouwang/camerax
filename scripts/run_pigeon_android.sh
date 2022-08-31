PIGEONS_OUT=android/src/main/java/dev/yanshouwang/camerax_android

if [ ! -d $PIGEONS_OUT ]
then
    mkdir -p $PIGEONS_OUT
fi

flutter pub run pigeon \
    --input pigeons.dart \
    --one_language true \
    --java_out ${PIGEONS_OUT}/Pigeons.java \
    --java_package dev.yanshouwang.camerax_android