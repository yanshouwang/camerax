$CORE = "camerax_core"
$ANDROID = "camerax_android"

$PIGEONS = "pigeons.dart"

# Android
New-Item "${ANDROID}/$PIGEONS" -ItemType HardLink -Value "${CORE}/$PIGEONS"