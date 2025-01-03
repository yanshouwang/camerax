import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

import 'legacy.dart';

abstract final class CameraXAndroidPlugin {
  static void registerWith() {
    $interface.CameraX.instance = CameraX();
  }
}
