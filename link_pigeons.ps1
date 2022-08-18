$CORE = "camerax_core"
$ANDROID = "camerax_android"
# $IOS = "camerax_ios"

$PIGEONS = "pigeons.dart"

# Android
New-Item $ANDROID/$PIGEONS -ItemType HardLink -Value $CORE/$PIGEONS

# iOS
# New-Item $IOS/$PIGEONS -ItemType HardLink -Value $CORE/$PIGEONS