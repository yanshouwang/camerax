import 'package:camerax_platform_interface/src/core/aspect_ratio.dart';

import 'aspect_ratio_fallback_rule.dart';

final class AspectRatioStrategy {
  static const ratio4_3FallbackAutoStrategy = AspectRatioStrategy(
    preferredAspectRatio: AspectRatio.ratio4_3,
    fallbackRule: AspectRatioFallbackRule.auto,
  );

  static const ratio16_9FallbackAutoStrategy = AspectRatioStrategy(
    preferredAspectRatio: AspectRatio.ratio16_9,
    fallbackRule: AspectRatioFallbackRule.auto,
  );

  final AspectRatio preferredAspectRatio;
  final AspectRatioFallbackRule fallbackRule;

  const AspectRatioStrategy({
    required this.preferredAspectRatio,
    required this.fallbackRule,
  });

  @override
  int get hashCode => Object.hash(preferredAspectRatio, fallbackRule);

  @override
  bool operator ==(Object other) {
    return other is AspectRatioStrategy &&
        other.preferredAspectRatio == preferredAspectRatio &&
        other.fallbackRule == fallbackRule;
  }
}
