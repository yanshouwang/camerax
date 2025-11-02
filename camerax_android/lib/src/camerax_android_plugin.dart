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
  ) => FallbackStrategyImpl.higherQualityOrLowerThan(quality);
  @override
  FallbackStrategy newFallbackStrategyHigherQualityThan(Quality quality) =>
      FallbackStrategyImpl.higherQualityThan(quality);
  @override
  FallbackStrategy newFallbackStrategyLowerQualityOrHigherThan(
    Quality quality,
  ) => FallbackStrategyImpl.lowerQualityOrHigherThan(quality);
  @override
  FallbackStrategy newFallbackStrategyLowerQualityThan(Quality quality) =>
      FallbackStrategyImpl.lowerQualityThan(quality);

  @override
  MlKitAnalyzer newMlKitAnalyzer({
    required List<Detector> detectors,
    required ImageAnalysisCoordinateSystem targetCoordinateSystem,
    required Consumer<MlKitAnalyzerResult> consumer,
  }) => MlKitAnalyzerImpl(
    detectors: detectors,
    targetCoordinateSystem: targetCoordinateSystem,
    consumer: consumer,
  );

  @override
  Future<Size<int>?> $QualitySelectorGetResolution(
    CameraInfo cameraInfo,
    Quality quality,
  ) => QualitySelectorImpl.getResolution(cameraInfo, quality);

  @override
  QualitySelector newQualitySelectorFrom(
    Quality quality, {
    FallbackStrategy? fallbackStrategy,
  }) => QualitySelectorImpl.from(quality, fallbackStrategy: fallbackStrategy);

  @override
  QualitySelector newQualitySelectorFromOrderedList(
    List<Quality> qualities, {
    FallbackStrategy? fallbackStrategy,
  }) => QualitySelectorImpl.fromOrderedList(
    qualities,
    fallbackStrategy: fallbackStrategy,
  );

  @override
  BarcodeScanner newBarcodeScanner({BarcodeScannerOptions? options}) =>
      BarcodeScannerImpl(options: options);

  @override
  BarcodeScannerOptions newBarcodeScannerOptions({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptions? zoomSuggestionOptions,
  }) => BarcodeScannerOptionsImpl(
    enableAllPotentialBarcodes: enableAllPotentialBarcodes,
    formats: formats,
    zoomSuggestionOptions: zoomSuggestionOptions,
  );

  @override
  FaceDetector newFaceDetector({FaceDetectorOptions? options}) =>
      FaceDetectorImpl(options: options);

  @override
  FaceDetectorOptions newFaceDetectorOptions({
    bool? enableTracking,
    FaceClassificationMode? classificationMode,
    FaceContourMode? contourMode,
    FaceLandmarkMode? landmarkMode,
    double? minFaceSize,
    FacePerformanceMode? performanceMode,
  }) => FaceDetectorOptionsImpl(
    enableTracking: enableTracking,
    classificationMode: classificationMode,
    contourMode: contourMode,
    landmarkMode: landmarkMode,
    minFaceSize: minFaceSize,
    performanceMode: performanceMode,
  );

  @override
  ZoomSuggestionOptions newZoomSuggestionOptions({
    required ZoomSuggestionOptionsZoomCallback zoomCallback,
    double? maxSupportedZoomRatio,
  }) => ZoomSuggestionOptionsImpl(
    zoomCallback: zoomCallback,
    maxSupportedZoomRatio: maxSupportedZoomRatio,
  );

  @override
  FileOutputOptions newFileOutputOptions({
    required File file,
    Duration? durationLimit,
    int? fileSizeLimitBytes,
    Location? location,
  }) => FileOutputOptionsImpl(
    file: file,
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
    (MeteringPoint, List<MeteringMode>) first, {
    List<(MeteringPoint, List<MeteringMode>)>? others,
    bool? disableAutoCancel,
    Duration? autoCancelDuration,
  }) => FocusMeteringActionImpl(
    first,
    others: others,
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
  ) => Camera2CameraControlImpl.from(cameraControl);

  @override
  Camera2CameraInfo newCamera2CameraInfoFrom(CameraInfo cameraInfo) =>
      Camera2CameraInfoImpl.from(cameraInfo);

  @override
  CaptureRequestOptions newCaptureRequestOptions({
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
  AVAnalyzer newAVAnalyzer({
    List<AVMetadataObjectType>? types,
    required Consumer<AVAnalyzerResult> consumer,
  }) => throw UnimplementedError();

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
  }) => ImageCaptureOnImageCapturedCallback(
    onCaptureStarted: onCaptureStarted,
    onCaptureProcessProgressed: onCaptureProcessProgressed,
    onPostviewBitmapAvailable: onPostviewBitmapAvailable,
    onCaptureSuccess: onCaptureSuccess,
    onError: onError,
  );

  @override
  Consumer<MlKitAnalyzerResult> newMlKitAnalyzerResultConsumer({
    required void Function(MlKitAnalyzerResult value) accept,
  }) => MlKitAnalyzerResultConsumerImpl(accept: accept);

  @override
  ResolutionFilter newResolutionFilter({
    required List<Size<int>> Function(
      List<Size<int>> supportedSizes,
      int rotationDegrees,
    )
    filter,
  }) => ResolutionFilterImpl(filter: filter);

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
  }) => ZoomSuggestionOptionsZoomCallbackImpl(setZoom: setZoom);
}
