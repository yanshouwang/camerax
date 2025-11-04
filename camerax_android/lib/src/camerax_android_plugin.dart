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
  PermissionManagerApi $PermissionManagerApi() => PermissionManagerImpl();

  @override
  CameraSelectorApi get $CameraSelectorApiFront => CameraSelectorImpl.front;
  @override
  CameraSelectorApi get $CameraSelectorApiBack => CameraSelectorImpl.back;
  @override
  CameraSelectorApi get $CameraSelectorApiExternal => CameraSelectorImpl.external;
  @override
  CameraSelectorApi $CameraSelectorApi({CameraSelectorLensFacing? lensFacing}) =>
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
    CameraInfoApi cameraInfo,
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
    LocationApi? location,
  }) => FileOutputOptionsImpl(
    file,
    durationLimit: durationLimit,
    fileSizeLimitBytes: fileSizeLimitBytes,
    location: location,
  );

  @override
  SurfaceOrientedMeteringPointFactoryApi $SurfaceOrientedMeteringPointFactoryApi(
    width,
    height,
  ) => SurfaceOrientedMeteringPointFactoryImpl(width, height);

  @override
  FocusMeteringActionApi $FocusMeteringActionApi(
    (MeteringPointApi, List<FocusMeteringActionMeteringMode>) point, {
    List<(MeteringPointApi, List<FocusMeteringActionMeteringMode>)>? morePoints,
    bool? disableAutoCancel,
    Duration? autoCancelDuration,
  }) => FocusMeteringActionImpl(
    point,
    morePoints: morePoints,
    disableAutoCancel: disableAutoCancel,
    autoCancelDuration: autoCancelDuration,
  );

  @override
  ImageAnalysisImageAnalyzerApi $ImageAnalysisAnalyzerApi({
    required void Function(ImageProxyApi image) analyze,
  }) => ImageAnalysisImageAnalyzerImplImpl(analyze: analyze);

  @override
  Camera2CameraControlApi $Camera2CameraControlApiFrom(
    CameraControlApi cameraControl,
  ) => Camera2CameraControlImpl.from(cameraControl);

  @override
  Camera2CameraInfoApi $Camera2CameraInfoApiFrom(CameraInfoApi cameraInfo) =>
      Camera2CameraInfoImpl.from(cameraInfo);

  @override
  CaptureRequestOptionsApi $CaptureRequestOptionsApi({
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
  AVAnalyzerApi $AVAnalyzerApi({
    List<AVMetadataObjectType>? types,
    required ConsumerApi<AVAnalyzerResultApi> consumer,
  }) => throw UnimplementedError();

  @override
  ObserverApi<CameraState> $CameraStateObserverApi({
    required void Function(CameraState value) onChanged,
  }) => CameraStateObserverImpl(onChanged: onChanged);

  @override
  ImageCaptureOnImageCapturedCallbackApi $ImageCaptureOnImageCapturedCallbackApi({
    void Function()? onCaptureStarted,
    void Function(int progress)? onCaptureProcessProgressed,
    void Function(Image bitmap)? onPostviewBitmapAvailable,
    void Function(ImageProxyApi image)? onCaptureSuccess,
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
  ResolutionFilterApi $ResolutionFilterApi({
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
  ObserverApi<ZoomStateApi> $ZoomStateObserverApi({
    required void Function(ZoomStateApi value) onChanged,
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
  LocationApi $LocationApi(double latitude, double longitude) =>
      LocationImpl(latitude, longitude);

  @override
  ConsumerApi<AVAnalyzerResultApi> $AVAnalyzerResultConsumerApi({
    required void Function(AVAnalyzerResultApi value) accept,
  }) => throw UnimplementedError();
}
