import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension FlashModeArgs on $interface.FlashMode {
  $native.FlashMode get obj {
    switch (this) {
      case $interface.FlashMode.auto:
        return $native.FlashMode.auto;
      case $interface.FlashMode.on:
        return $native.FlashMode.on;
      case $interface.FlashMode.off:
        return $native.FlashMode.off;
      case $interface.FlashMode.screen:
        return $native.FlashMode.screen;
    }
  }
}

extension FlashModeObj on $native.FlashMode {
  $interface.FlashMode get args {
    switch (this) {
      case $native.FlashMode.auto:
        return $interface.FlashMode.auto;
      case $native.FlashMode.on:
        return $interface.FlashMode.on;
      case $native.FlashMode.off:
        return $interface.FlashMode.off;
      case $native.FlashMode.screen:
        return $interface.FlashMode.screen;
    }
  }
}
