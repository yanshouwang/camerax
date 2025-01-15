import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

import 'metering_point.dart';

final class SurfaceOrientedMeteringPointFactory
    extends $interface.SurfaceOrientedMeteringPointFactory {
  final $native.SurfaceOrientedMeteringPointFactory obj;

  SurfaceOrientedMeteringPointFactory.$native(this.obj) : super.impl();

  factory SurfaceOrientedMeteringPointFactory(double width, double height) {
    final obj = $native.SurfaceOrientedMeteringPointFactory(
      width: width,
      height: height,
    );
    return SurfaceOrientedMeteringPointFactory.$native(obj);
  }

  @override
  Future<$interface.MeteringPoint> createPoint(
    double x,
    double y, {
    double? size,
  }) async {
    final obj = await this.obj.createPoint(x, y, size);
    return obj.args;
  }
}
