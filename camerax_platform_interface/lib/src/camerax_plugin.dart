import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'core.dart';
import 'ml.dart';
import 'video.dart';
import 'view.dart';

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

  CameraSelector createCameraSelector({
    LensFacing? lensFacing,
  });

  CameraController createCameraController();

  PreviewViewBuilder createPreviewViewBuilder();

  ResolutionSelector createResolutionSelector({
    AspectRatioStrategy? aspectRatioStrategy,
    ResolutionMode? allowedResolutionMode,
    ResolutionFilter? resolutionFilter,
    ResolutionStrategy? resolutionStrategy,
  });

  FallbackStrategy createFallbackStrategyHigherQualityOrLowerThan(
      Quality quality);

  FallbackStrategy createFallbackStrategyHigherQualityThan(Quality quality);

  FallbackStrategy createFallbackStrategyLowerQualityOrHigherThan(
      Quality quality);

  FallbackStrategy createFallbackStrategyLowerQualityThan(Quality quality);

  QualitySelector createQualitySelectorFrom(
    Quality quality, {
    FallbackStrategy? fallbackStrategy,
  });

  QualitySelector createQualitySelectorFromOrderedList(
    List<Quality> qualities, {
    FallbackStrategy? fallbackStrategy,
  });

  MLAnalyzer createMLAnalyzer({
    required List<MLObjectType> types,
    required CoordinateSystem targetCoordinateSystem,
    required MLObjectsCallback onAnalyzed,
  });
}
