import 'package:camerax_platform_interface/src/camerax.dart';

import 'quality.dart';

abstract interface class FallbackStrategy {
  factory FallbackStrategy.higherQualityOrLowerThan(Quality quality) =>
      CameraX.instance.createFallbackStrategyHigherQualityOrLowerThan(quality);

  factory FallbackStrategy.higherQualityThan(Quality quality) =>
      CameraX.instance.createFallbackStrategyHigherQualityThan(quality);

  factory FallbackStrategy.lowerQualityOrHigherThan(Quality quality) =>
      CameraX.instance.createFallbackStrategyLowerQualityOrHigherThan(quality);

  factory FallbackStrategy.lowerQualityThan(Quality quality) =>
      CameraX.instance.createFallbackStrategyLowerQualityThan(quality);
}
