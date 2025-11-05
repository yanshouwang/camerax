import 'dart:io';

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
  Camera2CameraControl $Camera2CameraControlFrom(CameraControl cameraControl);
  Camera2CameraInfo $Camera2CameraInfoFrom(CameraInfo cameraInfo);
  CaptureRequestOptions $CaptureRequestOptions({
    CameraMetadataControlMode? mode,
    CameraMetadataControlAeMode? aeMode,
    CameraMetadataControlAfMode? afMode,
    CameraMetadataControlAwbMode? awbMode,
    int? sensorExposureTime,
  });

  // common
  PermissionManager get $PermissionManagerApiInstance;

  Consumer<T> $Consumer<T>({required void Function(T value) accept});
  Location $Location();
  Observer<T> $Observer<T>({required void Function(T value) onChanged});

  // core
  AspectRatioStrategy get $AspectRatioStrategyRatio4_3FallbackAutoStrategy;
  AspectRatioStrategy get $AspectRatioStrategyRatio16_9FallbackAutoStrategy;
  ResolutionStrategy get $ResolutionStrategyHighestAvailableStrategy;
  CameraSelector get $CameraSelectorDefaultBackCamera;
  CameraSelector get $CameraSelectorDefaultFrontCamera;
  DynamicRange get $DynamicRangeUnspecifid;
  DynamicRange get $DynamicRangeSdr;
  DynamicRange get $DynamicRangeHdrUnspecified10Bit;
  DynamicRange get $DynamicRangeHlg10Bit;
  DynamicRange get $DynamicRangeHdr10_10Bit;
  DynamicRange get $DynamicRangeHdr10Plus10Bit;
  DynamicRange get $DynamicRangeDolbyVision8Bit;
  DynamicRange get $DynamicRangeDolbyVision10Bit;

  AspectRatioStrategy $AspectRatioStrategyApi({
    required AspectRatio preferredAspectRatio,
    required AspectRatioStrategyFallbackRule fallbackRule,
  });
  ResolutionFilter $ResolutionFilter({
    required List<SizeApi> Function(
      List<SizeApi> supportedSizes,
      int rotationDegrees,
    )
    filter,
  });
  ResolutionStrategy $ResolutionStrategyApi({
    required SizeApi boundSize,
    required ResolutionStrategyFallbackRule fallbackRule,
  });
  ResolutionSelector $ResolutionSelectorApi({
    ResolutionSelectorMode? mode,
    AspectRatioStrategy? aspectRatioStrategy,
    ResolutionFilter? resolutionFilter,
    ResolutionStrategy? resolutionStrategy,
  });
  Future<bool> $CameraInfoMustPlayShutterSound();
  CameraSelector $CameraSelector({CameraSelectorLensFacing? lensFacing});
  DynamicRange $DynamicRange({
    required DynamicRangeEncoding encoding,
    required DynamicRangeBitDepth bitDepth,
  });
  ImageAnalysisAnalyzer $ImageAnalysisAnalyzer({
    required ImageProxyConsumerApi consumer,
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
    void Function(Bitmap bitmap)? onPostviewBitmapAvailable,
    void Function(ImageProxy image)? onCaptureSuccess,
    void Function(Object exception)? onError,
  });
  Future<double> $MeteringPointFactoryGetDefaultPointSize();
  SurfaceOrientedMeteringPointFactory $SurfaceOrientedMeteringPointFactory(
    double width,
    double height,
  );

  // ml
  MlKitAnalyzerApi $MlKitAnalyzerApi({
    required List<BarcodeScannerApi> detectors1,
    required List<FaceDetectorApi> detectors2,
    required ImageAnalysisCoordinateSystem targetCoordinateSystem,
    required MlKitAnalyzerResultConsumerApi consumer,
  });
  ZoomSuggestionOptionsZoomCallbackApi $ZoomSuggestionOptionsZoomCallbackApi({
    required bool Function(double zoomRatio) setZoom,
  });
  ZoomSuggestionOptionsApi $ZoomSuggestionOptionsApi(
    ZoomSuggestionOptionsZoomCallbackApi zoomCallback, {
    double? maxSupportedZoomRatio,
  });
  BarcodeScannerOptionsApi $BarcodeScannerOptionsApi({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptionsApi? zoomSuggestionOptions,
  });
  BarcodeScannerApi $BarcodeScannerApi();
  BarcodeScannerApi $BarcodeScannerApiOptions(BarcodeScannerOptionsApi options);
  FaceDetectorOptionsApi $FaceDetectorOptionsApi({
    bool? enableTracking,
    FaceDetectorOptionsClassificationMode? classificationMode,
    FaceDetectorOptionsContourMode? contourMode,
    FaceDetectorOptionsLandmarkMode? landmarkMode,
    double? minFaceSize,
    FaceDetectorOptionsPerformanceMode? performanceMode,
  });
  FaceDetectorApi $FaceDetectorApi();
  FaceDetectorApi $FaceDetectorApiOptions(FaceDetectorOptionsApi options);

  // video
  QualityApi get $QualityApiSd;
  QualityApi get $QualityApiHd;
  QualityApi get $QualityApiFhd;
  QualityApi get $QualityApiUhd;
  QualityApi get $QualityApiLowest;
  QualityApi get $QualityApiHighest;

  FallbackStrategyApi $FallbackStrategyApiHigherQualityOrLowerThan(
    QualityApi quality,
  );
  FallbackStrategyApi $FallbackStrategyApiHigherQualityThan(QualityApi quality);
  FallbackStrategyApi $FallbackStrategyApiLowerQualityOrHigherThan(
    QualityApi quality,
  );
  FallbackStrategyApi $FallbackStrategyApiLowerQualityThan(QualityApi quality);
  FileOutputOptionsApi $FileOutputOptionsApi(
    File file, {
    Duration? durationLimit,
    int? fileSizeLimitBytes,
    Location? location,
  });
  QualitySelectorApi $QualitySelectorApiFrom(
    QualityApi quality, {
    FallbackStrategyApi? fallbackStrategy,
  });
  QualitySelectorApi $QualitySelectorApiFromOrderedList(
    List<QualityApi> qualities, {
    FallbackStrategyApi? fallbackStrategy,
  });
  Future<SizeApi?> $QualitySelectorApiGetResolution(
    CameraInfo cameraInfo,
    QualityApi quality,
  );

  // view
  AudioConfigApi get $AudioConfigApiAudioDisabled;

  AudioConfigApi $AudioConfigApiCreate(bool enableAudio);
  CameraControllerApi $CameraControllerApi();
  PreviewViewApi $PreviewViewApi();
  RotationProviderListenerApi $RotationProviderListenerApi({
    required void Function(int rotation) onRotationChanged,
  });
  RotationProviderApi $RotationProviderApi();
}
