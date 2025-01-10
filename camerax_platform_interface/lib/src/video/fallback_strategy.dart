import 'package:camerax_platform_interface/src/camerax.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'quality.dart';

abstract base class FallbackStrategy extends PlatformInterface {
  static final _token = Object();

  FallbackStrategy.impl() : super(token: _token);

  factory FallbackStrategy.higherQualityOrLowerThan(Quality quality) =>
      CameraX.instance.createFallbackStrategyHigherQualityOrLowerThan(quality);

  factory FallbackStrategy.higherQualityThan(Quality quality) =>
      CameraX.instance.createFallbackStrategyHigherQualityThan(quality);

  factory FallbackStrategy.lowerQualityOrHigherThan(Quality quality) =>
      CameraX.instance.createFallbackStrategyLowerQualityOrHigherThan(quality);

  factory FallbackStrategy.lowerQualityThan(Quality quality) =>
      CameraX.instance.createFallbackStrategyLowerQualityThan(quality);
}
