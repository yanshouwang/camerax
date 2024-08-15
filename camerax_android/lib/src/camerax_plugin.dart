import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'core.dart';
import 'ml.dart';
import 'view.dart';

final class CameraXAndroidPlugin extends CameraXPlugin {
  static void registerWith() {
    CameraXPlugin.instance = CameraXAndroidPlugin();
  }

  @override
  CameraSelector createCameraSelector({
    LensFacing? lensFacing,
  }) {
    return MyCameraSelector(lensFacing: lensFacing);
  }

  @override
  CameraController createCameraController() {
    return MyCameraController();
  }

  @override
  PreviewViewController createPreviewViewController() {
    return MyPreviewViewController();
  }

  @override
  ResolutionSelector createResolutionSelector({
    AspectRatioStrategy? aspectRatioStrategy,
    ResolutionMode? allowedResolutionMode,
    ResolutionFilter? resolutionFilter,
    ResolutionStrategy? resolutionStrategy,
  }) {
    return MyResolutionSelector(
      aspectRatioStrategy: aspectRatioStrategy,
      allowedResolutionMode: allowedResolutionMode,
      resolutionFilter: resolutionFilter,
      resolutionStrategy: resolutionStrategy,
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
  QualitySelector createQualitySelectorFrom(
    Quality quality, {
    FallbackStrategy? fallbackStrategy,
  }) {
    // TODO: implement createQualitySelectorFrom
    throw UnimplementedError();
  }

  @override
  QualitySelector createQualitySelectorFromOrderedList(
    List<Quality> qualities, {
    FallbackStrategy? fallbackStrategy,
  }) {
    // TODO: implement createQualitySelectorFromOrderedList
    throw UnimplementedError();
  }

  @override
  MLAnalyzer createMLAnalyzer({
    required List<MLObjectType> types,
    required CoordinateSystem targetCoordinateSystem,
    required MLObjectsCallback onAnalyzed,
  }) {
    return MyMLAnalyzer(
      types: types,
      targetCoordinateSystem: targetCoordinateSystem,
      onAnalyzed: onAnalyzed,
    );
  }
}
