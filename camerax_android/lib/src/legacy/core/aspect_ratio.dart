import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension AspectRatioArgs on $interface.AspectRatio {
  $native.AspectRatio get obj {
    switch (this) {
      case $interface.AspectRatio.ratioDefault:
        return $native.AspectRatio.ratioDefault;
      case $interface.AspectRatio.ratio4_3:
        return $native.AspectRatio.ratio4_3;
      case $interface.AspectRatio.ratio16_9:
        return $native.AspectRatio.ratio16_9;
    }
  }
}

extension AspectRatioObj on $native.AspectRatio {
  $interface.AspectRatio get args {
    switch (this) {
      case $native.AspectRatio.ratioDefault:
        return $interface.AspectRatio.ratioDefault;
      case $native.AspectRatio.ratio4_3:
        return $interface.AspectRatio.ratio4_3;
      case $native.AspectRatio.ratio16_9:
        return $interface.AspectRatio.ratio16_9;
    }
  }
}
