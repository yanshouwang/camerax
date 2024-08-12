import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'camera_controller.dart';
import 'ml_analyzer.dart';
import 'preview_view_controller.dart';

final class CameraXAndroidPlugin extends CameraXPlugin {
  static void registerWith() {
    CameraXPlugin.instance = CameraXAndroidPlugin();
  }

  @override
  CameraController createCameraController() {
    return MyCameraController();
  }

  @override
  PreviewViewController createPreviewViewController() {
    return MyPreviewViewController();
  }

  @override
  MLAnalyzer createMLAnalyzer({
    required List<MLObjectType> types,
    required MLObjectsCallback onAnalyzed,
  }) {
    return MyMLAnalyzer(
      types: types,
      onAnalyzed: onAnalyzed,
    );
  }
}
