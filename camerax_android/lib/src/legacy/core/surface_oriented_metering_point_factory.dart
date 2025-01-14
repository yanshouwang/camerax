import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'metering_point.dart';

final class SurfaceOrientedMeteringPointFactory
    extends $base.SurfaceOrientedMeteringPointFactory {
  final $native.SurfaceOrientedMeteringPointFactory obj;

  SurfaceOrientedMeteringPointFactory.$native(this.obj) : super.impl();

  factory SurfaceOrientedMeteringPointFactory({
    required double width,
    required double height,
  }) {
    final obj = $native.SurfaceOrientedMeteringPointFactory.build(
      width: width,
      height: height,
    );
    return SurfaceOrientedMeteringPointFactory.$native(obj);
  }

  @override
  Future<$base.MeteringPoint> createPoint(
    double x,
    double y, {
    double? size,
  }) async {
    final obj = await this.obj.createPoint(x, y, size);
    return obj.args;
  }
}
