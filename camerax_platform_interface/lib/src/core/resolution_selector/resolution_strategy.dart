import 'package:camerax_platform_interface/src/common.dart';

enum ResolutionStrategyFallbackRule {
  none,
  closestHigherThenLower,
  closestHigher,
  closestLowerThenHigher,
  closestLower,
}

final class ResolutionStrategy {
  static const highestAvailableStrategy = ResolutionStrategy._();

  final Size<int>? boundSize;
  final ResolutionStrategyFallbackRule fallbackRule;

  const ResolutionStrategy._()
    : boundSize = null,
      fallbackRule = ResolutionStrategyFallbackRule.none;

  const ResolutionStrategy({
    required Size<int> this.boundSize,
    required this.fallbackRule,
  });

  @override
  int get hashCode => Object.hash(boundSize, fallbackRule);

  @override
  bool operator ==(Object other) {
    return other is ResolutionStrategy &&
        other.boundSize == boundSize &&
        other.fallbackRule == fallbackRule;
  }
}
