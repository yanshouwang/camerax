import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension BitDepthArgs on $base.BitDepth {
  $native.BitDepth get obj {
    switch (this) {
      case $base.BitDepth.bitDepthUnspecified:
        return $native.BitDepth.bitDepthUnspecified;
      case $base.BitDepth.bitDepth8Bit:
        return $native.BitDepth.bitDepth8Bit;
      case $base.BitDepth.bitDepth10Bit:
        return $native.BitDepth.bitDepth10Bit;
    }
  }
}

extension BitDepthObj on $native.BitDepth {
  $base.BitDepth get args {
    switch (this) {
      case $native.BitDepth.bitDepthUnspecified:
        return $base.BitDepth.bitDepthUnspecified;
      case $native.BitDepth.bitDepth8Bit:
        return $base.BitDepth.bitDepth8Bit;
      case $native.BitDepth.bitDepth10Bit:
        return $base.BitDepth.bitDepth10Bit;
    }
  }
}
