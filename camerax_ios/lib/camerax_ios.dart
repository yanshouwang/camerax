import 'package:camerax_core/camerax_core.dart' as core;

import 'src/camera_view_builder.dart';

class CameraXIOS {
  /// Registers this class as the default instance of [core.CameraViewBuilder].
  static void registerWith() {
    core.CameraViewBuilder.instance = CameraViewBuilder();
  }
}
