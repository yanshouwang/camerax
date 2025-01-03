import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

import 'core.dart';
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
  $interface.MLAnalyzer createMLAnalyzer(
      {required List<$interface.MLObjectType> types,
      required $interface.CoordinateSystem targetCoordinateSystem,
      required $interface.MLObjectsCallback onAnalyzed}) {
    // TODO: implement createMLAnalyzer
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
  $interface.ResolutionSelector createResolutionSelector(
      {$interface.AspectRatioStrategy? aspectRatioStrategy,
      $interface.ResolutionMode? allowedResolutionMode,
      $interface.ResolutionFilter? resolutionFilter,
      $interface.ResolutionStrategy? resolutionStrategy}) {
    // TODO: implement createResolutionSelector
    throw UnimplementedError();
  }
}
