import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'core.dart';
import 'view.dart';

final class CameraXLinuxPlugin extends CameraXPlugin {
  static void registerWith() {
    CameraXPlugin.instance = CameraXLinuxPlugin();
  }

  @override
  CameraController createCameraController() {
    return CameraControllerImpl();
  }

  @override
  CameraSelector createCameraSelector({LensFacing? lensFacing}) {
    return CameraSelectorImpl(
      lensFacing: lensFacing,
    );
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
  PreviewViewBuilder createPreviewViewBuilder() {
    return PreviewViewBuilderImpl();
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
