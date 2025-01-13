import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension ImageInfoObj on $native.ImageInfo {
  $base.ImageInfo get args {
    return $base.ImageInfo(
      timestamp: timestamp,
      rotationDegrees: rotationDegrees,
    );
  }
}
