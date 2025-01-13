import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension PlaneProxyObj on $native.PlaneProxy {
  $base.PlaneProxy get args {
    return $base.PlaneProxy(
      buffer: buffer,
      pixelStride: pixelStride,
      rowStride: rowStride,
    );
  }
}
