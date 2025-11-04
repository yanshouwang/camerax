import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'metering_point_factory_api.dart';

abstract base class SurfaceOrientedMeteringPointFactoryApi
    extends MeteringPointFactoryApi {
  SurfaceOrientedMeteringPointFactoryApi.impl() : super.impl();

  factory SurfaceOrientedMeteringPointFactoryApi(double width, double height) =>
      CameraXPlugin.instance.$SurfaceOrientedMeteringPointFactoryApi(
        width,
        height,
      );
}
