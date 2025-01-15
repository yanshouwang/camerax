import 'dart:io';

import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

final class CameraX extends $interface.CameraX {
  @override
  $interface.BarcodeScanner createBarcodeScanner(
      {$interface.BarcodeScannerOptions? options}) {
    // TODO: implement createBarcodeScanner
    throw UnimplementedError();
  }

  @override
  $interface.BarcodeScannerOptions createBarcodeScannerOptions(
      {bool? enableAllPotentialBarcodes,
      List<$interface.BarcodeFormat>? formats,
      $interface.ZoomSuggestionOptions? zoomSuggestionOptions}) {
    // TODO: implement createBarcodeScannerOptions
    throw UnimplementedError();
  }

  @override
  $interface.CameraController createCameraController() {
    // TODO: implement createCameraController
    throw UnimplementedError();
  }

  @override
  $interface.CameraSelector createCameraSelector(
      {$interface.LensFacing? lensFacing}) {
    // TODO: implement createCameraSelector
    throw UnimplementedError();
  }

  @override
  $interface.FaceDetector createFaceDetector(
      {$interface.FaceDetectorOptions? options}) {
    // TODO: implement createFaceDetector
    throw UnimplementedError();
  }

  @override
  $interface.FaceDetectorOptions createFaceDetectorOptions(
      {bool? enableTracking,
      $interface.FaceClassificationMode? classificationMode,
      $interface.FaceContourMode? contourMode,
      $interface.FaceLandmarkMode? landmarkMode,
      double? minFaceSize,
      $interface.FacePerformanceMode? performanceMode}) {
    // TODO: implement createFaceDetectorOptions
    throw UnimplementedError();
  }

  @override
  $interface.FallbackStrategy createFallbackStrategyHigherQualityOrLowerThan(
      $interface.Quality quality) {
    // TODO: implement createFallbackStrategyHigherQualityOrLowerThan
    throw UnimplementedError();
  }

  @override
  $interface.FallbackStrategy createFallbackStrategyHigherQualityThan(
      $interface.Quality quality) {
    // TODO: implement createFallbackStrategyHigherQualityThan
    throw UnimplementedError();
  }

  @override
  $interface.FallbackStrategy createFallbackStrategyLowerQualityOrHigherThan(
      $interface.Quality quality) {
    // TODO: implement createFallbackStrategyLowerQualityOrHigherThan
    throw UnimplementedError();
  }

  @override
  $interface.FallbackStrategy createFallbackStrategyLowerQualityThan(
      $interface.Quality quality) {
    // TODO: implement createFallbackStrategyLowerQualityThan
    throw UnimplementedError();
  }

  @override
  $interface.FileOutputOptions createFileOutputOptions(
      {required File file,
      Duration? durationLimit,
      int? fileSizeLimitBytes,
      $interface.Location? location}) {
    // TODO: implement createFileOutputOptions
    throw UnimplementedError();
  }

  @override
  $interface.FocusMeteringAction createFocusMeteringAction(
      ($interface.MeteringPoint, List<$interface.MeteringMode>) first,
      {List<($interface.MeteringPoint, List<$interface.MeteringMode>)>? others,
      bool? disableAutoCancel,
      Duration? autoCancelDuration}) {
    // TODO: implement createFocusMeteringAction
    throw UnimplementedError();
  }

  @override
  $interface.MlKitAnalyzer createMlKitAnalyzer(
      {required List<$interface.Detector> detectors,
      required $interface.CoordinateSystem targetCoordinateSystem,
      required $interface.MlKitAnalyzerResultConsumer consumer}) {
    // TODO: implement createMlKitAnalyzer
    throw UnimplementedError();
  }

  @override
  $interface.OutputFileOptions createOutputFileOptions(
      {required File file, $interface.Metadata? metadata}) {
    // TODO: implement createOutputFileOptions
    throw UnimplementedError();
  }

  @override
  $interface.PermissionManager createPermissionManager() {
    // TODO: implement createPermissionManager
    throw UnimplementedError();
  }

  @override
  $interface.PreviewView createPreviewView() {
    // TODO: implement createPreviewView
    throw UnimplementedError();
  }

  @override
  $interface.QualitySelector createQualitySelectorFrom(
      $interface.Quality quality,
      {$interface.FallbackStrategy? fallbackStrategy}) {
    // TODO: implement createQualitySelectorFrom
    throw UnimplementedError();
  }

  @override
  $interface.QualitySelector createQualitySelectorFromOrderedList(
      List<$interface.Quality> qualities,
      {$interface.FallbackStrategy? fallbackStrategy}) {
    // TODO: implement createQualitySelectorFromOrderedList
    throw UnimplementedError();
  }

  @override
  $interface.SurfaceOrientedMeteringPointFactory
      createSurfaceOrientedMeteringPointFactory(double width, double height) {
    // TODO: implement createSurfaceOrientedMeteringPointFactory
    throw UnimplementedError();
  }

  @override
  $interface.ZoomSuggestionOptions createZoomSuggestionOptions(
      {required $interface.ZoomCallback zoomCallback,
      double? maxSupportedZoomRatio}) {
    // TODO: implement createZoomSuggestionOptions
    throw UnimplementedError();
  }

  @override
  $interface.CameraSelector getBackCameraSelector() {
    // TODO: implement getBackCameraSelector
    throw UnimplementedError();
  }

  @override
  $interface.CameraSelector getExternalCameraSelector() {
    // TODO: implement getExternalCameraSelector
    throw UnimplementedError();
  }

  @override
  $interface.CameraSelector getFrontCameraSelector() {
    // TODO: implement getFrontCameraSelector
    throw UnimplementedError();
  }

  @override
  Future<$interface.Size?> getResolution(
      $interface.CameraInfo cameraInfo, $interface.Quality quality) {
    // TODO: implement getResolution
    throw UnimplementedError();
  }
}
