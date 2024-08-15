import 'dart:ui' as ui;

import 'resolution_fallback_rule.dart';

final class ResolutionStrategy {
  final ui.Size? boundSize;
  final ResolutionFallbackRule fallbackRule;

  const ResolutionStrategy({
    required ui.Size this.boundSize,
    required this.fallbackRule,
  });

  const ResolutionStrategy._()
      : boundSize = null,
        fallbackRule = ResolutionFallbackRule.none;

  static const highestAvailableStrategy = ResolutionStrategy._();
}
