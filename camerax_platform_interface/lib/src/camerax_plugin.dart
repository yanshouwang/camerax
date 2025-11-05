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
  AVAnalyzerApi $AVAnalyzerApi({
    List<AVMetadataObjectType>? types,
    required AVAnalyzerResultConsumerApi consumer,
  });

  // camera2
  Camera2CameraControlApi $Camera2CameraControlApiFrom(
    CameraControlApi cameraControl,
  );
  Camera2CameraInfoApi $Camera2CameraInfoApiFrom(CameraInfoApi cameraInfo);
  CaptureRequestOptionsApi $CaptureRequestOptionsApi({
    CameraMetadataControlMode? mode,
    CameraMetadataControlAeMode? aeMode,
    CameraMetadataControlAfMode? afMode,
    CameraMetadataControlAwbMode? awbMode,
    int? sensorExposureTime,
  });

  // common
  PermissionManagerApi get $PermissionManagerApiInstance;

  AVAnalyzerResultConsumerApi $AVAnalyzerResultConsumerApi({
    required void Function(AVAnalyzerResultApi value) accept,
  });
  ImageProxyConsumerApi $ImageProxyConsumerApi({
    required void Function(ImageProxyApi value) accept,
  });
  MlKitAnalyzerResultConsumerApi $MlKitAnalyzerResultConsumerApi({
    required void Function(MlKitAnalyzerResultApi value) accept,
  });
  VideoRecordEventConsumerApi $VideoRecordEventConsumerApi({
    required void Function(VideoRecordEventApi value) accept,
  });
  LocationApi $LocationApi(double latitude, double longitude);
  CameraStateObserverApi $CameraStateObserverApi({
    required void Function(CameraState value) onChanged,
  });
  IntObserverApi $IntObserverApi({required void Function(int value) onChanged});
  LowLightBoostStateObserverApi $LowLightBoostStateObserverApi({
    required void Function(LowLightBoostState value) onChanged,
  });
  TorchStateObserverApi $TorchStateObserverApi({
    required void Function(TorchState value) onChanged,
  });
  ZoomStateObserverApi $ZoomStateObserverApi({
    required void Function(ZoomStateApi value) onChanged,
  });
  PointApi $PointApi(int x, int y);
  PointFApi $PointFApi(double x, double y);
  RangeApi $RangeApi(int lower, int upper);
  RectApi $RectApi(int left, int top, int right, int bottom);
  RectFApi $RectFApi(double left, double top, double right, double bottom);
  SizeApi $SizeApi(int width, int height);

  // core
  AspectRatioStrategyApi
  get $AspectRatioStrategyApiRatio4_3FallbackAutoStrategy;
  AspectRatioStrategyApi
  get $AspectRatioStrategyApiRatio16_9FallbackAutoStrategy;
  ResolutionStrategyApi get $ResolutionStrategyApiHighestAvailableStrategy;
  CameraSelectorApi get $CameraSelectorApiDefaultBackCamera;
  CameraSelectorApi get $CameraSelectorApiDefaultFrontCamera;
  DynamicRangeApi get $DynamicRangeApiUnspecifid;
  DynamicRangeApi get $DynamicRangeApiSdr;
  DynamicRangeApi get $DynamicRangeApiHdrUnspecified10Bit;
  DynamicRangeApi get $DynamicRangeApiHlg10Bit;
  DynamicRangeApi get $DynamicRangeApiHdr10_10Bit;
  DynamicRangeApi get $DynamicRangeApiHdr10Plus10Bit;
  DynamicRangeApi get $DynamicRangeApiDolbyVision8Bit;
  DynamicRangeApi get $DynamicRangeApiDolbyVision10Bit;

  AspectRatioStrategyApi $AspectRatioStrategyApi({
    required AspectRatio preferredAspectRatio,
    required AspectRatioStrategyFallbackRule fallbackRule,
  });
  ResolutionFilterApi $ResolutionFilterApi({
    required List<SizeApi> Function(
      List<SizeApi> supportedSizes,
      int rotationDegrees,
    )
    filter,
  });
  ResolutionStrategyApi $ResolutionStrategyApi({
    required SizeApi boundSize,
    required ResolutionStrategyFallbackRule fallbackRule,
  });
  ResolutionSelectorApi $ResolutionSelectorApi({
    ResolutionSelectorMode? mode,
    AspectRatioStrategyApi? aspectRatioStrategy,
    ResolutionFilterApi? resolutionFilter,
    ResolutionStrategyApi? resolutionStrategy,
  });
  Future<bool> $CameraInfoApiMustPlayShutterSound();
  CameraSelectorApi $CameraSelectorApi({CameraSelectorLensFacing? lensFacing});
  DynamicRangeApi $DynamicRangeApi({
    required DynamicRangeEncoding encoding,
    required DynamicRangeBitDepth bitDepth,
  });
  ImageAnalysisAnalyzerApi $ImageAnalysisAnalyzerApi({
    required ImageProxyConsumerApi consumer,
  });
  FocusMeteringActionApi $FocusMeteringActionApi(
    (MeteringPointApi, List<FocusMeteringActionMeteringMode>) point, {
    List<(MeteringPointApi, List<FocusMeteringActionMeteringMode>)>? morePoints,
    bool? disableAutoCancel,
    Duration? autoCancelDuration,
  });
  ImageCaptureOnImageCapturedCallbackApi
  $ImageCaptureOnImageCapturedCallbackApi({
    void Function()? onCaptureStarted,
    void Function(int progress)? onCaptureProcessProgressed,
    void Function(ui.Image bitmap)? onPostviewBitmapAvailable,
    void Function(ImageProxyApi image)? onCaptureSuccess,
    void Function(Object exception)? onError,
  });
  Future<double> $MeteringPointFactoryApiGetDefaultPointSize();
  SurfaceOrientedMeteringPointFactoryApi
  $SurfaceOrientedMeteringPointFactoryApi(double width, double height);

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
    LocationApi? location,
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
    CameraInfoApi cameraInfo,
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
