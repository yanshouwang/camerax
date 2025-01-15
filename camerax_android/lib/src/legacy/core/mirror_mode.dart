import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension MirrorModeArgs on $interface.MirrorMode {
  $native.MirrorMode get obj {
    switch (this) {
      case $interface.MirrorMode.off:
        return $native.MirrorMode.off;
      case $interface.MirrorMode.on:
        return $native.MirrorMode.on;
      case $interface.MirrorMode.onFrontOnly:
        return $native.MirrorMode.onFrontOnly;
    }
  }
}

extension MirrorModeObj on $native.MirrorMode {
  $interface.MirrorMode get args {
    switch (this) {
      case $native.MirrorMode.off:
        return $interface.MirrorMode.off;
      case $native.MirrorMode.on:
        return $interface.MirrorMode.on;
      case $native.MirrorMode.onFrontOnly:
        return $interface.MirrorMode.onFrontOnly;
    }
  }
}
