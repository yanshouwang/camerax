import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension ImageInfoObj on $native.ImageInfo {
  $interface.ImageInfo get args {
    return $interface.ImageInfo(
      timestamp: timestamp,
      rotationDegrees: rotationDegrees,
    );
  }
}
