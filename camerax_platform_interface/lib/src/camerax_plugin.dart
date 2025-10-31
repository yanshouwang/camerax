import 'dart:io';
import 'dart:ui' as ui;

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'avfoundation.dart';
import 'camera2.dart';
import 'common.dart';
import 'core.dart';
import 'ml.dart';
import 'video.dart';
import 'view.dart';

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

  // avfoundation
  AVAnalyzer newAVAnalyzer({
    List<AVMetadataObjectType>? types,
    required Consumer<AVAnalyzerResult> consumer,
  });

  // camera2
  Camera2CameraControl newCamera2CameraControlFrom(CameraControl cameraControl);
  Camera2CameraInfo newCamera2CameraInfoFrom(CameraInfo cameraInfo);
  CaptureRequestOptions newCaptureRequestOptions({
    CameraMetadataControlMode? mode,
    CameraMetadataControlAeMode? aeMode,
    CameraMetadataControlAfMode? afMode,
    CameraMetadataControlAwbMode? awbMode,
    int? sensorExposureTime,
  });

  // common
  Consumer<T> newConsumer<T>({required void Function(T value) accept});
  Observer<T> newObserver<T>({required void Function(T value) onChanged});
  PermissionManager newPermissionManager();

  // core
  ResolutionFilter newResolutionFilter({
    required List<Size<int>> Function(
      List<Size<int>> supportedSizes,
      int rotationDegrees,
    )
    filter,
  });
  CameraSelector getFront$CameraSelector();
  CameraSelector getBack$CameraSelector();
  CameraSelector getExternal$CameraSelector();
  CameraSelector newCameraSelector({CameraSelectorLensFacing? lensFacing});
  ImageAnalyzer newImageAnalyzer({
    required void Function(ImageProxy image) analyze,
  });
  FocusMeteringAction newFocusMeteringAction(
    (MeteringPoint, List<MeteringMode>) first, {
    List<(MeteringPoint, List<MeteringMode>)>? others,
    bool? disableAutoCancel,
    Duration? autoCancelDuration,
  });
  ImageCaptureOnImageCapturedCallback newImageCaptureOnImageCapturedCallback({
    void Function()? onCaptureStarted,
    void Function(int progress)? onCaptureProcessProgressed,
    void Function(ui.Image bitmap)? onPostviewBitmapAvailable,
    void Function(ImageProxy image)? onCaptureSuccess,
    void Function(Object exception)? onError,
  });
  SurfaceOrientedMeteringPointFactory newSurfaceOrientedMeteringPointFactory(
    double width,
    double height,
  );

  // ml
  ZoomSuggestionOptionsZoomCallback newZoomSuggestionOptionsZoomCallback({
    required bool Function(double zoomRatio) setZoom,
  });
  ZoomSuggestionOptions newZoomSuggestionOptions({
    required ZoomSuggestionOptionsZoomCallback zoomCallback,
    double? maxSupportedZoomRatio,
  });
  BarcodeScannerOptions newBarcodeScannerOptions({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptions? zoomSuggestionOptions,
  });
  BarcodeScanner newBarcodeScanner({BarcodeScannerOptions? options});
  FaceDetectorOptions newFaceDetectorOptions({
    bool? enableTracking,
    FaceClassificationMode? classificationMode,
    FaceContourMode? contourMode,
    FaceLandmarkMode? landmarkMode,
    double? minFaceSize,
    FacePerformanceMode? performanceMode,
  });
  FaceDetector newFaceDetector({FaceDetectorOptions? options});
  MlKitAnalyzer newMlKitAnalyzer({
    required List<Detector> detectors,
    required ImageAnalysisCoordinateSystem targetCoordinateSystem,
    required Consumer<MlKitAnalyzerResult> consumer,
  });

  // video
  FallbackStrategy newFallbackStrategyHigherQualityOrLowerThan(Quality quality);
  FallbackStrategy newFallbackStrategyHigherQualityThan(Quality quality);
  FallbackStrategy newFallbackStrategyLowerQualityOrHigherThan(Quality quality);
  FallbackStrategy newFallbackStrategyLowerQualityThan(Quality quality);
  FileOutputOptions newFileOutputOptions({
    required File file,
    Duration? durationLimit,
    int? fileSizeLimitBytes,
    Location? location,
  });
  Future<Size<int>?> getResolution$QualitySelector(
    CameraInfo cameraInfo,
    Quality quality,
  );
  QualitySelector newQualitySelectorFrom(
    Quality quality, {
    FallbackStrategy? fallbackStrategy,
  });
  QualitySelector newQualitySelectorFromOrderedList(
    List<Quality> qualities, {
    FallbackStrategy? fallbackStrategy,
  });

  // view
  CameraController newCameraController();
  PreviewView newPreviewView();
  RotationProviderListener newRotationProviderListener({
    required void Function(int rotation) onRotationChanged,
  });
  RotationProvider newRotationProvider();
}
