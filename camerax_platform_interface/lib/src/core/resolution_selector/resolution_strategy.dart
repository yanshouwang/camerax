import 'package:camerax_platform_interface/src/common.dart';

import 'resolution_fallback_rule.dart';

final class ResolutionStrategy {
  static const highestAvailableStrategy = ResolutionStrategy._();

  final Size? boundSize;
  final ResolutionFallbackRule fallbackRule;

  const ResolutionStrategy._()
      : boundSize = null,
        fallbackRule = ResolutionFallbackRule.none;

  const ResolutionStrategy({
    required Size this.boundSize,
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
