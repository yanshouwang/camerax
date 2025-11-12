import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'quality.dart';

abstract base class FallbackStrategy {
  FallbackStrategy.impl();

  factory FallbackStrategy.higherQualityOrLowerThan(Quality quality) =>
      CameraXPlugin.instance.$FallbackStrategy$HigherQualityOrLowerThan(
        quality,
      );

  factory FallbackStrategy.higherQualityThan(Quality quality) =>
      CameraXPlugin.instance.$FallbackStrategy$HigherQualityThan(quality);

  factory FallbackStrategy.lowerQualityOrHigherThan(Quality quality) =>
      CameraXPlugin.instance.$FallbackStrategy$LowerQualityOrHigherThan(
        quality,
      );

  factory FallbackStrategy.lowerQualityThan(Quality quality) =>
      CameraXPlugin.instance.$FallbackStrategy$LowerQualityThan(quality);
}
