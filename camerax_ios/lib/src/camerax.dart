import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'camera_controller.dart';
import 'preview_view_controller.dart';

final class CameraXiOSPlugin extends CameraXPlugin {
  static void registerWith() {
    CameraXPlugin.instance = CameraXiOSPlugin();
  }

  @override
  CameraController createCameraController() {
    return CameraControllerImpl();
  }

  @override
  PreviewViewController createPreviewViewController() {
    return PreviewViewControllerImpl();
  }

  @override
  MLAnalyzer createMLAnalyzer({
    required List<MLObjectType> types,
    required MLObjectsCallback onAnalyzed,
  }) {
    // TODO: implement createMLAnalyzer
    throw UnimplementedError();
  }
}
