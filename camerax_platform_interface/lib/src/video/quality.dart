import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class Quality {
  static Quality get sd => QualityChannel.instance.sd;
  static Quality get hd => QualityChannel.instance.hd;
  static Quality get fhd => QualityChannel.instance.fhd;
  static Quality get uhd => QualityChannel.instance.uhd;
  static Quality get lowest => QualityChannel.instance.lowest;
  static Quality get highest => QualityChannel.instance.highest;
}

abstract base class QualityChannel extends PlatformInterface {
  QualityChannel() : super(token: _token);

  static final _token = Object();

  static QualityChannel? _instance;

  static QualityChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(QualityChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  Quality get sd;
  Quality get hd;
  Quality get fhd;
  Quality get uhd;
  Quality get lowest;
  Quality get highest;
}
