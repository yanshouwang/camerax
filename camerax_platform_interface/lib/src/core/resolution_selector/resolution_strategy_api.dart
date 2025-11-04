import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';

enum ResolutionStrategyFallbackRule {
  none,
  closestHigherThenLower,
  closestHigher,
  closestLowerThenHigher,
  closestLower,
}

abstract base class ResolutionStrategyApi {
  static ResolutionStrategyApi get highestAvailableStrategy =>
      CameraXPlugin.instance.$ResolutionStrategyApiHighestAvailableStrategy;

  ResolutionStrategyApi.impl();

  factory ResolutionStrategyApi({
    required SizeApi boundSize,
    required ResolutionStrategyFallbackRule fallbackRule,
  }) => CameraXPlugin.instance.$ResolutionStrategyApi(
    boundSize: boundSize,
    fallbackRule: fallbackRule,
  );

  Future<SizeApi?> getBoundSize();
  Future<ResolutionStrategyFallbackRule> getFallbackRule();
}
