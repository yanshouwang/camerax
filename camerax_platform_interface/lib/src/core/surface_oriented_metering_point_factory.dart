import 'package:camerax_platform_interface/src/core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class SurfaceOrientedMeteringPointFactory
    implements MeteringPointFactory {
  factory SurfaceOrientedMeteringPointFactory(double width, double height) =>
      SurfaceOrientedMeteringPointFactoryChannel.instance.create(width, height);
}

abstract base class SurfaceOrientedMeteringPointFactoryChannel
    extends PlatformInterface {
  SurfaceOrientedMeteringPointFactoryChannel() : super(token: _token);

  static final _token = Object();

  static SurfaceOrientedMeteringPointFactoryChannel? _instance;

  static SurfaceOrientedMeteringPointFactoryChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(SurfaceOrientedMeteringPointFactoryChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  SurfaceOrientedMeteringPointFactory create(double width, double height);
}
