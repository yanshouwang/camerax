import 'package:camerax_platform_interface/src/camerax.dart';

import 'metering_point_factory.dart';

abstract base class SurfaceOrientedMeteringPointFactory
    extends MeteringPointFactory {
  SurfaceOrientedMeteringPointFactory.impl() : super.impl();

  factory SurfaceOrientedMeteringPointFactory(double width, double height) =>
      CameraX.instance.createSurfaceOrientedMeteringPointFactory(width, height);
}
