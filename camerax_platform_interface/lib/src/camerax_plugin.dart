import 'dart:io';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'camera2.dart';
import 'common.dart';
import 'core.dart';
import 'ml.dart';
import 'video.dart';
import 'view.dart';
import 'vision.dart';

/// Platform-specific implementations should implement this class to support
/// camerax.
abstract base class CameraXPlugin extends PlatformInterface {
  /// Constructs a [CameraXPlugin].
  CameraXPlugin() : super(token: _token);

  static final _token = Object();

  static CameraXPlugin? _instance;

  /// The default instance of [CameraXPlugin] to use.
  static CameraXPlugin get instance {
    final instance = _instance;
    if (instance == null) {
      throw UnimplementedError();
    }
    return instance;
  }

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CameraXPlugin] when
  /// they register themselves.
  static set instance(CameraXPlugin instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  PermissionManager newPermissionManager();

  CameraSelector getFrontCameraSelector();
  CameraSelector getBackCameraSelector();
  CameraSelector getExternalCameraSelector();
  CameraSelector newCameraSelector({
    LensFacing? lensFacing,
  });

  FileOutputOptions newFileOutputOptions({
    required File file,
    Duration? durationLimit,
    int? fileSizeLimitBytes,
    Location? location,
  });

  CameraController newCameraController();

  FallbackStrategy newFallbackStrategyHigherQualityOrLowerThan(Quality quality);

  FallbackStrategy newFallbackStrategyHigherQualityThan(Quality quality);

  FallbackStrategy newFallbackStrategyLowerQualityOrHigherThan(Quality quality);

  FallbackStrategy newFallbackStrategyLowerQualityThan(Quality quality);

  Future<Size?> getResolution(CameraInfo cameraInfo, Quality quality);

  QualitySelector newQualitySelectorFrom(
    Quality quality, {
    FallbackStrategy? fallbackStrategy,
  });

  QualitySelector newQualitySelectorFromOrderedList(
    List<Quality> qualities, {
    FallbackStrategy? fallbackStrategy,
  });

  SurfaceOrientedMeteringPointFactory newSurfaceOrientedMeteringPointFactory(
    double width,
    double height,
  );

  FocusMeteringAction newFocusMeteringAction(
    (MeteringPoint, List<MeteringMode>) first, {
    List<(MeteringPoint, List<MeteringMode>)>? others,
    bool? disableAutoCancel,
    Duration? autoCancelDuration,
  });

  ImageAnalyzer newImageAnalyzer({
    required ImageProxyCallback analyze,
  });

  ZoomSuggestionOptions newZoomSuggestionOptions({
    required ZoomCallback zoomCallback,
    double? maxSupportedZoomRatio,
  });

  BarcodeScannerOptions newBarcodeScannerOptions({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptions? zoomSuggestionOptions,
  });

  BarcodeScanner newBarcodeScanner({
    BarcodeScannerOptions? options,
  });

  FaceDetectorOptions newFaceDetectorOptions({
    bool? enableTracking,
    FaceClassificationMode? classificationMode,
    FaceContourMode? contourMode,
    FaceLandmarkMode? landmarkMode,
    double? minFaceSize,
    FacePerformanceMode? performanceMode,
  });

  FaceDetector newFaceDetector({
    FaceDetectorOptions? options,
  });

  MlKitAnalyzer newMlKitAnalyzer({
    required List<Detector> detectors,
    required CoordinateSystem targetCoordinateSystem,
    required Consumer<MlKitAnalyzerResult> consumer,
  });

  VNBarcodeScanner newVNBarcodeScanner({
    List<VNBarcodeSymbology>? symbologies,
  });

  VNAnalyzer newVNAnalyzer({
    required List<VNDetector> detectors,
    required Consumer<VNAnalyzerResult> consumer,
  });

  PreviewView newPreviewView();

  Camera2CameraControl newCamera2CameraControlFrom(CameraControl cameraControl);
  Camera2CameraInfo newCamera2CameraInfoFrom(CameraInfo cameraInfo);
  CaptureRequestOptions newCaptureRequestOptions({
    ControlMode? mode,
    ControlAeMode? aeMode,
    ControlAfMode? afMode,
    ControlAwbMode? awbMode,
    int? sensorExposureTime,
  });
}
