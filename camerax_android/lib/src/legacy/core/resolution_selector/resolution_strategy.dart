import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'resolutioin_fallback_rule.dart';

final class ResolutionStrategy extends $base.ResolutionStrategy {
  static ResolutionStrategy get highestAvailableStrategy {
    final obj = $native.ResolutionStrategy.highestAvailableStrategy;
    return ResolutionStrategy.$native(obj);
  }

  final $native.ResolutionStrategy obj;

  ResolutionStrategy.$native(this.obj) : super.impl();

  factory ResolutionStrategy({
    required $base.Size boundSize,
    required $base.ResolutionFallbackRule fallbackRule,
  }) {
    if (boundSize is! Size) {
      throw TypeError();
    }
    final obj = $native.ResolutionStrategy(
      boundSize: boundSize.obj,
      fallbackRule: fallbackRule.obj,
    );
    return ResolutionStrategy.$native(obj);
  }

  @override
  Future<$base.Size?> getBoundSize() async {
    final obj = await this.obj.getBoundSize();
    return obj == null ? null : Size.$native(obj);
  }

  @override
  Future<$base.ResolutionFallbackRule> getFallbackRule() async {
    final obj = await this.obj.getFallbackRule();
    return obj.args;
  }
}
