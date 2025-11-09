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
  AVAnalyzer $AVAnalyzer({
    List<AVMetadataObjectType>? types,
    required Consumer<AVAnalyzerResult> consumer,
  });

  // camera2
  Camera2CameraControl $Camera2CameraControl$From(CameraControl cameraControl);
  Camera2CameraInfo $Camera2CameraInfo$From(CameraInfo cameraInfo);
  CaptureRequestOptions $CaptureRequestOptions({
    CameraMetadataControlMode? mode,
    CameraMetadataControlAeMode? aeMode,
    CameraMetadataControlAfMode? afMode,
    CameraMetadataControlAwbMode? awbMode,
    int? sensorExposureTime,
  });

  // common
  Consumer<T> $Consumer<T>({required void Function(T value) accept});
  Location $Location();
  Observer<T> $Observer<T>({required void Function(T value) onChanged});
  PermissionManager $PermissionManager();

  // core
  AspectRatioStrategy get $AspectRatioStrategy$Ratio4_3FallbackAutoStrategy;
  AspectRatioStrategy get $AspectRatioStrategy$Ratio16_9FallbackAutoStrategy;
  ResolutionStrategy get $ResolutionStrategy$HighestAvailableStrategy;
  CameraSelector get $CameraSelector$Back;
  CameraSelector get $CameraSelector$Front;
  CameraSelector get $CameraSelector$External;
  DynamicRange get $DynamicRange$Unspecifid;
  DynamicRange get $DynamicRange$Sdr;
  DynamicRange get $DynamicRange$HdrUnspecified10Bit;
  DynamicRange get $DynamicRange$Hdr10_10Bit;
  DynamicRange get $DynamicRange$Hdr10Plus10Bit;
  DynamicRange get $DynamicRange$Hlg10Bit;
  DynamicRange get $DynamicRange$DolbyVision8Bit;
  DynamicRange get $DynamicRange$DolbyVision10Bit;

  AspectRatioStrategy $AspectRatioStrategy({
    required AspectRatio preferredAspectRatio,
    required AspectRatioStrategyFallbackRule fallbackRule,
  });
  ResolutionFilter $ResolutionFilter({
    required List<Size<int>> Function(
      List<Size<int>> supportedSizes,
      int rotationDegrees,
    )
    filter,
  });
  ResolutionStrategy $ResolutionStrategy({
    required Size<int> boundSize,
    required ResolutionStrategyFallbackRule fallbackRule,
  });
  ResolutionSelector $ResolutionSelector({
    ResolutionSelectorMode? mode,
    AspectRatioStrategy? aspectRatioStrategy,
    ResolutionFilter? resolutionFilter,
    ResolutionStrategy? resolutionStrategy,
  });
  Future<bool> $CameraInfo$MustPlayShutterSound();
  CameraSelector $CameraSelector({CameraSelectorLensFacing? lensFacing});
  DynamicRange $DynamicRange({
    required DynamicRangeEncoding encoding,
    required DynamicRangeBitDepth bitDepth,
  });
  ImageAnalysisAnalyzer $ImageAnalysisAnalyzer({
    required Consumer<ImageProxy> consumer,
  });
  FocusMeteringAction $FocusMeteringAction(
    (MeteringPoint, List<FocusMeteringActionMeteringMode>) point, {
    List<(MeteringPoint, List<FocusMeteringActionMeteringMode>)>? morePoints,
    bool? disableAutoCancel,
    Duration? autoCancelDuration,
  });
  ImageCaptureOnImageCapturedCallback $ImageCaptureOnImageCapturedCallback({
    void Function()? onCaptureStarted,
    void Function(int progress)? onCaptureProcessProgressed,
    void Function(ui.Image bitmap)? onPostviewBitmapAvailable,
    void Function(ImageProxy image)? onCaptureSuccess,
    void Function(Object exception)? onError,
  });
  Future<double> $MeteringPointFactory$GetDefaultPointSize();
  SurfaceOrientedMeteringPointFactory $SurfaceOrientedMeteringPointFactory(
    double width,
    double height,
  );

  // ml
  MlKitAnalyzer $MlKitAnalyzer({
    required List<Detector> detectors,
    required ImageAnalysisCoordinateSystem targetCoordinateSystem,
    required Consumer<MlKitAnalyzerResult> consumer,
  });
  ZoomSuggestionOptionsZoomCallback $ZoomSuggestionOptions$ZoomCallback({
    required bool Function(double zoomRatio) setZoom,
  });
  ZoomSuggestionOptions $ZoomSuggestionOptions(
    ZoomSuggestionOptionsZoomCallback zoomCallback, {
    double? maxSupportedZoomRatio,
  });
  BarcodeScannerOptions $BarcodeScannerOptions({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptions? zoomSuggestionOptions,
  });
  BarcodeScanner $BarcodeScanner();
  BarcodeScanner $BarcodeScanner$Options(BarcodeScannerOptions options);
  FaceDetectorOptions $FaceDetectorOptions({
    bool? enableTracking,
    FaceDetectorOptionsClassificationMode? classificationMode,
    FaceDetectorOptionsContourMode? contourMode,
    FaceDetectorOptionsLandmarkMode? landmarkMode,
    double? minFaceSize,
    FaceDetectorOptionsPerformanceMode? performanceMode,
  });
  FaceDetector $FaceDetector();
  FaceDetector $FaceDetector$Options(FaceDetectorOptions options);

  // video
  Quality get $Quality$Sd;
  Quality get $Quality$Hd;
  Quality get $Quality$Fhd;
  Quality get $Quality$Uhd;
  Quality get $Quality$Lowest;
  Quality get $Quality$Highest;

  FallbackStrategy $FallbackStrategy$HigherQualityOrLowerThan(Quality quality);
  FallbackStrategy $FallbackStrategy$HigherQualityThan(Quality quality);
  FallbackStrategy $FallbackStrategy$LowerQualityOrHigherThan(Quality quality);
  FallbackStrategy $FallbackStrategy$LowerQualityThan(Quality quality);
  FileOutputOptions $FileOutputOptions(
    File file, {
    Duration? durationLimit,
    int? fileSizeLimitBytes,
    Location? location,
  });
  Future<Size<int>?> $QualitySelector$GetResolution(
    CameraInfo cameraInfo,
    Quality quality,
  );
  QualitySelector $QualitySelector$From(
    Quality quality, [
    FallbackStrategy? fallbackStrategy,
  ]);
  QualitySelector $QualitySelector$FromOrderedList(
    List<Quality> qualities, [
    FallbackStrategy? fallbackStrategy,
  ]);

  // view
  AudioConfig get $AudioConfig$AudioDisabled;

  AudioConfig $AudioConfig$Create(bool enableAudio);
  CameraController $CameraController();
  PreviewView $PreviewView();
  RotationProviderListener $RotationProviderListener({
    required void Function(int rotation) onRotationChanged,
  });
  RotationProvider $RotationProvider();
}
