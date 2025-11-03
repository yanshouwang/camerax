import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'metering_point_factory_impl.dart';

final class SurfaceOrientedMeteringPointFactoryImpl
    extends SurfaceOrientedMeteringPointFactory
    with MeteringPointFactoryImpl {
  @override
  final SurfaceOrientedMeteringPointFactoryApi api;

  SurfaceOrientedMeteringPointFactoryImpl.internal(this.api) : super.impl();

  factory SurfaceOrientedMeteringPointFactoryImpl(double width, double height) {
    final api = SurfaceOrientedMeteringPointFactoryApi(
      width: width,
      height: height,
    );
    return SurfaceOrientedMeteringPointFactoryImpl.internal(api);
  }
}
