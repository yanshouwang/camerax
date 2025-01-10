import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension FlashModeArgs on $base.FlashMode {
  $native.FlashMode get obj {
    switch (this) {
      case $base.FlashMode.auto:
        return $native.FlashMode.auto;
      case $base.FlashMode.on:
        return $native.FlashMode.on;
      case $base.FlashMode.off:
        return $native.FlashMode.off;
      case $base.FlashMode.screen:
        return $native.FlashMode.screen;
    }
  }
}

extension FlashModeObj on $native.FlashMode {
  $base.FlashMode get args {
    switch (this) {
      case $native.FlashMode.auto:
        return $base.FlashMode.auto;
      case $native.FlashMode.on:
        return $base.FlashMode.on;
      case $native.FlashMode.off:
        return $base.FlashMode.off;
      case $native.FlashMode.screen:
        return $base.FlashMode.screen;
    }
  }
}
