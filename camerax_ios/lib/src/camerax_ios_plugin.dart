import 'dart:io';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class CameraXiOSPlugin extends CameraXPlugin {
  static void registerWith() {
    CameraXPlugin.instance = CameraXiOSPlugin();
  }

  @override
  CameraSelector newBackCameraSelector() {
    // TODO: implement getBackCameraSelector
    throw UnimplementedError();
  }

  @override
  CameraSelector newExternalCameraSelector() {
    // TODO: implement getExternalCameraSelector
    throw UnimplementedError();
  }

  @override
  CameraSelector newFrontCameraSelector() {
    // TODO: implement getFrontCameraSelector
    throw UnimplementedError();
  }

  @override
  Future<Size?> getResolution(CameraInfo cameraInfo, Quality quality) {
    // TODO: implement getResolution
    throw UnimplementedError();
  }

  @override
  BarcodeScanner newBarcodeScanner({BarcodeScannerOptions? options}) {
    // TODO: implement newBarcodeScanner
    throw UnimplementedError();
  }

  @override
  BarcodeScannerOptions newBarcodeScannerOptions(
      {bool? enableAllPotentialBarcodes,
      List<BarcodeFormat>? formats,
      ZoomSuggestionOptions? zoomSuggestionOptions}) {
    // TODO: implement newBarcodeScannerOptions
    throw UnimplementedError();
  }

  @override
  Camera2CameraControl newCamera2CameraControlFrom(
      CameraControl cameraControl) {
    // TODO: implement newCamera2CameraControlFrom
    throw UnimplementedError();
  }

  @override
  Camera2CameraInfo newCamera2CameraInfoFrom(CameraInfo cameraInfo) {
    // TODO: implement newCamera2CameraInfoFrom
    throw UnimplementedError();
  }

  @override
  CameraController newCameraController() {
    // TODO: implement newCameraController
    throw UnimplementedError();
  }

  @override
  CameraSelector newCameraSelector({LensFacing? lensFacing}) {
    // TODO: implement newCameraSelector
    throw UnimplementedError();
  }

  @override
  CaptureRequestOptions newCaptureRequestOptions(
      {ControlMode? mode,
      ControlAeMode? aeMode,
      ControlAfMode? afMode,
      ControlAwbMode? awbMode,
      int? sensorExposureTime}) {
    // TODO: implement newCaptureRequestOptions
    throw UnimplementedError();
  }

  @override
  FaceDetector newFaceDetector({FaceDetectorOptions? options}) {
    // TODO: implement newFaceDetector
    throw UnimplementedError();
  }

  @override
  FaceDetectorOptions newFaceDetectorOptions(
      {bool? enableTracking,
      FaceClassificationMode? classificationMode,
      FaceContourMode? contourMode,
      FaceLandmarkMode? landmarkMode,
      double? minFaceSize,
      FacePerformanceMode? performanceMode}) {
    // TODO: implement newFaceDetectorOptions
    throw UnimplementedError();
  }

  @override
  FallbackStrategy newFallbackStrategyHigherQualityOrLowerThan(
      Quality quality) {
    // TODO: implement newFallbackStrategyHigherQualityOrLowerThan
    throw UnimplementedError();
  }

  @override
  FallbackStrategy newFallbackStrategyHigherQualityThan(Quality quality) {
    // TODO: implement newFallbackStrategyHigherQualityThan
    throw UnimplementedError();
  }

  @override
  FallbackStrategy newFallbackStrategyLowerQualityOrHigherThan(
      Quality quality) {
    // TODO: implement newFallbackStrategyLowerQualityOrHigherThan
    throw UnimplementedError();
  }

  @override
  FallbackStrategy newFallbackStrategyLowerQualityThan(Quality quality) {
    // TODO: implement newFallbackStrategyLowerQualityThan
    throw UnimplementedError();
  }

  @override
  FileOutputOptions newFileOutputOptions(
      {required File file,
      Duration? durationLimit,
      int? fileSizeLimitBytes,
      Location? location}) {
    // TODO: implement newFileOutputOptions
    throw UnimplementedError();
  }

  @override
  FocusMeteringAction newFocusMeteringAction(
      (MeteringPoint, List<MeteringMode>) first,
      {List<(MeteringPoint, List<MeteringMode>)>? others,
      bool? disableAutoCancel,
      Duration? autoCancelDuration}) {
    // TODO: implement newFocusMeteringAction
    throw UnimplementedError();
  }

  @override
  ImageAnalyzer newImageAnalyzer({required ImageProxyCallback analyze}) {
    // TODO: implement newImageAnalyzer
    throw UnimplementedError();
  }

  @override
  JpegAnalyzer newJpegAnalyzer(
      {required CoordinateSystem targetCoordinateSystem,
      required JpegConsumer consumer}) {
    // TODO: implement newJpegAnalyzer
    throw UnimplementedError();
  }

  @override
  MlKitAnalyzer newMlKitAnalyzer(
      {required List<Detector> detectors,
      required CoordinateSystem targetCoordinateSystem,
      required MlKitAnalyzerResultConsumer consumer}) {
    // TODO: implement newMlKitAnalyzer
    throw UnimplementedError();
  }

  @override
  OutputFileOptions newOutputFileOptions(
      {required File file, Metadata? metadata}) {
    // TODO: implement newOutputFileOptions
    throw UnimplementedError();
  }

  @override
  PermissionManager newPermissionManager() {
    // TODO: implement newPermissionManager
    throw UnimplementedError();
  }

  @override
  PreviewView newPreviewView() {
    // TODO: implement newPreviewView
    throw UnimplementedError();
  }

  @override
  QualitySelector newQualitySelectorFrom(Quality quality,
      {FallbackStrategy? fallbackStrategy}) {
    // TODO: implement newQualitySelectorFrom
    throw UnimplementedError();
  }

  @override
  QualitySelector newQualitySelectorFromOrderedList(List<Quality> qualities,
      {FallbackStrategy? fallbackStrategy}) {
    // TODO: implement newQualitySelectorFromOrderedList
    throw UnimplementedError();
  }

  @override
  SurfaceOrientedMeteringPointFactory newSurfaceOrientedMeteringPointFactory(
      double width, double height) {
    // TODO: implement newSurfaceOrientedMeteringPointFactory
    throw UnimplementedError();
  }

  @override
  ZoomSuggestionOptions newZoomSuggestionOptions(
      {required ZoomCallback zoomCallback, double? maxSupportedZoomRatio}) {
    // TODO: implement newZoomSuggestionOptions
    throw UnimplementedError();
  }
}
