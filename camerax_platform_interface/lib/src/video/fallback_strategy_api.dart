import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'quality_api.dart';

abstract base class FallbackStrategyApi {
  FallbackStrategyApi.impl();

  factory FallbackStrategyApi.higherQualityOrLowerThan(QualityApi quality) =>
      CameraXPlugin.instance.$FallbackStrategyApiHigherQualityOrLowerThan(
        quality,
      );

  factory FallbackStrategyApi.higherQualityThan(QualityApi quality) =>
      CameraXPlugin.instance.$FallbackStrategyApiHigherQualityThan(quality);

  factory FallbackStrategyApi.lowerQualityOrHigherThan(QualityApi quality) =>
      CameraXPlugin.instance.$FallbackStrategyApiLowerQualityOrHigherThan(
        quality,
      );

  factory FallbackStrategyApi.lowerQualityThan(QualityApi quality) =>
      CameraXPlugin.instance.$FallbackStrategyApiLowerQualityThan(quality);
}
