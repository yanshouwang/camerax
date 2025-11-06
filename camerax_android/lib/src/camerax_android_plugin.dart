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
  CameraSelector get $CameraSelector$DefaultFrontCamera =>
      CameraSelectorImpl.front;
  @override
  CameraSelector get $CameraSelector$DefaultBackCamera =>
      CameraSelectorImpl.back;
  @override
  CameraSelector get $CameraSelectorApiExternal => CameraSelectorImpl.external;
  @override
  CameraSelector $CameraSelector({CameraSelectorLensFacing? lensFacing}) =>
      CameraSelectorImpl(lensFacing: lensFacing);

  @override
  CameraController $CameraController() => CameraControllerImpl();

  @override
  PreviewViewApi $PreviewView() => PreviewViewImpl();

  @override
  FallbackStrategy $FallbackStrategy$HigherQualityOrLowerThan(
    Quality quality,
  ) => FallbackStrategyImpl.higherQualityOrLowerThan(quality);
  @override
  FallbackStrategy $FallbackStrategy$HigherQualityThan(Quality quality) =>
      FallbackStrategyImpl.higherQualityThan(quality);
  @override
  FallbackStrategy $FallbackStrategy$LowerQualityOrHigherThan(
    Quality quality,
  ) => FallbackStrategyImpl.lowerQualityOrHigherThan(quality);
  @override
  FallbackStrategy $FallbackStrategy$LowerQualityThan(Quality quality) =>
      FallbackStrategyImpl.lowerQualityThan(quality);

  @override
  MlKitAnalyzer $MlKitAnalyzer({
    required List<DetectorApi> detectors,
    required ImageAnalysisCoordinateSystem targetCoordinateSystem,
    required ConsumerApi<MlKitAnalyzerResult> consumer,
  }) => MlKitAnalyzerImpl(
    detectors: detectors,
    targetCoordinateSystem: targetCoordinateSystem,
    consumer: consumer,
  );

  @override
  Future<SizeApi<int>?> $QualitySelector$GetResolution(
    CameraInfo cameraInfo,
    Quality quality,
  ) => QualitySelectorImpl.getResolution(cameraInfo, quality);

  @override
  QualitySelector $QualitySelector$From(
    Quality quality, {
    FallbackStrategy? fallbackStrategy,
  }) => QualitySelectorImpl.from(quality, fallbackStrategy: fallbackStrategy);

  @override
  QualitySelector $QualitySelector$FromOrderedList(
    List<Quality> qualities, {
    FallbackStrategy? fallbackStrategy,
  }) => QualitySelectorImpl.fromOrderedList(
    qualities,
    fallbackStrategy: fallbackStrategy,
  );

  @override
  BarcodeScannerOptions $BarcodeScannerOptions({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptions? zoomSuggestionOptions,
  }) => BarcodeScannerOptionsImpl(
    enableAllPotentialBarcodes: enableAllPotentialBarcodes,
    formats: formats,
    zoomSuggestionOptions: zoomSuggestionOptions,
  );

  @override
  FaceDetectorOptions $FaceDetectorOptions({
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
  ZoomSuggestionOptions $ZoomSuggestionOptions(
    ZoomSuggestionOptionsZoomCallback zoomCallback, {
    double? maxSupportedZoomRatio,
  }) => ZoomSuggestionOptionsImpl(
    zoomCallback,
    maxSupportedZoomRatio: maxSupportedZoomRatio,
  );

  @override
  FileOutputOptions $FileOutputOptions(
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
  Camera2CameraControl $Camera2CameraControl$From(CameraControl cameraControl) =>
      Camera2CameraControlImpl.from(cameraControl);

  @override
  Camera2CameraInfo $Camera2CameraInfo$From(CameraInfo cameraInfo) =>
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
  ConsumerApi<MlKitAnalyzerResult> $MlKitAnalyzerResultConsumerApi({
    required void Function(MlKitAnalyzerResult value) accept,
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
  RotationProvider $RotationProvider() => RotationProviderImpl();

  @override
  RotationProviderListener $RotationProviderListener({
    required void Function(int rotation) onRotationChanged,
  }) => RotationProviderListenerImpl(onRotationChanged: onRotationChanged);

  @override
  ObserverApi<TorchState> $TorchStateObserverApi({
    required void Function(TorchState value) onChanged,
  }) => TorchStateObserverImpl(onChanged: onChanged);

  @override
  ConsumerApi<VideoRecordEvent> $VideoRecordEventConsumerApi({
    required void Function(VideoRecordEvent value) accept,
  }) => VideoRecordEventConsumerImpl(accept: accept);

  @override
  ObserverApi<ZoomState> $ZoomStateObserverApi({
    required void Function(ZoomState value) onChanged,
  }) => ZoomStateObserverImpl(onChanged: onChanged);

  @override
  ZoomSuggestionOptionsZoomCallback $ZoomSuggestionOptions$ZoomCallback({
    required bool Function(double zoomRatio) setZoom,
  }) => ZoomSuggestionOptionsZoomCallbackImpl(setZoom: setZoom);

  @override
  Future<BarcodeScanner> $BarcodeScanningApiGetClient([
    BarcodeScannerOptions? options,
  ]) => BarcodeScanningImpl.getClient(options);

  @override
  Future<FaceDetector> $FaceDetectionApiGetClient([
    FaceDetectorOptions? options,
  ]) => FaceDetectionImpl.getClient(options);

  @override
  Location $Location(double latitude, double longitude) =>
      LocationImpl(latitude, longitude);

  @override
  ConsumerApi<AVAnalyzerResult> $AVAnalyzerResultConsumer({
    required void Function(AVAnalyzerResult value) accept,
  }) => throw UnimplementedError();
}
