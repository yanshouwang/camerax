import 'dart:io';
import 'dart:ui';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'avfoundation.dart';
// import 'camera2.dart';
import 'common.dart';
import 'core.dart';
import 'video.dart';
import 'view.dart';

final class CameraXiOSPlugin extends CameraXPlugin {
  static void registerWith() {
    CameraXPlugin.instance = CameraXiOSPlugin();
  }

  @override
  PermissionManager $PermissionManagerApi() => PermissionManagerImpl();

  @override
  CameraSelector get $CameraSelectorDefaultFrontCamera =>
      CameraSelectorImpl.front;
  @override
  CameraSelector get $CameraSelectorDefaultBackCamera =>
      CameraSelectorImpl.back;
  @override
  CameraSelector get $CameraSelectorApiExternal => CameraSelectorImpl.external;
  @override
  CameraSelector $CameraSelector({CameraSelectorLensFacing? lensFacing}) =>
      CameraSelectorImpl(lensFacing: lensFacing);

  @override
  CameraControllerApi $CameraControllerApi() => CameraControllerImpl();

  @override
  PreviewViewApi $PreviewViewApi() => PreviewViewImpl();

  @override
  FallbackStrategyApi $FallbackStrategyApiHigherQualityOrLowerThan(
    Quality quality,
  ) => throw UnimplementedError();
  @override
  FallbackStrategyApi $FallbackStrategyApiHigherQualityThan(Quality quality) =>
      throw UnimplementedError();
  @override
  FallbackStrategyApi $FallbackStrategyApiLowerQualityOrHigherThan(
    Quality quality,
  ) => throw UnimplementedError();
  @override
  FallbackStrategyApi $FallbackStrategyApiLowerQualityThan(Quality quality) =>
      throw UnimplementedError();

  @override
  MlKitAnalyzerApi $MlKitAnalyzerApi({
    required List<DetectorApi> detectors,
    required ImageAnalysisCoordinateSystem targetCoordinateSystem,
    required ConsumerApi<MlKitAnalyzerResultApi> consumer,
  }) => throw UnimplementedError();

  @override
  Future<SizeApi<int>?> $QualitySelectorApiGetResolution(
    CameraInfo cameraInfo,
    Quality quality,
  ) => throw UnimplementedError();

  @override
  QualitySelectorApi $QualitySelectorApiFrom(
    Quality quality, {
    FallbackStrategyApi? fallbackStrategy,
  }) => throw UnimplementedError();

  @override
  QualitySelectorApi $QualitySelectorApiFromOrderedList(
    List<Quality> qualities, {
    FallbackStrategyApi? fallbackStrategy,
  }) => throw UnimplementedError();

  @override
  BarcodeScannerOptionsApi $BarcodeScannerOptionsApi({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptionsApi? zoomSuggestionOptions,
  }) => throw UnimplementedError();

  @override
  FaceDetectorOptionsApi $FaceDetectorOptionsApi({
    bool? enableTracking,
    FaceDetectorOptionsClassificationMode? classificationMode,
    FaceDetectorOptionsContourMode? contourMode,
    FaceDetectorOptionsLandmarkMode? landmarkMode,
    double? minFaceSize,
    FaceDetectorOptionsPerformanceMode? performanceMode,
  }) => throw UnimplementedError();

  @override
  ZoomSuggestionOptionsApi $ZoomSuggestionOptionsApi(
    ZoomSuggestionOptionsZoomCallbackApi zoomCallback, {
    double? maxSupportedZoomRatio,
  }) => throw UnimplementedError();

  @override
  FileOutputOptionsApi $FileOutputOptionsApi(
    File file, {
    Duration? durationLimit,
    int? fileSizeLimitBytes,
    Location? location,
  }) => FileOutputOptionsImpl(
    file,
    durationLimit: durationLimit,
    fileSizeLimitBytes: fileSizeLimitBytes,
    location: location,
  );

  @override
  SurfaceOrientedMeteringPointFactory $SurfaceOrientedMeteringPointFactory(
    width,
    height,
  ) => SurfaceOrientedMeteringPointFactoryImpl(width, height);

  @override
  FocusMeteringAction $FocusMeteringAction(
    (MeteringPoint, List<FocusMeteringActionMeteringMode>) point, {
    List<(MeteringPoint, List<FocusMeteringActionMeteringMode>)>? morePoints,
    bool? disableAutoCancel,
    Duration? autoCancelDuration,
  }) => FocusMeteringActionImpl(
    point,
    morePoints: morePoints,
    disableAutoCancel: disableAutoCancel,
    autoCancelDuration: autoCancelDuration,
  );

  @override
  ImageAnalysisImageAnalyzerApi $ImageAnalysisAnalyzer({
    required void Function(ImageProxy image) analyze,
  }) => ImageAnalyzerImpl(analyze: analyze);

  @override
  Camera2CameraControl $Camera2CameraControlFrom(CameraControl cameraControl) =>
      throw UnimplementedError();

  @override
  Camera2CameraInfo $Camera2CameraInfoFrom(CameraInfo cameraInfo) =>
      throw UnimplementedError();

  @override
  CaptureRequestOptions $CaptureRequestOptions({
    CameraMetadataControlMode? mode,
    CameraMetadataControlAeMode? aeMode,
    CameraMetadataControlAfMode? afMode,
    CameraMetadataControlAwbMode? awbMode,
    int? sensorExposureTime,
  }) => throw UnimplementedError();

  @override
  AVAnalyzer $AVAnalyzer({
    List<AVMetadataObjectType>? types,
    required ConsumerApi<AVAnalyzerResult> consumer,
  }) => AVAnalyzerImpl(types: types, consumer: consumer);

  @override
  ObserverApi<CameraState> $CameraStateObserverApi({
    required void Function(CameraState value) onChanged,
  }) => CameraStateObserverImpl(onChanged: onChanged);

  @override
  ImageCaptureOnImageCapturedCallback $ImageCaptureOnImageCapturedCallback({
    void Function()? onCaptureStarted,
    void Function(int progress)? onCaptureProcessProgressed,
    void Function(Image bitmap)? onPostviewBitmapAvailable,
    void Function(ImageProxy image)? onCaptureSuccess,
    void Function(Object exception)? onError,
  }) => ImageCaptureOnImageCapturedCallbackImpl(
    onCaptureStarted: onCaptureStarted,
    onCaptureProcessProgressed: onCaptureProcessProgressed,
    onPostviewBitmapAvailable: onPostviewBitmapAvailable,
    onCaptureSuccess: onCaptureSuccess,
    onError: onError,
  );

  @override
  ConsumerApi<MlKitAnalyzerResultApi> $MlKitAnalyzerResultConsumerApi({
    required void Function(MlKitAnalyzerResultApi value) accept,
  }) => throw UnimplementedError();

  @override
  ResolutionFilter $ResolutionFilter({
    required List<SizeApi<int>> Function(
      List<SizeApi<int>> supportedSizes,
      int rotationDegrees,
    )
    filter,
  }) => throw UnimplementedError();

  @override
  RotationProviderApi $RotationProviderApi() => RotationProviderImpl();

  @override
  RotationProviderListenerApi $RotationProviderListenerApi({
    required void Function(int rotation) onRotationChanged,
  }) => RotationProviderListenerImpl(onRotationChanged: onRotationChanged);

  @override
  ObserverApi<TorchState> $TorchStateObserverApi({
    required void Function(TorchState value) onChanged,
  }) => TorchStateObserverImpl(onChanged: onChanged);

  @override
  ConsumerApi<VideoRecordEventApi> $VideoRecordEventConsumerApi({
    required void Function(VideoRecordEventApi value) accept,
  }) => VideoRecordEventConsumerImpl(accept: accept);

  @override
  ObserverApi<ZoomState> $ZoomStateObserverApi({
    required void Function(ZoomState value) onChanged,
  }) => ZoomStateObserverImpl(onChanged: onChanged);

  @override
  ZoomSuggestionOptionsZoomCallbackApi $ZoomSuggestionOptionsZoomCallbackApi({
    required bool Function(double zoomRatio) setZoom,
  }) => throw UnimplementedError();

  @override
  Future<BarcodeScannerApi> $BarcodeScanningApiGetClient([
    BarcodeScannerOptionsApi? options,
  ]) => throw UnimplementedError();

  @override
  Future<FaceDetectorApi> $FaceDetectionApiGetClient([
    FaceDetectorOptionsApi? options,
  ]) => throw UnimplementedError();

  @override
  Location $Location(double latitude, double longitude) =>
      LocationImpl(latitude, longitude);

  @override
  ConsumerApi<AVAnalyzerResult> $AVAnalyzerResultConsumer({
    required void Function(AVAnalyzerResult value) accept,
  }) => AVAnalyzerResultConsumerImpl(accept: accept);
}
