import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'metering_point_factory.dart';

abstract base class SurfaceOrientedMeteringPointFactory
    extends MeteringPointFactory {
  SurfaceOrientedMeteringPointFactory.impl() : super.impl();

  factory SurfaceOrientedMeteringPointFactory(double width, double height) =>
      CameraXPlugin.instance
          .newSurfaceOrientedMeteringPointFactory(width, height);
}
