import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/core/aspect_ratio.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'aspect_ratio_fallback_rule.dart';

final class AspectRatioStrategy extends $base.AspectRatioStrategy {
  static AspectRatioStrategy get ratio16_9FallbackAutoStrategy {
    final obj = $native.AspectRatioStrategy.ratio16_9FallbackAutoStrategy;
    return AspectRatioStrategy.$native(obj);
  }

  static AspectRatioStrategy get ratio4_3FallbackAutoStrategy {
    final obj = $native.AspectRatioStrategy.ratio4_3FallbackAutoStrategy;
    return AspectRatioStrategy.$native(obj);
  }

  final $native.AspectRatioStrategy obj;

  AspectRatioStrategy.$native(this.obj) : super.impl();

  factory AspectRatioStrategy({
    required $base.AspectRatio preferredAspectRatio,
    required $base.AspectRatioFallbackRule fallbackRule,
  }) {
    final obj = $native.AspectRatioStrategy(
      preferredAspectRatio: preferredAspectRatio.obj,
      fallbackRule: fallbackRule.obj,
    );
    return AspectRatioStrategy.$native(obj);
  }

  @override
  Future<$base.AspectRatioFallbackRule> getFallbackRule() async {
    final obj = await this.obj.getFallbackRule();
    return obj.args;
  }

  @override
  Future<$base.AspectRatio> getPreferredAspectRatio() async {
    final obj = await this.obj.getPreferredAspectRatio();
    return obj.args;
  }
}
