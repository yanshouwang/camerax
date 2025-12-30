import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class ResolutionStrategyImpl implements ResolutionStrategy {
  final ResolutionStrategyProxyApi api;

  ResolutionStrategyImpl.internal(this.api);

  @override
  Future<Size<int>?> getBoundSize() => api.getBoundSize().then((e) => e?.impl);

  @override
  Future<ResolutionStrategy$FallbackRule> getFallbackRule() =>
      api.getFallbackRule().then((e) => e.impl);
}

final class ResolutionStrategyChannelImpl extends ResolutionStrategyChannel {
  @override
  ResolutionStrategy get highestAvailableStrategy =>
      ResolutionStrategyImpl.internal(
        ResolutionStrategyProxyApi.highestAvailableStrategy,
      );

  @override
  ResolutionStrategy create({
    required Size<int> boundSize,
    required ResolutionStrategy$FallbackRule fallbackRule,
  }) {
    final api = ResolutionStrategyProxyApi(
      boundSize: boundSize.api,
      fallbackRule: fallbackRule.api,
    );
    return ResolutionStrategyImpl.internal(api);
  }
}

extension ResolutionStrategy$FallbackRuleX on ResolutionStrategy$FallbackRule {
  ResolutionStrategyFallbackRuleApi get api =>
      ResolutionStrategyFallbackRuleApi.values[index];
}

extension ResolutionStrategyFallbackRuleApiX
    on ResolutionStrategyFallbackRuleApi {
  ResolutionStrategy$FallbackRule get impl =>
      ResolutionStrategy$FallbackRule.values[index];
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
