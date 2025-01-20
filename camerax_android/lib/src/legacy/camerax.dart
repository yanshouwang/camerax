import 'dart:io';

import 'package:camerax_android/src/legacy/view/jpeg_analyzer.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

import 'common.dart';
import 'core.dart';
import 'ml.dart';
import 'video.dart';
import 'view.dart';

final class CameraX extends $interface.CameraX {
  @override
  $interface.PermissionManager createPermissionManager() {
    return PermissionManager();
  }

  @override
  $interface.CameraSelector getFrontCameraSelector() {
    return CameraSelector.front;
  }

  @override
  $interface.CameraSelector getBackCameraSelector() {
    return CameraSelector.back;
  }

  @override
  $interface.CameraSelector getExternalCameraSelector() {
    return CameraSelector.external;
  }

  @override
  $interface.CameraSelector createCameraSelector({
    $interface.LensFacing? lensFacing,
  }) {
    return CameraSelector(
      lensFacing: lensFacing,
    );
  }

  @override
  $interface.CameraController createCameraController() {
    return CameraController();
  }

  @override
  $interface.PreviewView createPreviewView() {
    return PreviewView();
  }

  @override
  $interface.FallbackStrategy createFallbackStrategyHigherQualityOrLowerThan(
      $interface.Quality quality) {
    return FallbackStrategy.higherQualityOrLowerThan(quality);
  }

  @override
  $interface.FallbackStrategy createFallbackStrategyHigherQualityThan(
      $interface.Quality quality) {
    return FallbackStrategy.higherQualityThan(quality);
  }

  @override
  $interface.FallbackStrategy createFallbackStrategyLowerQualityOrHigherThan(
      $interface.Quality quality) {
    return FallbackStrategy.lowerQualityOrHigherThan(quality);
  }

  @override
  $interface.FallbackStrategy createFallbackStrategyLowerQualityThan(
      $interface.Quality quality) {
    return FallbackStrategy.lowerQualityThan(quality);
  }

  @override
  $interface.MlKitAnalyzer createMlKitAnalyzer({
    required List<$interface.Detector> detectors,
    required $interface.CoordinateSystem targetCoordinateSystem,
    required $interface.MlKitAnalyzerResultConsumer consumer,
  }) {
    return MlKitAnalyzer(
      detectors: detectors,
      targetCoordinateSystem: targetCoordinateSystem,
      consumer: consumer,
    );
  }

  @override
  $interface.QualitySelector createQualitySelectorFrom(
    $interface.Quality quality, {
    $interface.FallbackStrategy? fallbackStrategy,
  }) {
    return QualitySelector.from(
      quality,
      fallbackStrategy: fallbackStrategy,
    );
  }

  @override
  $interface.QualitySelector createQualitySelectorFromOrderedList(
    List<$interface.Quality> qualities, {
    $interface.FallbackStrategy? fallbackStrategy,
  }) {
    return QualitySelector.fromOrderedList(
      qualities,
      fallbackStrategy: fallbackStrategy,
    );
  }

  @override
  Future<$interface.Size?> getResolution(
      $interface.CameraInfo cameraInfo, $interface.Quality quality) async {
    final size = await QualitySelector.getResolution(cameraInfo, quality);
    return size;
  }

  @override
  $interface.BarcodeScanner createBarcodeScanner({
    $interface.BarcodeScannerOptions? options,
  }) {
    return BarcodeScanner(
      options: options,
    );
  }

  @override
  $interface.BarcodeScannerOptions createBarcodeScannerOptions({
    bool? enableAllPotentialBarcodes,
    List<$interface.BarcodeFormat>? formats,
    $interface.ZoomSuggestionOptions? zoomSuggestionOptions,
  }) {
    return BarcodeScannerOptions(
      enableAllPotentialBarcodes: enableAllPotentialBarcodes,
      formats: formats,
      zoomSuggestionOptions: zoomSuggestionOptions,
    );
  }

  @override
  $interface.FaceDetector createFaceDetector({
    $interface.FaceDetectorOptions? options,
  }) {
    return FaceDetector(
      options: options,
    );
  }

  @override
  $interface.FaceDetectorOptions createFaceDetectorOptions({
    bool? enableTracking,
    $interface.FaceClassificationMode? classificationMode,
    $interface.FaceContourMode? contourMode,
    $interface.FaceLandmarkMode? landmarkMode,
    double? minFaceSize,
    $interface.FacePerformanceMode? performanceMode,
  }) {
    return FaceDetectorOptions(
      enableTracking: enableTracking,
      classificationMode: classificationMode,
      contourMode: contourMode,
      landmarkMode: landmarkMode,
      minFaceSize: minFaceSize,
      performanceMode: performanceMode,
    );
  }

  @override
  $interface.ZoomSuggestionOptions createZoomSuggestionOptions({
    required $interface.ZoomCallback zoomCallback,
    double? maxSupportedZoomRatio,
  }) {
    return ZoomSuggestionOptions(
      zoomCallback: zoomCallback,
      maxSupportedZoomRatio: maxSupportedZoomRatio,
    );
  }

  @override
  $interface.FileOutputOptions createFileOutputOptions({
    required File file,
    Duration? durationLimit,
    int? fileSizeLimitBytes,
    $interface.Location? location,
  }) {
    return FileOutputOptions(
      file: file,
      durationLimit: durationLimit,
      fileSizeLimitBytes: fileSizeLimitBytes,
      location: location,
    );
  }

  @override
  $interface.OutputFileOptions createOutputFileOptions({
    required File file,
    $interface.Metadata? metadata,
  }) {
    return OutputFileOptions(
      file: file,
      metadata: metadata,
    );
  }

  @override
  $interface.SurfaceOrientedMeteringPointFactory
      createSurfaceOrientedMeteringPointFactory(width, height) {
    return SurfaceOrientedMeteringPointFactory(width, height);
  }

  @override
  $interface.FocusMeteringAction createFocusMeteringAction(
    ($interface.MeteringPoint, List<$interface.MeteringMode>) first, {
    List<($interface.MeteringPoint, List<$interface.MeteringMode>)>? others,
    bool? disableAutoCancel,
    Duration? autoCancelDuration,
  }) {
    return FocusMeteringAction(
      first,
      others: others,
      disableAutoCancel: disableAutoCancel,
      autoCancelDuration: autoCancelDuration,
    );
  }

  @override
  $interface.ImageAnalyzer createImageAnalyzer({
    required $interface.ImageProxyCallback analyze,
  }) {
    return ImageAnalyzer(
      analyze: analyze,
    );
  }

  @override
  $interface.JpegAnalyzer createJpegAnalyzer({
    required $interface.CoordinateSystem targetCoordinateSystem,
    required $interface.JpegConsumer consumer,
  }) {
    return JpegAnalyzer(
      targetCoordinateSystem: targetCoordinateSystem,
      consumer: consumer,
    );
  }
}
