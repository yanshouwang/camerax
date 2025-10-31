import 'package:camerax_platform_interface/src/core/aspect_ratio.dart';

enum AspectRatioStrategyFallbackRule { none, auto }

final class AspectRatioStrategy {
  static const ratio4_3FallbackAutoStrategy = AspectRatioStrategy(
    preferredAspectRatio: AspectRatio.ratio4_3,
    fallbackRule: AspectRatioStrategyFallbackRule.auto,
  );

  static const ratio16_9FallbackAutoStrategy = AspectRatioStrategy(
    preferredAspectRatio: AspectRatio.ratio16_9,
    fallbackRule: AspectRatioStrategyFallbackRule.auto,
  );

  final AspectRatio preferredAspectRatio;
  final AspectRatioStrategyFallbackRule fallbackRule;

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
