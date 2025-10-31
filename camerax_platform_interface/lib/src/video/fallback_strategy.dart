import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'quality.dart';

abstract base class FallbackStrategy {
  FallbackStrategy.impl();

  factory FallbackStrategy.higherQualityOrLowerThan(Quality quality) =>
      CameraXPlugin.instance.newFallbackStrategyHigherQualityOrLowerThan(
        quality,
      );

  factory FallbackStrategy.higherQualityThan(Quality quality) =>
      CameraXPlugin.instance.newFallbackStrategyHigherQualityThan(quality);

  factory FallbackStrategy.lowerQualityOrHigherThan(Quality quality) =>
      CameraXPlugin.instance.newFallbackStrategyLowerQualityOrHigherThan(
        quality,
      );

  factory FallbackStrategy.lowerQualityThan(Quality quality) =>
      CameraXPlugin.instance.newFallbackStrategyLowerQualityThan(quality);
}
