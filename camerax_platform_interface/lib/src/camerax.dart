import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'common.dart';
import 'core.dart';
import 'ml.dart';
import 'video.dart';
import 'view.dart';

/// Platform-specific implementations should implement this class to support
/// camerax.
abstract base class CameraX extends PlatformInterface {
  /// Constructs a [CameraX].
  CameraX() : super(token: _token);

  static final Object _token = Object();

  static CameraX? _instance;

  /// The default instance of [CameraX] to use.
  static CameraX get instance {
    final instance = _instance;
    if (instance == null) {
      throw UnimplementedError(
          'CameraController is not implemented on this platform.');
    }
    return instance;
  }

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CameraX] when
  /// they register themselves.
  static set instance(CameraX instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  PermissionManager createPermissionManager();

  CameraSelector getFrontCameraSelector();
  CameraSelector getBackCameraSelector();
  CameraSelector getExternalCameraSelector();

  CameraSelector createCameraSelector({
    LensFacing? lensFacing,
  });

  CameraController createCameraController();

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

  Future<Size?> getResolution(CameraInfo cameraInfo, Quality quality);

  PreviewView createPreviewView();

  ZoomSuggestionOptions createZoomSuggestionOptions({
    required ZoomCallback zoomCallback,
    double? maxSupportedZoomRatio,
  });

  BarcodeScannerOptions createBarcodeScannerOptions({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptions? zoomSuggestionOptions,
  });

  BarcodeScanner createBarcodeScanner({
    BarcodeScannerOptions? options,
  });

  FaceDetectorOptions createFaceDetectorOptions({
    bool? enableTracking,
    FaceClassificationMode? classificationMode,
    FaceContourMode? contourMode,
    FaceLandmarkMode? landmarkMode,
    double? minFaceSize,
    FacePerformanceMode? performanceMode,
  });

  FaceDetector createFaceDetector({
    FaceDetectorOptions? options,
  });

  MlKitAnalyzer createMlKitAnalyzer({
    required List<Detector> detectors,
    required CoordinateSystem targetCoordinateSystem,
    required MlKitAnalyzerResultConsumer consumer,
  });
}
