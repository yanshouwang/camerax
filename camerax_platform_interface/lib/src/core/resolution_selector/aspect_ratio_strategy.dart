import 'package:camerax_platform_interface/src/core/aspect_ratio.dart';

import 'aspect_ratio_fallback_rule.dart';

final class AspectRatioStrategy {
  final AspectRatio preferredAspectRatio;
  final AspectRatioFallbackRule fallbackRule;

  const AspectRatioStrategy({
    required this.preferredAspectRatio,
    required this.fallbackRule,
  });

  static const ratio4_3FallbackAutoStrategy = AspectRatioStrategy(
    preferredAspectRatio: AspectRatio.with_4_3,
    fallbackRule: AspectRatioFallbackRule.auto,
  );

  static const ratio16_9FallbackAutoStrategy = AspectRatioStrategy(
    preferredAspectRatio: AspectRatio.with_16_9,
    fallbackRule: AspectRatioFallbackRule.auto,
  );
}
