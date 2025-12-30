import 'package:camerax_platform_interface/src/core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class MeteringPointFactory {
  static Future<double> getDefaultPointSize() =>
      MeteringPointFactoryChannel.instance.getDefaultPointSize();

  Future<MeteringPoint> createPoint(double x, double y, {double? size});
}

abstract base class MeteringPointFactoryChannel extends PlatformInterface {
  MeteringPointFactoryChannel() : super(token: _token);

  static final _token = Object();

  static MeteringPointFactoryChannel? _instance;

  static MeteringPointFactoryChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(MeteringPointFactoryChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  Future<double> getDefaultPointSize();
}
