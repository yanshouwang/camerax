import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';

enum ResolutionStrategyFallbackRule {
  none,
  closestHigherThenLower,
  closestHigher,
  closestLowerThenHigher,
  closestLower,
}

abstract base class ResolutionStrategy {
  static ResolutionStrategy get highestAvailableStrategy =>
      CameraXPlugin.instance.$ResolutionStrategyHighestAvailableStrategy;

  ResolutionStrategy.impl();

  factory ResolutionStrategy({
    required Size<int> boundSize,
    required ResolutionStrategyFallbackRule fallbackRule,
  }) => CameraXPlugin.instance.$ResolutionStrategyApi(
    boundSize: boundSize,
    fallbackRule: fallbackRule,
  );

  Future<Size<int>?> getBoundSize();
  Future<ResolutionStrategyFallbackRule> getFallbackRule();
}
