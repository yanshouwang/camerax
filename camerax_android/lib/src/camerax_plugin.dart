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
    return JCameraController();
  }

  @override
  PreviewViewController createPreviewViewController() {
    return JPreviewViewController();
  }

  @override
  MLAnalyzer createMLAnalyzer({
    required List<MLObjectType> types,
    required MLAnalyzedCallback onAnalyzed,
  }) {
    return JMLAnalyzer(
      types: types,
      onAnalyzed: onAnalyzed,
    );
  }
}
