import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension PlaneProxyObj on $native.PlaneProxy {
  $interface.PlaneProxy get args {
    return $interface.PlaneProxy(
      buffer: buffer,
      pixelStride: pixelStride,
      rowStride: rowStride,
    );
  }
}
