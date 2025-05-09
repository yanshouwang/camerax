import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'metering_point_factory.dart';

final _token = Object();

abstract interface class SurfaceOrientedMeteringPointFactory
    implements MeteringPointFactory {
  factory SurfaceOrientedMeteringPointFactory(double width, double height) {
    final instance = CameraXPlugin.instance
        .newSurfaceOrientedMeteringPointFactory(width, height);
    PlatformInterface.verify(instance as PlatformInterface, _token);
    return instance;
  }
}

abstract base class SurfaceOrientedMeteringPointFactoryChannel
    extends PlatformInterface implements SurfaceOrientedMeteringPointFactory {
  SurfaceOrientedMeteringPointFactoryChannel.impl() : super(token: _token);
}
