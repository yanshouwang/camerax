import 'dart:io';

import 'package:camerax_android/src/legacy/ml.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'common.dart';
import 'core.dart';
import 'video.dart';
import 'view.dart';

final class CameraX extends $base.CameraX {
  @override
  $base.PermissionManager createPermissionManager() {
    return PermissionManager();
  }

  @override
  $base.CameraSelector getFrontCameraSelector() {
    return CameraSelector.front;
  }

  @override
  $base.CameraSelector getBackCameraSelector() {
    return CameraSelector.back;
  }

  @override
  $base.CameraSelector getExternalCameraSelector() {
    return CameraSelector.external;
  }

  @override
  $base.CameraSelector createCameraSelector({
    $base.LensFacing? lensFacing,
  }) {
    return CameraSelector(
      lensFacing: lensFacing,
    );
  }

  @override
  $base.CameraController createCameraController() {
    return CameraController();
  }

  @override
  $base.PreviewView createPreviewView() {
    return PreviewView();
  }

  @override
  $base.FallbackStrategy createFallbackStrategyHigherQualityOrLowerThan(
      $base.Quality quality) {
    return FallbackStrategy.higherQualityOrLowerThan(quality);
  }

  @override
  $base.FallbackStrategy createFallbackStrategyHigherQualityThan(
      $base.Quality quality) {
    return FallbackStrategy.higherQualityThan(quality);
  }

  @override
  $base.FallbackStrategy createFallbackStrategyLowerQualityOrHigherThan(
      $base.Quality quality) {
    return FallbackStrategy.lowerQualityOrHigherThan(quality);
  }

  @override
  $base.FallbackStrategy createFallbackStrategyLowerQualityThan(
      $base.Quality quality) {
    return FallbackStrategy.lowerQualityThan(quality);
  }

  @override
  $base.MlKitAnalyzer createMlKitAnalyzer({
    required List<$base.Detector> detectors,
    required $base.CoordinateSystem targetCoordinateSystem,
    required $base.MlKitAnalyzerResultConsumer consumer,
  }) {
    return MlKitAnalyzer(
      detectors: detectors,
      targetCoordinateSystem: targetCoordinateSystem,
      consumer: consumer,
    );
  }

  @override
  $base.QualitySelector createQualitySelectorFrom(
    $base.Quality quality, {
    $base.FallbackStrategy? fallbackStrategy,
  }) {
    return QualitySelector.from(
      quality,
      fallbackStrategy: fallbackStrategy,
    );
  }

  @override
  $base.QualitySelector createQualitySelectorFromOrderedList(
    List<$base.Quality> qualities, {
    $base.FallbackStrategy? fallbackStrategy,
  }) {
    return QualitySelector.fromOrderedList(
      qualities,
      fallbackStrategy: fallbackStrategy,
    );
  }

  @override
  Future<$base.Size?> getResolution(
      $base.CameraInfo cameraInfo, $base.Quality quality) async {
    final size = await QualitySelector.getResolution(cameraInfo, quality);
    return size;
  }

  @override
  $base.BarcodeScanner createBarcodeScanner({
    $base.BarcodeScannerOptions? options,
  }) {
    return BarcodeScanner(
      options: options,
    );
  }

  @override
  $base.BarcodeScannerOptions createBarcodeScannerOptions({
    bool? enableAllPotentialBarcodes,
    List<$base.BarcodeFormat>? formats,
    $base.ZoomSuggestionOptions? zoomSuggestionOptions,
  }) {
    return BarcodeScannerOptions(
      enableAllPotentialBarcodes: enableAllPotentialBarcodes,
      formats: formats,
      zoomSuggestionOptions: zoomSuggestionOptions,
    );
  }

  @override
  $base.FaceDetector createFaceDetector({
    $base.FaceDetectorOptions? options,
  }) {
    return FaceDetector(
      options: options,
    );
  }

  @override
  $base.FaceDetectorOptions createFaceDetectorOptions({
    bool? enableTracking,
    $base.FaceClassificationMode? classificationMode,
    $base.FaceContourMode? contourMode,
    $base.FaceLandmarkMode? landmarkMode,
    double? minFaceSize,
    $base.FacePerformanceMode? performanceMode,
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
  $base.ZoomSuggestionOptions createZoomSuggestionOptions({
    required $base.ZoomCallback zoomCallback,
    double? maxSupportedZoomRatio,
  }) {
    return ZoomSuggestionOptions(
      zoomCallback: zoomCallback,
      maxSupportedZoomRatio: maxSupportedZoomRatio,
    );
  }

  @override
  $base.FileOutputOptions createFileOutputOptions({
    required File file,
    Duration? durationLimit,
    int? fileSizeLimitBytes,
    $base.Location? location,
  }) {
    return FileOutputOptions(
      file: file,
      durationLimit: durationLimit,
      fileSizeLimitBytes: fileSizeLimitBytes,
      location: location,
    );
  }

  @override
  $base.OutputFileOptions createOutputFileOptions({
    required File file,
    $base.Metadata? metadata,
  }) {
    return OutputFileOptions(
      file: file,
      metadata: metadata,
    );
  }

  @override
  $base.SurfaceOrientedMeteringPointFactory
      createSurfaceOrientedMeteringPointFactory(width, height) {
    return SurfaceOrientedMeteringPointFactory(width, height);
  }

  @override
  $base.FocusMeteringAction createFocusMeteringAction(
    ($base.MeteringPoint, List<$base.MeteringMode>) first, {
    List<($base.MeteringPoint, List<$base.MeteringMode>)>? others,
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
}
