import 'package:camerax_platform_interface/src/common.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

enum ResolutionStrategy$FallbackRule {
  none,
  closestHigherThenLower,
  closestHigher,
  closestLowerThenHigher,
  closestLower,
}

abstract interface class ResolutionStrategy {
  static ResolutionStrategy get highestAvailableStrategy =>
      ResolutionStrategyChannel.instance.highestAvailableStrategy;

  factory ResolutionStrategy({
    required Size<int> boundSize,
    required ResolutionStrategy$FallbackRule fallbackRule,
  }) => ResolutionStrategyChannel.instance.create(
    boundSize: boundSize,
    fallbackRule: fallbackRule,
  );

  Future<Size<int>?> getBoundSize();
  Future<ResolutionStrategy$FallbackRule> getFallbackRule();
}

abstract base class ResolutionStrategyChannel extends PlatformInterface {
  ResolutionStrategyChannel() : super(token: _token);

  static final _token = Object();

  static ResolutionStrategyChannel? _instance;

  static ResolutionStrategyChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(ResolutionStrategyChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  ResolutionStrategy get highestAvailableStrategy;

  ResolutionStrategy create({
    required Size<int> boundSize,
    required ResolutionStrategy$FallbackRule fallbackRule,
  });
}
