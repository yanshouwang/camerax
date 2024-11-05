import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'core.dart';
import 'ml.dart';
import 'video.dart';
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
  PreviewViewBuilder createPreviewViewBuilder() {
    return MyPreviewViewBuilder();
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
    return MyFallbackStrategy.higherQualityOrLowerThan(quality);
  }

  @override
  FallbackStrategy createFallbackStrategyHigherQualityThan(Quality quality) {
    return MyFallbackStrategy.higherQualityThan(quality);
  }

  @override
  FallbackStrategy createFallbackStrategyLowerQualityOrHigherThan(
      Quality quality) {
    return MyFallbackStrategy.lowerQualityOrHigherThan(quality);
  }

  @override
  FallbackStrategy createFallbackStrategyLowerQualityThan(Quality quality) {
    return MyFallbackStrategy.lowerQualityThan(quality);
  }

  @override
  QualitySelector createQualitySelectorFrom(
    Quality quality, {
    FallbackStrategy? fallbackStrategy,
  }) {
    return MyQualitySelector.from(
      quality,
      fallbackStrategy: fallbackStrategy,
    );
  }

  @override
  QualitySelector createQualitySelectorFromOrderedList(
    List<Quality> qualities, {
    FallbackStrategy? fallbackStrategy,
  }) {
    return MyQualitySelector.fromOrderedList(
      qualities,
      fallbackStrategy: fallbackStrategy,
    );
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
