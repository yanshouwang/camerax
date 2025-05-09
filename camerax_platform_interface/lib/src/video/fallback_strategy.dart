import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'quality.dart';

final _token = Object();

abstract interface class FallbackStrategy {
  factory FallbackStrategy.higherQualityOrLowerThan(Quality quality) {
    final instance = CameraXPlugin.instance
        .newFallbackStrategyHigherQualityOrLowerThan(quality);
    PlatformInterface.verify(instance as PlatformInterface, _token);
    return instance;
  }

  factory FallbackStrategy.higherQualityThan(Quality quality) {
    final instance =
        CameraXPlugin.instance.newFallbackStrategyHigherQualityThan(quality);
    PlatformInterface.verify(instance as PlatformInterface, _token);
    return instance;
  }

  factory FallbackStrategy.lowerQualityOrHigherThan(Quality quality) {
    final instance = CameraXPlugin.instance
        .newFallbackStrategyLowerQualityOrHigherThan(quality);
    PlatformInterface.verify(instance as PlatformInterface, _token);
    return instance;
  }

  factory FallbackStrategy.lowerQualityThan(Quality quality) {
    final instance =
        CameraXPlugin.instance.newFallbackStrategyLowerQualityThan(quality);
    PlatformInterface.verify(instance as PlatformInterface, _token);
    return instance;
  }
}

abstract base class FallbackStrategyChannel extends PlatformInterface
    implements FallbackStrategy {
  FallbackStrategyChannel.impl() : super(token: _token);
}
