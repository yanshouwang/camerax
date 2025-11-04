import 'package:camerax_platform_interface/src/camerax_plugin.dart';

abstract base class QualityApi {
  static QualityApi get sd => CameraXPlugin.instance.$QualityApiSd;
  static QualityApi get hd => CameraXPlugin.instance.$QualityApiHd;
  static QualityApi get fhd => CameraXPlugin.instance.$QualityApiFhd;
  static QualityApi get uhd => CameraXPlugin.instance.$QualityApiUhd;
  static QualityApi get lowest => CameraXPlugin.instance.$QualityApiLowest;
  static QualityApi get highest => CameraXPlugin.instance.$QualityApiHighest;

  QualityApi.impl();
}
