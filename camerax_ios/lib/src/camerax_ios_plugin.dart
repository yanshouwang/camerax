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
  ) => throw UnimplementedError();
  @override
  FallbackStrategy $FallbackStrategy$HigherQualityThan(Quality quality) =>
      throw UnimplementedError();
  @override
  FallbackStrategy $FallbackStrategy$LowerQualityOrHigherThan(
    Quality quality,
  ) => throw UnimplementedError();
  @override
  FallbackStrategy $FallbackStrategy$LowerQualityThan(Quality quality) =>
      throw UnimplementedError();

  @override
  MlKitAnalyzer $MlKitAnalyzer({
    required List<DetectorApi> detectors,
    required ImageAnalysisCoordinateSystem targetCoordinateSystem,
    required ConsumerApi<MlKitAnalyzerResult> consumer,
  }) => throw UnimplementedError();

  @override
  Future<SizeApi<int>?> $QualitySelector$GetResolution(
    CameraInfo cameraInfo,
    Quality quality,
  ) => throw UnimplementedError();

  @override
  QualitySelector $QualitySelector$From(
    Quality quality, {
    FallbackStrategy? fallbackStrategy,
  }) => throw UnimplementedError();

  @override
  QualitySelector $QualitySelector$FromOrderedList(
    List<Quality> qualities, {
    FallbackStrategy? fallbackStrategy,
  }) => throw UnimplementedError();

  @override
  BarcodeScannerOptions $BarcodeScannerOptions({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptions? zoomSuggestionOptions,
  }) => throw UnimplementedError();

  @override
  FaceDetectorOptions $FaceDetectorOptions({
    bool? enableTracking,
    FaceDetectorOptionsClassificationMode? classificationMode,
    FaceDetectorOptionsContourMode? contourMode,
    FaceDetectorOptionsLandmarkMode? landmarkMode,
    double? minFaceSize,
    FaceDetectorOptionsPerformanceMode? performanceMode,
  }) => throw UnimplementedError();

  @override
  ZoomSuggestionOptions $ZoomSuggestionOptions(
    ZoomSuggestionOptionsZoomCallback zoomCallback, {
    double? maxSupportedZoomRatio,
  }) => throw UnimplementedError();

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
  }) => ImageAnalyzerImpl(analyze: analyze);

  @override
  Camera2CameraControl $Camera2CameraControl$From(CameraControl cameraControl) =>
      throw UnimplementedError();

  @override
  Camera2CameraInfo $Camera2CameraInfo$From(CameraInfo cameraInfo) =>
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
  ConsumerApi<MlKitAnalyzerResult> $MlKitAnalyzerResultConsumerApi({
    required void Function(MlKitAnalyzerResult value) accept,
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
  }) => throw UnimplementedError();

  @override
  Future<BarcodeScanner> $BarcodeScanningApiGetClient([
    BarcodeScannerOptions? options,
  ]) => throw UnimplementedError();

  @override
  Future<FaceDetector> $FaceDetectionApiGetClient([
    FaceDetectorOptions? options,
  ]) => throw UnimplementedError();

  @override
  Location $Location(double latitude, double longitude) =>
      LocationImpl(latitude, longitude);

  @override
  ConsumerApi<AVAnalyzerResult> $AVAnalyzerResultConsumer({
    required void Function(AVAnalyzerResult value) accept,
  }) => AVAnalyzerResultConsumerImpl(accept: accept);
}
