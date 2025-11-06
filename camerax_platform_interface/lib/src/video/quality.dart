import 'package:camerax_platform_interface/src/camerax_plugin.dart';

abstract base class Quality {
  static Quality get sd => CameraXPlugin.instance.$Quality$Sd;
  static Quality get hd => CameraXPlugin.instance.$Quality$Hd;
  static Quality get fhd => CameraXPlugin.instance.$Quality$Fhd;
  static Quality get uhd => CameraXPlugin.instance.$Quality$Uhd;
  static Quality get lowest => CameraXPlugin.instance.$Quality$Lowest;
  static Quality get highest => CameraXPlugin.instance.$Quality$Highest;

  Quality.impl();
}
