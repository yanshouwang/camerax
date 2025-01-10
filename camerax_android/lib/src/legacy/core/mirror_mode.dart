import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension MirrorModeArgs on $base.MirrorMode {
  $native.MirrorMode get obj {
    switch (this) {
      case $base.MirrorMode.off:
        return $native.MirrorMode.off;
      case $base.MirrorMode.on:
        return $native.MirrorMode.on;
      case $base.MirrorMode.onFrontOnly:
        return $native.MirrorMode.onFrontOnly;
    }
  }
}

extension MirrorModeObj on $native.MirrorMode {
  $base.MirrorMode get args {
    switch (this) {
      case $native.MirrorMode.off:
        return $base.MirrorMode.off;
      case $native.MirrorMode.on:
        return $base.MirrorMode.on;
      case $native.MirrorMode.onFrontOnly:
        return $base.MirrorMode.onFrontOnly;
    }
  }
}
