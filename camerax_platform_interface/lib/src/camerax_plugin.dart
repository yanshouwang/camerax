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
import 'vision.dart';
import 'visionx.dart';

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
  Camera2CameraControl $Camera2CameraControl$from(CameraControl cameraControl);
  Camera2CameraInfo $Camera2CameraInfo$from(CameraInfo cameraInfo);
  CaptureRequestOptions $CaptureRequestOptions({
    CameraMetadataControlMode? mode,
    CameraMetadataControlAeMode? aeMode,
    CameraMetadataControlAfMode? afMode,
    CameraMetadataControlAwbMode? awbMode,
    int? sensorExposureTime,
  });

  // common
  Consumer<T> $Consumer<T>({required void Function(T value) accept});
  Location $Location(double latitude, double longitude);
  Observer<T> $Observer<T>({required void Function(T value) onChanged});
  PermissionManager $PermissionManager();

  // core
  AspectRatioStrategy get $AspectRatioStrategy$ratio4_3FallbackAutoStrategy;
  AspectRatioStrategy get $AspectRatioStrategy$ratio16_9FallbackAutoStrategy;
  ResolutionStrategy get $ResolutionStrategy$highestAvailableStrategy;
  CameraSelector get $CameraSelector$back;
  CameraSelector get $CameraSelector$front;
  CameraSelector get $CameraSelector$external;
  DynamicRange get $DynamicRange$unspecifid;
  DynamicRange get $DynamicRange$sdr;
  DynamicRange get $DynamicRange$hdrUnspecified10Bit;
  DynamicRange get $DynamicRange$hdr10_10Bit;
  DynamicRange get $DynamicRange$hdr10Plus10Bit;
  DynamicRange get $DynamicRange$hlg10Bit;
  DynamicRange get $DynamicRange$dolbyVision8Bit;
  DynamicRange get $DynamicRange$dolbyVision10Bit;

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
  Future<bool> $CameraInfo$mustPlayShutterSound();
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
  Future<double> $MeteringPointFactory$getDefaultPointSize();
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
  InputImage $InputImage$fromFilePath(Uri imageUri);
  ZoomSuggestionOptionsZoomCallback $ZoomSuggestionOptionsZoomCallback({
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
  BarcodeScanner $BarcodeScanner$options(BarcodeScannerOptions options);
  FaceDetectorOptions $FaceDetectorOptions({
    bool? enableTracking,
    FaceDetectorOptionsClassificationMode? classificationMode,
    FaceDetectorOptionsContourMode? contourMode,
    FaceDetectorOptionsLandmarkMode? landmarkMode,
    double? minFaceSize,
    FaceDetectorOptionsPerformanceMode? performanceMode,
  });
  FaceDetector $FaceDetector();
  FaceDetector $FaceDetector$options(FaceDetectorOptions options);

  // video
  Quality get $Quality$sd;
  Quality get $Quality$hd;
  Quality get $Quality$fhd;
  Quality get $Quality$uhd;
  Quality get $Quality$lowest;
  Quality get $Quality$highest;

  FallbackStrategy $FallbackStrategy$higherQualityOrLowerThan(Quality quality);
  FallbackStrategy $FallbackStrategy$higherQualityThan(Quality quality);
  FallbackStrategy $FallbackStrategy$lowerQualityOrHigherThan(Quality quality);
  FallbackStrategy $FallbackStrategy$lowerQualityThan(Quality quality);
  FileOutputOptions $FileOutputOptions(
    File file, {
    Duration? durationLimit,
    int? fileSizeLimitBytes,
    Location? location,
  });
  Future<Size<int>?> $QualitySelector$getResolution(
    CameraInfo cameraInfo,
    Quality quality,
  );
  QualitySelector $QualitySelector$from(
    Quality quality, [
    FallbackStrategy? fallbackStrategy,
  ]);
  QualitySelector $QualitySelector$fromOrderedList(
    List<Quality> qualities, [
    FallbackStrategy? fallbackStrategy,
  ]);

  // view
  AudioConfig get $AudioConfig$audioDisabled;

  AudioConfig $AudioConfig$create(bool enableAudio);
  CameraController $CameraController();
  PreviewView $PreviewView();
  RotationProviderListener $RotationProviderListener({
    required void Function(SurfaceRotation rotation) onRotationChanged,
  });
  RotationProvider $RotationProvider();

  // vision
  VNImageRequestHandler $VNImageRequestHandler$uri(Uri uri);

  VNDetectBarcodesRequest $VNDetectBarcodesRequest({
    required VNRequestCompletionHandler completionHandler,
  });

  VNDetectFaceRectanglesRequest $VNDetectFaceRectanglesRequest({
    required VNRequestCompletionHandler completionHandler,
  });

  VisionAnalyzer $VisionAnalyzer({
    List<VisionObjectType>? types,
    required Consumer<VisionAnalyzerResult> consumer,
  });

  // visionx
  VisionImage $VisionImage$uri(Uri uri);
  VisionImage $VisionImage$file(File file);
  VisionDetector $VisionDetector({List<VisionObjectType>? types});
}
