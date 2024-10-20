import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class CameraXLinuxPlugin extends CameraXPlugin {
  static void registerWith() {
    CameraXPlugin.instance = CameraXLinuxPlugin();
  }

  @override
  CameraController createCameraController() {
    // TODO: implement createCameraController
    throw UnimplementedError();
  }

  @override
  CameraSelector createCameraSelector({LensFacing? lensFacing}) {
    // TODO: implement createCameraSelector
    throw UnimplementedError();
  }

  @override
  FallbackStrategy createFallbackStrategyHigherQualityOrLowerThan(
      Quality quality) {
    // TODO: implement createFallbackStrategyHigherQualityOrLowerThan
    throw UnimplementedError();
  }

  @override
  FallbackStrategy createFallbackStrategyHigherQualityThan(Quality quality) {
    // TODO: implement createFallbackStrategyHigherQualityThan
    throw UnimplementedError();
  }

  @override
  FallbackStrategy createFallbackStrategyLowerQualityOrHigherThan(
      Quality quality) {
    // TODO: implement createFallbackStrategyLowerQualityOrHigherThan
    throw UnimplementedError();
  }

  @override
  FallbackStrategy createFallbackStrategyLowerQualityThan(Quality quality) {
    // TODO: implement createFallbackStrategyLowerQualityThan
    throw UnimplementedError();
  }

  @override
  MLAnalyzer createMLAnalyzer(
      {required List<MLObjectType> types,
      required CoordinateSystem targetCoordinateSystem,
      required MLObjectsCallback onAnalyzed}) {
    // TODO: implement createMLAnalyzer
    throw UnimplementedError();
  }

  @override
  PreviewViewController createPreviewViewController() {
    // TODO: implement createPreviewViewController
    throw UnimplementedError();
  }

  @override
  QualitySelector createQualitySelectorFrom(Quality quality,
      {FallbackStrategy? fallbackStrategy}) {
    // TODO: implement createQualitySelectorFrom
    throw UnimplementedError();
  }

  @override
  QualitySelector createQualitySelectorFromOrderedList(List<Quality> qualities,
      {FallbackStrategy? fallbackStrategy}) {
    // TODO: implement createQualitySelectorFromOrderedList
    throw UnimplementedError();
  }

  @override
  ResolutionSelector createResolutionSelector(
      {AspectRatioStrategy? aspectRatioStrategy,
      ResolutionMode? allowedResolutionMode,
      ResolutionFilter? resolutionFilter,
      ResolutionStrategy? resolutionStrategy}) {
    // TODO: implement createResolutionSelector
    throw UnimplementedError();
  }
}
