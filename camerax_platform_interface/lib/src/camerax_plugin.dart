import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'camera_controller.dart';
import 'ml.dart';
import 'preview_view_controller.dart';

/// Platform-specific implementations should implement this class to support
/// camerax.
abstract base class CameraXPlugin extends PlatformInterface {
  /// Constructs a [CameraXPlugin].
  CameraXPlugin() : super(token: _token);

  static final Object _token = Object();

  static CameraXPlugin? _instance;

  /// The default instance of [CameraXPlugin] to use.
  static CameraXPlugin get instance {
    final instance = _instance;
    if (instance == null) {
      throw UnimplementedError(
          'CameraController is not implemented on this platform.');
    }
    return instance;
  }

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CameraXPlugin] when
  /// they register themselves.
  static set instance(CameraXPlugin instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  CameraController createCameraController();

  PreviewViewController createPreviewViewController();

  MLAnalyzer createMLAnalyzer({
    required List<MLObjectType> types,
    required MLObjectsCallback onAnalyzed,
  });
}
