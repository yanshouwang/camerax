import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'quality.dart';

abstract interface class FallbackStrategy {
  factory FallbackStrategy.higherQualityOrLowerThan(Quality quality) =>
      CameraXPlugin.instance
          .createFallbackStrategyHigherQualityOrLowerThan(quality);

  factory FallbackStrategy.higherQualityThan(Quality quality) =>
      CameraXPlugin.instance.createFallbackStrategyHigherQualityThan(quality);

  factory FallbackStrategy.lowerQualityOrHigherThan(Quality quality) =>
      CameraXPlugin.instance
          .createFallbackStrategyLowerQualityOrHigherThan(quality);

  factory FallbackStrategy.lowerQualityThan(Quality quality) =>
      CameraXPlugin.instance.createFallbackStrategyLowerQualityThan(quality);
}
