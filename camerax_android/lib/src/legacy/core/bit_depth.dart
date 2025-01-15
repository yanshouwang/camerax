import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension BitDepthArgs on $interface.BitDepth {
  $native.BitDepth get obj {
    switch (this) {
      case $interface.BitDepth.bitDepthUnspecified:
        return $native.BitDepth.bitDepthUnspecified;
      case $interface.BitDepth.bitDepth8Bit:
        return $native.BitDepth.bitDepth8Bit;
      case $interface.BitDepth.bitDepth10Bit:
        return $native.BitDepth.bitDepth10Bit;
    }
  }
}

extension BitDepthObj on $native.BitDepth {
  $interface.BitDepth get args {
    switch (this) {
      case $native.BitDepth.bitDepthUnspecified:
        return $interface.BitDepth.bitDepthUnspecified;
      case $native.BitDepth.bitDepth8Bit:
        return $interface.BitDepth.bitDepth8Bit;
      case $native.BitDepth.bitDepth10Bit:
        return $interface.BitDepth.bitDepth10Bit;
    }
  }
}
