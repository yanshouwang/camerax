import 'dart:io';
import 'dart:ui';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'camera2.dart';
import 'common.dart';
import 'core.dart';
import 'ml.dart';
import 'video.dart';
import 'view.dart';

final class CameraXAndroidPlugin extends CameraXPlugin {
  static void registerWith() {
    CameraXPlugin.instance = CameraXAndroidPlugin();
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
  ) => FallbackStrategyImpl.higherQualityOrLowerThan(quality);
  @override
  FallbackStrategyApi $FallbackStrategyApiHigherQualityThan(Quality quality) =>
      FallbackStrategyImpl.higherQualityThan(quality);
  @override
  FallbackStrategyApi $FallbackStrategyApiLowerQualityOrHigherThan(
    Quality quality,
  ) => FallbackStrategyImpl.lowerQualityOrHigherThan(quality);
  @override
  FallbackStrategyApi $FallbackStrategyApiLowerQualityThan(Quality quality) =>
      FallbackStrategyImpl.lowerQualityThan(quality);

  @override
  MlKitAnalyzerApi $MlKitAnalyzerApi({
    required List<DetectorApi> detectors,
    required ImageAnalysisCoordinateSystem targetCoordinateSystem,
    required ConsumerApi<MlKitAnalyzerResultApi> consumer,
  }) => MlKitAnalyzerImpl(
    detectors: detectors,
    targetCoordinateSystem: targetCoordinateSystem,
    consumer: consumer,
  );

  @override
  Future<SizeApi<int>?> $QualitySelectorApiGetResolution(
    CameraInfo cameraInfo,
    Quality quality,
  ) => QualitySelectorImpl.getResolution(cameraInfo, quality);

  @override
  QualitySelectorApi $QualitySelectorApiFrom(
    Quality quality, {
    FallbackStrategyApi? fallbackStrategy,
  }) => QualitySelectorImpl.from(quality, fallbackStrategy: fallbackStrategy);

  @override
  QualitySelectorApi $QualitySelectorApiFromOrderedList(
    List<Quality> qualities, {
    FallbackStrategyApi? fallbackStrategy,
  }) => QualitySelectorImpl.fromOrderedList(
    qualities,
    fallbackStrategy: fallbackStrategy,
  );

  @override
  BarcodeScannerOptionsApi $BarcodeScannerOptionsApi({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptionsApi? zoomSuggestionOptions,
  }) => BarcodeScannerOptionsImpl(
    enableAllPotentialBarcodes: enableAllPotentialBarcodes,
    formats: formats,
    zoomSuggestionOptions: zoomSuggestionOptions,
  );

  @override
  FaceDetectorOptionsApi $FaceDetectorOptionsApi({
    bool? enableTracking,
    FaceDetectorOptionsClassificationMode? classificationMode,
    FaceDetectorOptionsContourMode? contourMode,
    FaceDetectorOptionsLandmarkMode? landmarkMode,
    double? minFaceSize,
    FaceDetectorOptionsPerformanceMode? performanceMode,
  }) => FaceDetectorOptionsImpl(
    enableTracking: enableTracking,
    classificationMode: classificationMode,
    contourMode: contourMode,
    landmarkMode: landmarkMode,
    minFaceSize: minFaceSize,
    performanceMode: performanceMode,
  );

  @override
  ZoomSuggestionOptionsApi $ZoomSuggestionOptionsApi(
    ZoomSuggestionOptionsZoomCallbackApi zoomCallback, {
    double? maxSupportedZoomRatio,
  }) => ZoomSuggestionOptionsImpl(
    zoomCallback,
    maxSupportedZoomRatio: maxSupportedZoomRatio,
  );

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
  }) => ImageAnalysisImageAnalyzerImplImpl(analyze: analyze);

  @override
  Camera2CameraControl $Camera2CameraControlFrom(CameraControl cameraControl) =>
      Camera2CameraControlImpl.from(cameraControl);

  @override
  Camera2CameraInfo $Camera2CameraInfoFrom(CameraInfo cameraInfo) =>
      Camera2CameraInfoImpl.from(cameraInfo);

  @override
  CaptureRequestOptions $CaptureRequestOptions({
    CameraMetadataControlMode? mode,
    CameraMetadataControlAeMode? aeMode,
    CameraMetadataControlAfMode? afMode,
    CameraMetadataControlAwbMode? awbMode,
    int? sensorExposureTime,
  }) => CaptureRequestOptionsImpl(
    mode: mode,
    aeMode: aeMode,
    afMode: afMode,
    awbMode: awbMode,
    sensorExposureTime: sensorExposureTime,
  );

  @override
  AVAnalyzer $AVAnalyzer({
    List<AVMetadataObjectType>? types,
    required ConsumerApi<AVAnalyzerResult> consumer,
  }) => throw UnimplementedError();

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
  }) => MlKitAnalyzerResultConsumerImpl(accept: accept);

  @override
  ResolutionFilter $ResolutionFilter({
    required List<SizeApi<int>> Function(
      List<SizeApi<int>> supportedSizes,
      int rotationDegrees,
    )
    filter,
  }) => ResolutionFilterImpl(filter: filter);

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
  }) => ZoomSuggestionOptionsZoomCallbackImpl(setZoom: setZoom);

  @override
  Future<BarcodeScannerApi> $BarcodeScanningApiGetClient([
    BarcodeScannerOptionsApi? options,
  ]) => BarcodeScanningImpl.getClient(options);

  @override
  Future<FaceDetectorApi> $FaceDetectionApiGetClient([
    FaceDetectorOptionsApi? options,
  ]) => FaceDetectionImpl.getClient(options);

  @override
  Location $Location(double latitude, double longitude) =>
      LocationImpl(latitude, longitude);

  @override
  ConsumerApi<AVAnalyzerResult> $AVAnalyzerResultConsumer({
    required void Function(AVAnalyzerResult value) accept,
  }) => throw UnimplementedError();
}
