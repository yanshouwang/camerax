import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class ResolutionStrategyImpl extends ResolutionStrategy {
  final ResolutionStrategyProxyApi api;

  ResolutionStrategyImpl.internal(this.api) : super.impl();

  factory ResolutionStrategyImpl({
    required Size<int> boundSize,
    required ResolutionStrategyFallbackRule fallbackRule,
  }) {
    final api = ResolutionStrategyProxyApi(
      boundSize: boundSize.api,
      fallbackRule: fallbackRule.api,
    );
    return ResolutionStrategyImpl.internal(api);
  }

  @override
  Future<Size<int>?> getBoundSize() => api.getBoundSize().then((e) => e?.impl);

  @override
  Future<ResolutionStrategyFallbackRule> getFallbackRule() =>
      api.getFallbackRule().then((e) => e.impl);
}

extension ResolutionStrategyFallbackRuleX on ResolutionStrategyFallbackRule {
  ResolutionStrategyFallbackRuleApi get api =>
      ResolutionStrategyFallbackRuleApi.values[index];
}

extension ResolutionStrategyFallbackRuleApiX
    on ResolutionStrategyFallbackRuleApi {
  ResolutionStrategyFallbackRule get impl =>
      ResolutionStrategyFallbackRule.values[index];
}

extension ResolutionStrategyX on ResolutionStrategy {
  ResolutionStrategyProxyApi get api {
    final impl = this;
    if (impl is! ResolutionStrategyImpl) throw TypeError();
    return impl.api;
  }
}

extension ResolutionStrategyProxyApiX on ResolutionStrategyProxyApi {
  ResolutionStrategy get impl => ResolutionStrategyImpl.internal(this);
}
