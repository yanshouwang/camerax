import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension AspectRatioArgs on $base.AspectRatio {
  $native.AspectRatio get obj {
    switch (this) {
      case $base.AspectRatio.ratioDefault:
        return $native.AspectRatio.ratioDefault;
      case $base.AspectRatio.ratio4_3:
        return $native.AspectRatio.ratio4_3;
      case $base.AspectRatio.ratio16_9:
        return $native.AspectRatio.ratio16_9;
    }
  }
}

extension AspectRatioObj on $native.AspectRatio {
  $base.AspectRatio get args {
    switch (this) {
      case $native.AspectRatio.ratioDefault:
        return $base.AspectRatio.ratioDefault;
      case $native.AspectRatio.ratio4_3:
        return $base.AspectRatio.ratio4_3;
      case $native.AspectRatio.ratio16_9:
        return $base.AspectRatio.ratio16_9;
    }
  }
}
