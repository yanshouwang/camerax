import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension PlaneProxyApiX on PlaneProxyApi {
  PlaneProxy get impl => PlaneProxy(
      value: value,
      pixelStride: pixelStride,
      rowStride: rowStride,
    );
}
