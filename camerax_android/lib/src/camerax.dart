import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'camera_controller.dart';
import 'preview_view_controller.dart';

final class CameraXAndroidPlugin extends CameraXPlugin {
  static void registerWith() {
    CameraXPlugin.instance = CameraXAndroidPlugin();
  }

  @override
  CameraController createCameraController() {
    return CameraControllerImpl();
  }

  @override
  PreviewViewController createPreviewViewController() {
    return PreviewViewControllerImpl();
  }
}
