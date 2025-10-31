import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'metering_point_impl.dart';

final class SurfaceOrientedMeteringPointFactoryImpl
    extends SurfaceOrientedMeteringPointFactory {
  final SurfaceOrientedMeteringPointFactoryApi api;

  SurfaceOrientedMeteringPointFactoryImpl.internal(this.api) : super.impl();

  factory SurfaceOrientedMeteringPointFactoryImpl(double width, double height) {
    final api = SurfaceOrientedMeteringPointFactoryApi(
      width: width,
      height: height,
    );
    return SurfaceOrientedMeteringPointFactoryImpl.internal(api);
  }

  @override
  Future<MeteringPoint> createPoint(double x, double y, {double? size}) =>
      api.createPoint(x, y, size).then((e) => e.impl);
}
