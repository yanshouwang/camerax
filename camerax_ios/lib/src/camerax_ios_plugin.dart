import 'dart:io';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';

// import 'camera2.dart';
import 'common.dart';
import 'core.dart';
// import 'ml.dart';
import 'video.dart';
import 'view.dart';

final class CameraXiOSPlugin extends CameraXPlugin {
  static void registerWith() {
    CameraXPlugin.instance = CameraXiOSPlugin();
  }

  @override
  PermissionManager newPermissionManager() => PermissionManagerImpl();

  @override
  CameraSelector newFrontCameraSelector() => CameraSelectorImpl.front;
  @override
  CameraSelector newBackCameraSelector() => CameraSelectorImpl.back;
  @override
  CameraSelector newExternalCameraSelector() => CameraSelectorImpl.external;
  @override
  CameraSelector newCameraSelector({
    LensFacing? lensFacing,
  }) =>
      CameraSelectorImpl(
        lensFacing: lensFacing,
      );

  @override
  CameraController newCameraController() => CameraControllerImpl();

  @override
  PreviewView newPreviewView() => PreviewViewImpl();

  @override
  FallbackStrategy newFallbackStrategyHigherQualityOrLowerThan(
          Quality quality) =>
      throw UnimplementedError();
  // FallbackStrategyImpl.higherQualityOrLowerThan(quality);
  @override
  FallbackStrategy newFallbackStrategyHigherQualityThan(Quality quality) =>
      throw UnimplementedError();
  // FallbackStrategyImpl.higherQualityThan(quality);
  @override
  FallbackStrategy newFallbackStrategyLowerQualityOrHigherThan(
          Quality quality) =>
      throw UnimplementedError();
  // FallbackStrategyImpl.lowerQualityOrHigherThan(quality);
  @override
  FallbackStrategy newFallbackStrategyLowerQualityThan(Quality quality) =>
      throw UnimplementedError();
  // FallbackStrategyImpl.lowerQualityThan(quality);

  @override
  MlKitAnalyzer newMlKitAnalyzer({
    required List<Detector> detectors,
    required CoordinateSystem targetCoordinateSystem,
    required MlKitAnalyzerResultConsumer consumer,
  }) =>
      throw UnimplementedError();
  // MlKitAnalyzerImpl(
  //   detectors: detectors,
  //   targetCoordinateSystem: targetCoordinateSystem,
  //   consumer: consumer,
  // );

  @override
  QualitySelector newQualitySelectorFrom(
    Quality quality, {
    FallbackStrategy? fallbackStrategy,
  }) =>
      throw UnimplementedError();
  // QualitySelectorImpl.from(
  //   quality,
  //   fallbackStrategy: fallbackStrategy,
  // );

  @override
  QualitySelector newQualitySelectorFromOrderedList(
    List<Quality> qualities, {
    FallbackStrategy? fallbackStrategy,
  }) =>
      throw UnimplementedError();
  // QualitySelectorImpl.fromOrderedList(
  //   qualities,
  //   fallbackStrategy: fallbackStrategy,
  // );

  @override
  Future<Size?> getResolution(CameraInfo cameraInfo, Quality quality) =>
      throw UnimplementedError();
  // QualitySelectorImpl.getResolution(cameraInfo, quality);

  @override
  BarcodeScanner newBarcodeScanner({
    BarcodeScannerOptions? options,
  }) =>
      throw UnimplementedError();
  // BarcodeScannerImpl(
  //   options: options,
  // );

  @override
  BarcodeScannerOptions newBarcodeScannerOptions({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptions? zoomSuggestionOptions,
  }) =>
      throw UnimplementedError();
  // BarcodeScannerOptionsImpl(
  //   enableAllPotentialBarcodes: enableAllPotentialBarcodes,
  //   formats: formats,
  //   zoomSuggestionOptions: zoomSuggestionOptions,
  // );

  @override
  FaceDetector newFaceDetector({
    FaceDetectorOptions? options,
  }) =>
      throw UnimplementedError();
  // FaceDetectorImpl(
  //   options: options,
  // );

  @override
  FaceDetectorOptions newFaceDetectorOptions({
    bool? enableTracking,
    FaceClassificationMode? classificationMode,
    FaceContourMode? contourMode,
    FaceLandmarkMode? landmarkMode,
    double? minFaceSize,
    FacePerformanceMode? performanceMode,
  }) =>
      throw UnimplementedError();
  // FaceDetectorOptionsImpl(
  //   enableTracking: enableTracking,
  //   classificationMode: classificationMode,
  //   contourMode: contourMode,
  //   landmarkMode: landmarkMode,
  //   minFaceSize: minFaceSize,
  //   performanceMode: performanceMode,
  // );

  @override
  ZoomSuggestionOptions newZoomSuggestionOptions({
    required ZoomCallback zoomCallback,
    double? maxSupportedZoomRatio,
  }) =>
      throw UnimplementedError();
  // ZoomSuggestionOptionsImpl(
  //   zoomCallback: zoomCallback,
  //   maxSupportedZoomRatio: maxSupportedZoomRatio,
  // );

  @override
  FileOutputOptions newFileOutputOptions({
    required File file,
    Duration? durationLimit,
    int? fileSizeLimitBytes,
    Location? location,
  }) =>
      FileOutputOptionsImpl(
        file: file,
        durationLimit: durationLimit,
        fileSizeLimitBytes: fileSizeLimitBytes,
        location: location,
      );

  @override
  OutputFileOptions newOutputFileOptions({
    required File file,
    Metadata? metadata,
  }) =>
      OutputFileOptionsImpl(
        file: file,
        metadata: metadata,
      );

  @override
  SurfaceOrientedMeteringPointFactory newSurfaceOrientedMeteringPointFactory(
          width, height) =>
      throw UnimplementedError();
  // SurfaceOrientedMeteringPointFactoryImpl(width, height);

  @override
  FocusMeteringAction newFocusMeteringAction(
    (MeteringPoint, List<MeteringMode>) first, {
    List<(MeteringPoint, List<MeteringMode>)>? others,
    bool? disableAutoCancel,
    Duration? autoCancelDuration,
  }) =>
      throw UnimplementedError();
  // FocusMeteringActionImpl(
  //   first,
  //   others: others,
  //   disableAutoCancel: disableAutoCancel,
  //   autoCancelDuration: autoCancelDuration,
  // );

  @override
  ImageAnalyzer newImageAnalyzer({
    required ImageProxyCallback analyze,
  }) =>
      ImageAnalyzerImpl(
        analyze: analyze,
      );

  @override
  JpegAnalyzer newJpegAnalyzer({
    required CoordinateSystem targetCoordinateSystem,
    required JpegConsumer consumer,
  }) =>
      throw UnimplementedError();
  // JpegAnalyzerImpl(
  //   targetCoordinateSystem: targetCoordinateSystem,
  //   consumer: consumer,
  // );

  @override
  Camera2CameraControl newCamera2CameraControlFrom(
          CameraControl cameraControl) =>
      throw UnimplementedError();
  // Camera2CameraControlImpl.from(cameraControl);

  @override
  Camera2CameraInfo newCamera2CameraInfoFrom(CameraInfo cameraInfo) =>
      throw UnimplementedError();
  // Camera2CameraInfoImpl.from(cameraInfo);

  @override
  CaptureRequestOptions newCaptureRequestOptions({
    ControlMode? mode,
    ControlAeMode? aeMode,
    ControlAfMode? afMode,
    ControlAwbMode? awbMode,
    int? sensorExposureTime,
  }) =>
      throw UnimplementedError();
  // CaptureRequestOptionsImpl(
  //   mode: mode,
  //   aeMode: aeMode,
  //   afMode: afMode,
  //   awbMode: awbMode,
  //   sensorExposureTime: sensorExposureTime,
  // );
}
