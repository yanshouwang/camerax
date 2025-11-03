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
  PermissionManager newPermissionManager() => PermissionManagerImpl();

  @override
  CameraSelector get $CameraSelectorFront => CameraSelectorImpl.front;
  @override
  CameraSelector get $CameraSelectorBack => CameraSelectorImpl.back;
  @override
  CameraSelector get $CameraSelectorExternal => CameraSelectorImpl.external;
  @override
  CameraSelector newCameraSelector({CameraSelectorLensFacing? lensFacing}) =>
      CameraSelectorImpl(lensFacing: lensFacing);

  @override
  CameraController newCameraController() => CameraControllerImpl();

  @override
  PreviewView newPreviewView() => PreviewViewImpl();

  @override
  FallbackStrategy newFallbackStrategyHigherQualityOrLowerThan(
    Quality quality,
  ) => throw UnimplementedError();
  @override
  FallbackStrategy newFallbackStrategyHigherQualityThan(Quality quality) =>
      throw UnimplementedError();
  @override
  FallbackStrategy newFallbackStrategyLowerQualityOrHigherThan(
    Quality quality,
  ) => throw UnimplementedError();
  @override
  FallbackStrategy newFallbackStrategyLowerQualityThan(Quality quality) =>
      throw UnimplementedError();

  @override
  MlKitAnalyzer newMlKitAnalyzer({
    required List<Detector> detectors,
    required ImageAnalysisCoordinateSystem targetCoordinateSystem,
    required Consumer<MlKitAnalyzerResult> consumer,
  }) => throw UnimplementedError();

  @override
  Future<Size<int>?> $QualitySelectorGetResolution(
    CameraInfo cameraInfo,
    Quality quality,
  ) => throw UnimplementedError();

  @override
  QualitySelector newQualitySelectorFrom(
    Quality quality, {
    FallbackStrategy? fallbackStrategy,
  }) => throw UnimplementedError();

  @override
  QualitySelector newQualitySelectorFromOrderedList(
    List<Quality> qualities, {
    FallbackStrategy? fallbackStrategy,
  }) => throw UnimplementedError();

  @override
  BarcodeScannerOptions newBarcodeScannerOptions({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptions? zoomSuggestionOptions,
  }) => throw UnimplementedError();

  @override
  FaceDetectorOptions newFaceDetectorOptions({
    bool? enableTracking,
    FaceDetectorOptionsClassificationMode? classificationMode,
    FaceDetectorOptionsContourMode? contourMode,
    FaceDetectorOptionsLandmarkMode? landmarkMode,
    double? minFaceSize,
    FaceDetectorOptionsPerformanceMode? performanceMode,
  }) => throw UnimplementedError();

  @override
  ZoomSuggestionOptions newZoomSuggestionOptions(
    ZoomSuggestionOptionsZoomCallback zoomCallback, {
    double? maxSupportedZoomRatio,
  }) => throw UnimplementedError();

  @override
  FileOutputOptions newFileOutputOptions(
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
  SurfaceOrientedMeteringPointFactory newSurfaceOrientedMeteringPointFactory(
    width,
    height,
  ) => SurfaceOrientedMeteringPointFactoryImpl(width, height);

  @override
  FocusMeteringAction newFocusMeteringAction(
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
  ImageAnalyzer newImageAnalyzer({
    required void Function(ImageProxy image) analyze,
  }) => ImageAnalyzerImpl(analyze: analyze);

  @override
  Camera2CameraControl newCamera2CameraControlFrom(
    CameraControl cameraControl,
  ) => throw UnimplementedError();

  @override
  Camera2CameraInfo newCamera2CameraInfoFrom(CameraInfo cameraInfo) =>
      throw UnimplementedError();

  @override
  CaptureRequestOptions newCaptureRequestOptions({
    CameraMetadataControlMode? mode,
    CameraMetadataControlAeMode? aeMode,
    CameraMetadataControlAfMode? afMode,
    CameraMetadataControlAwbMode? awbMode,
    int? sensorExposureTime,
  }) => throw UnimplementedError();

  @override
  AVAnalyzer newAVAnalyzer({
    List<AVMetadataObjectType>? types,
    required Consumer<AVAnalyzerResult> consumer,
  }) => AVAnalyzerImpl(types: types, consumer: consumer);

  @override
  Observer<CameraState> newCameraStateObserver({
    required void Function(CameraState value) onChanged,
  }) => CameraStateObserverImpl(onChanged: onChanged);

  @override
  ImageCaptureOnImageCapturedCallback newImageCaptureOnImageCapturedCallback({
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
  Consumer<MlKitAnalyzerResult> newMlKitAnalyzerResultConsumer({
    required void Function(MlKitAnalyzerResult value) accept,
  }) => throw UnimplementedError();

  @override
  ResolutionFilter newResolutionFilter({
    required List<Size<int>> Function(
      List<Size<int>> supportedSizes,
      int rotationDegrees,
    )
    filter,
  }) => throw UnimplementedError();

  @override
  RotationProvider newRotationProvider() => RotationProviderImpl();

  @override
  RotationProviderListener newRotationProviderListener({
    required void Function(int rotation) onRotationChanged,
  }) => RotationProviderListenerImpl(onRotationChanged: onRotationChanged);

  @override
  Observer<TorchState> newTorchStateObserver({
    required void Function(TorchState value) onChanged,
  }) => TorchStateObserverImpl(onChanged: onChanged);

  @override
  Consumer<VideoRecordEvent> newVideoRecordEventConsumer({
    required void Function(VideoRecordEvent value) accept,
  }) => VideoRecordEventConsumerImpl(accept: accept);

  @override
  Observer<ZoomState> newZoomStateObserver({
    required void Function(ZoomState value) onChanged,
  }) => ZoomStateObserverImpl(onChanged: onChanged);

  @override
  ZoomSuggestionOptionsZoomCallback newZoomSuggestionOptionsZoomCallback({
    required bool Function(double zoomRatio) setZoom,
  }) => throw UnimplementedError();

  @override
  Future<BarcodeScanner> $BarcodeScanningGetClient([
    BarcodeScannerOptions? options,
  ]) => throw UnimplementedError();

  @override
  Future<FaceDetector> $FaceDetectionGetClient([
    FaceDetectorOptions? options,
  ]) => throw UnimplementedError();

  @override
  Location newLocation(double latitude, double longitude) =>
      LocationImpl(latitude, longitude);

  @override
  Consumer<AVAnalyzerResult> newAVAnalyzerResultConsumer({
    required void Function(AVAnalyzerResult value) accept,
  }) => AVAnalyzerResultConsumerImpl(accept: accept);
}
