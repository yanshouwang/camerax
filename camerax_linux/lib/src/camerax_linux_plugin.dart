import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

import 'camerax.dart';

final class CameraXLinuxPlugin {
  static void registerWith() {
    $interface.CameraX.instance = CameraX();
  }
}
