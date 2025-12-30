import 'package:camerax_platform_interface/src/core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

enum AspectRatioStrategy$FallbackRule { none, auto }

abstract interface class AspectRatioStrategy {
  static AspectRatioStrategy get ratio4_3FallbackAutoStrategy =>
      AspectRatioStrategyChannel.instance.ratio4_3FallbackAutoStrategy;

  static AspectRatioStrategy get ratio16_9FallbackAutoStrategy =>
      AspectRatioStrategyChannel.instance.ratio16_9FallbackAutoStrategy;

  factory AspectRatioStrategy({
    required AspectRatio preferredAspectRatio,
    required AspectRatioStrategy$FallbackRule fallbackRule,
  }) => AspectRatioStrategyChannel.instance.create(
    preferredAspectRatio: preferredAspectRatio,
    fallbackRule: fallbackRule,
  );

  Future<AspectRatioStrategy$FallbackRule> getFallbackRule();
  Future<AspectRatio> getPreferredAspectRatio();
}

abstract base class AspectRatioStrategyChannel extends PlatformInterface {
  AspectRatioStrategyChannel() : super(token: _token);

  static final _token = Object();

  static AspectRatioStrategyChannel? _instance;

  static AspectRatioStrategyChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(AspectRatioStrategyChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  AspectRatioStrategy get ratio4_3FallbackAutoStrategy;
  AspectRatioStrategy get ratio16_9FallbackAutoStrategy;

  AspectRatioStrategy create({
    required AspectRatio preferredAspectRatio,
    required AspectRatioStrategy$FallbackRule fallbackRule,
  });
}
