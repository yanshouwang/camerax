import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/core/aspect_ratio_api.dart';

enum AspectRatioStrategyFallbackRule { none, auto }

abstract base class AspectRatioStrategyApi {
  static AspectRatioStrategyApi get ratio4_3FallbackAutoStrategy =>
      CameraXPlugin
          .instance
          .$AspectRatioStrategyApiRatio4_3FallbackAutoStrategy;

  static AspectRatioStrategyApi get ratio16_9FallbackAutoStrategy =>
      CameraXPlugin
          .instance
          .$AspectRatioStrategyApiRatio16_9FallbackAutoStrategy;

  AspectRatioStrategyApi.impl();

  factory AspectRatioStrategyApi({
    required AspectRatio preferredAspectRatio,
    required AspectRatioStrategyFallbackRule fallbackRule,
  }) => CameraXPlugin.instance.$AspectRatioStrategyApi(
    preferredAspectRatio: preferredAspectRatio,
    fallbackRule: fallbackRule,
  );

  Future<AspectRatioStrategyFallbackRule> getFallbackRule();
  Future<AspectRatio> getPreferredAspectRatio();
}
