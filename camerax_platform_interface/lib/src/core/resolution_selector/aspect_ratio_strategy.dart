import 'package:camerax_platform_interface/src/camerax.dart';
import 'package:camerax_platform_interface/src/core/aspect_ratio.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'aspect_ratio_fallback_rule.dart';

abstract base class AspectRatioStrategy extends PlatformInterface {
  static final _token = Object();

  AspectRatioStrategy.impl() : super(token: _token);

  factory AspectRatioStrategy({
    required AspectRatio preferredAspectRatio,
    required AspectRatioFallbackRule fallbackRule,
  }) =>
      CameraX.instance.createAspectRatioStrategy(
        preferredAspectRatio: preferredAspectRatio,
        fallbackRule: fallbackRule,
      );

  Future<AspectRatio> getPreferredAspectRatio();
  Future<AspectRatioFallbackRule> getFallbackRule();

  static AspectRatioStrategy get ratio4_3FallbackAutoStrategy =>
      CameraX.instance.getRatio4_3FallbackAutoStrategy();

  static AspectRatioStrategy get ratio16_9FallbackAutoStrategy =>
      CameraX.instance.getRatio16_9FallbackAutoStrategy();
}
