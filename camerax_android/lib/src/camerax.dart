import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'jni_camera_controller.dart';
import 'jni_preview_view_controller.dart';

final class CameraXAndroidPlugin extends CameraXPlugin {
  static void registerWith() {
    CameraXPlugin.instance = CameraXAndroidPlugin();
  }

  @override
  CameraController createCameraController() {
    return JNICameraController();
  }

  @override
  PreviewViewController createPreviewViewController() {
    return JNIPreviewViewController();
  }
}
