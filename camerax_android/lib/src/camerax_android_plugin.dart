import 'dart:io';

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
  PermissionManager newPermissionManager() {
    return PermissionManagerImpl();
  }

  @override
  CameraSelector newFrontCameraSelector() {
    return CameraSelectorImpl.front;
  }

  @override
  CameraSelector newBackCameraSelector() {
    return CameraSelectorImpl.back;
  }

  @override
  CameraSelector newExternalCameraSelector() {
    return CameraSelectorImpl.external;
  }

  @override
  CameraSelector newCameraSelector({
    LensFacing? lensFacing,
  }) {
    return CameraSelectorImpl(
      lensFacing: lensFacing,
    );
  }

  @override
  CameraController newCameraController() {
    return CameraControllerImpl();
  }

  @override
  PreviewView newPreviewView() {
    return PreviewViewImpl();
  }

  @override
  FallbackStrategy newFallbackStrategyHigherQualityOrLowerThan(
      Quality quality) {
    return FallbackStrategyImpl.higherQualityOrLowerThan(quality);
  }

  @override
  FallbackStrategy newFallbackStrategyHigherQualityThan(Quality quality) {
    return FallbackStrategyImpl.higherQualityThan(quality);
  }

  @override
  FallbackStrategy newFallbackStrategyLowerQualityOrHigherThan(
      Quality quality) {
    return FallbackStrategyImpl.lowerQualityOrHigherThan(quality);
  }

  @override
  FallbackStrategy newFallbackStrategyLowerQualityThan(Quality quality) {
    return FallbackStrategyImpl.lowerQualityThan(quality);
  }

  @override
  MlKitAnalyzer newMlKitAnalyzer({
    required List<Detector> detectors,
    required CoordinateSystem targetCoordinateSystem,
    required MlKitAnalyzerResultConsumer consumer,
  }) {
    return MlKitAnalyzerImpl(
      detectors: detectors,
      targetCoordinateSystem: targetCoordinateSystem,
      consumer: consumer,
    );
  }

  @override
  QualitySelector newQualitySelectorFrom(
    Quality quality, {
    FallbackStrategy? fallbackStrategy,
  }) {
    return QualitySelectorImpl.from(
      quality,
      fallbackStrategy: fallbackStrategy,
    );
  }

  @override
  QualitySelector newQualitySelectorFromOrderedList(
    List<Quality> qualities, {
    FallbackStrategy? fallbackStrategy,
  }) {
    return QualitySelectorImpl.fromOrderedList(
      qualities,
      fallbackStrategy: fallbackStrategy,
    );
  }

  @override
  Future<Size?> getResolution(CameraInfo cameraInfo, Quality quality) async {
    final size = await QualitySelectorImpl.getResolution(cameraInfo, quality);
    return size;
  }

  @override
  BarcodeScanner newBarcodeScanner({
    BarcodeScannerOptions? options,
  }) {
    return BarcodeScannerImpl(
      options: options,
    );
  }

  @override
  BarcodeScannerOptions newBarcodeScannerOptions({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptions? zoomSuggestionOptions,
  }) {
    return BarcodeScannerOptionsImpl(
      enableAllPotentialBarcodes: enableAllPotentialBarcodes,
      formats: formats,
      zoomSuggestionOptions: zoomSuggestionOptions,
    );
  }

  @override
  FaceDetector newFaceDetector({
    FaceDetectorOptions? options,
  }) {
    return FaceDetectorImpl(
      options: options,
    );
  }

  @override
  FaceDetectorOptions newFaceDetectorOptions({
    bool? enableTracking,
    FaceClassificationMode? classificationMode,
    FaceContourMode? contourMode,
    FaceLandmarkMode? landmarkMode,
    double? minFaceSize,
    FacePerformanceMode? performanceMode,
  }) {
    return FaceDetectorOptionsImpl(
      enableTracking: enableTracking,
      classificationMode: classificationMode,
      contourMode: contourMode,
      landmarkMode: landmarkMode,
      minFaceSize: minFaceSize,
      performanceMode: performanceMode,
    );
  }

  @override
  ZoomSuggestionOptions newZoomSuggestionOptions({
    required ZoomCallback zoomCallback,
    double? maxSupportedZoomRatio,
  }) {
    return ZoomSuggestionOptionsImpl(
      zoomCallback: zoomCallback,
      maxSupportedZoomRatio: maxSupportedZoomRatio,
    );
  }

  @override
  FileOutputOptions newFileOutputOptions({
    required File file,
    Duration? durationLimit,
    int? fileSizeLimitBytes,
    Location? location,
  }) {
    return FileOutputOptionsImpl(
      file: file,
      durationLimit: durationLimit,
      fileSizeLimitBytes: fileSizeLimitBytes,
      location: location,
    );
  }

  @override
  OutputFileOptions newOutputFileOptions({
    required File file,
    Metadata? metadata,
  }) {
    return OutputFileOptionsImpl(
      file: file,
      metadata: metadata,
    );
  }

  @override
  SurfaceOrientedMeteringPointFactory newSurfaceOrientedMeteringPointFactory(
      width, height) {
    return SurfaceOrientedMeteringPointFactoryImpl(width, height);
  }

  @override
  FocusMeteringAction newFocusMeteringAction(
    (MeteringPoint, List<MeteringMode>) first, {
    List<(MeteringPoint, List<MeteringMode>)>? others,
    bool? disableAutoCancel,
    Duration? autoCancelDuration,
  }) {
    return FocusMeteringActionImpl(
      first,
      others: others,
      disableAutoCancel: disableAutoCancel,
      autoCancelDuration: autoCancelDuration,
    );
  }

  @override
  ImageAnalyzer newImageAnalyzer({
    required ImageProxyCallback analyze,
  }) {
    return ImageAnalyzerImpl(
      analyze: analyze,
    );
  }

  @override
  JpegAnalyzer newJpegAnalyzer({
    required CoordinateSystem targetCoordinateSystem,
    required JpegConsumer consumer,
  }) {
    return JpegAnalyzerImpl(
      targetCoordinateSystem: targetCoordinateSystem,
      consumer: consumer,
    );
  }

  @override
  Camera2CameraControl newCamera2CameraControlFrom(
      CameraControl cameraControl) {
    return Camera2CameraControlImpl.from(cameraControl);
  }

  @override
  Camera2CameraInfo newCamera2CameraInfoFrom(CameraInfo cameraInfo) {
    return Camera2CameraInfoImpl.from(cameraInfo);
  }

  @override
  CaptureRequestOptions newCaptureRequestOptions({
    ControlMode? mode,
    ControlAeMode? aeMode,
    ControlAfMode? afMode,
    ControlAwbMode? awbMode,
    int? sensorExposureTime,
  }) {
    return CaptureRequestOptionsImpl(
      mode: mode,
      aeMode: aeMode,
      afMode: afMode,
      awbMode: awbMode,
      sensorExposureTime: sensorExposureTime,
    );
  }
}
