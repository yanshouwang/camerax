import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/core/aspect_ratio.dart';

enum AspectRatioStrategyFallbackRule { none, auto }

abstract base class AspectRatioStrategy {
  static AspectRatioStrategy get ratio4_3FallbackAutoStrategy =>
      CameraXPlugin.instance.$AspectRatioStrategyRatio4_3FallbackAutoStrategy;

  static AspectRatioStrategy get ratio16_9FallbackAutoStrategy =>
      CameraXPlugin.instance.$AspectRatioStrategyRatio16_9FallbackAutoStrategy;

  AspectRatioStrategy.impl();

  factory AspectRatioStrategy({
    required AspectRatio preferredAspectRatio,
    required AspectRatioStrategyFallbackRule fallbackRule,
  }) => CameraXPlugin.instance.$AspectRatioStrategyApi(
    preferredAspectRatio: preferredAspectRatio,
    fallbackRule: fallbackRule,
  );

  Future<AspectRatioStrategyFallbackRule> getFallbackRule();
  Future<AspectRatio> getPreferredAspectRatio();
}
