import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

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
  $base.MLAnalyzer createMLAnalyzer({
    required List<$base.MLObjectType> types,
    required $base.CoordinateSystem targetCoordinateSystem,
    required $base.MLObjectsCallback onAnalyzed,
  }) {
    // TODO: implement createMLAnalyzer
    throw UnimplementedError();
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
  $base.ResolutionSelector createResolutionSelector({
    $base.ResolutionMode? allowedResolutionMode,
    $base.AspectRatioStrategy? aspectRatioStrategy,
    $base.ResolutionFilter? resolutionFilter,
    $base.ResolutionStrategy? resolutionStrategy,
  }) {
    return ResolutionSelector(
      allowedResolutionMode: allowedResolutionMode,
      aspectRatioStrategy: aspectRatioStrategy,
      resolutionFilter: resolutionFilter,
      resolutionStrategy: resolutionStrategy,
    );
  }

  @override
  $base.AspectRatioStrategy createAspectRatioStrategy({
    required $base.AspectRatio preferredAspectRatio,
    required $base.AspectRatioFallbackRule fallbackRule,
  }) {
    return AspectRatioStrategy(
      preferredAspectRatio: preferredAspectRatio,
      fallbackRule: fallbackRule,
    );
  }

  @override
  $base.ResolutionStrategy createResolutionStrategy({
    required $base.Size boundSize,
    required $base.ResolutionFallbackRule fallbackRule,
  }) {
    return ResolutionStrategy(
      boundSize: boundSize,
      fallbackRule: fallbackRule,
    );
  }

  @override
  $base.ResolutionStrategy getHighestAvailableStrategy() {
    return ResolutionStrategy.highestAvailableStrategy;
  }

  @override
  $base.AspectRatioStrategy getRatio16_9FallbackAutoStrategy() {
    return AspectRatioStrategy.ratio16_9FallbackAutoStrategy;
  }

  @override
  $base.AspectRatioStrategy getRatio4_3FallbackAutoStrategy() {
    return AspectRatioStrategy.ratio4_3FallbackAutoStrategy;
  }
}
