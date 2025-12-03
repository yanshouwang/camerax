import 'package:camerax_platform_interface/src/camerax_plugin.dart';

abstract base class Quality {
  static Quality get sd => CameraXPlugin.instance.$Quality$sd;
  static Quality get hd => CameraXPlugin.instance.$Quality$hd;
  static Quality get fhd => CameraXPlugin.instance.$Quality$fhd;
  static Quality get uhd => CameraXPlugin.instance.$Quality$uhd;
  static Quality get lowest => CameraXPlugin.instance.$Quality$lowest;
  static Quality get highest => CameraXPlugin.instance.$Quality$highest;

  Quality.impl();
}
