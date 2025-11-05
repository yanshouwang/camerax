import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/core/aspect_ratio_impl.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class AspectRatioStrategyImpl extends AspectRatioStrategy {
  final AspectRatioStrategyProxyApi api;

  AspectRatioStrategyImpl.internal(this.api) : super.impl();

  factory AspectRatioStrategyImpl({
    required AspectRatio preferredAspectRatio,
    required AspectRatioStrategyFallbackRule fallbackRule,
  }) {
    final api = AspectRatioStrategyProxyApi(
      preferredAspectRatio: preferredAspectRatio.api,
      fallbackRule: fallbackRule.api,
    );
    return AspectRatioStrategyImpl.internal(api);
  }

  @override
  Future<AspectRatioStrategyFallbackRule> getFallbackRule() =>
      api.getFallbackRule().then((e) => e.impl);

  @override
  Future<AspectRatio> getPreferredAspectRatio() =>
      api.getPreferredAspectRatio().then((e) => e.impl);
}

extension AspectRatioStrategyFallbackRuleX on AspectRatioStrategyFallbackRule {
  AspectRatioStrategyFallbackRuleApi get api =>
      AspectRatioStrategyFallbackRuleApi.values[index];
}

extension AspectRatioStrategyFallbackRuleApiX
    on AspectRatioStrategyFallbackRuleApi {
  AspectRatioStrategyFallbackRule get impl =>
      AspectRatioStrategyFallbackRule.values[index];
}

extension AspectRatioStrategyApiX on AspectRatioStrategy {
  AspectRatioStrategyProxyApi get api {
    final impl = this;
    if (impl is! AspectRatioStrategyImpl) throw TypeError();
    return impl.api;
  }
}

extension AspectRatioStrategyProxyApiX on AspectRatioStrategyProxyApi {
  AspectRatioStrategy get impl => AspectRatioStrategyImpl.internal(this);
}
