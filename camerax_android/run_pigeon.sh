JAVA_OUT=android/src/main/java/dev/yanshouwang/camerax

if [ ! -d $JAVA_OUT ]
then
    mkdir $JAVA_OUT
fi

flutter pub run pigeon \
    --input pigeons.dart \
    --one_language true \
    --java_out $JAVA_OUT/Pigeons.java \
    --java_package dev.yanshouwang.camerax