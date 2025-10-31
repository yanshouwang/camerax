import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

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
  ResolutionStrategyApi get api {
    return ResolutionStrategyApi(
      boundSize: boundSize?.api,
      fallbackRule: fallbackRule.api,
    );
  }
}

extension ResolutionStrategyApiX on ResolutionStrategyApi {
  ResolutionStrategy get impl {
    final boundSize = this.boundSize;
    return boundSize == null
        ? ResolutionStrategy.highestAvailableStrategy
        : ResolutionStrategy(
            boundSize: boundSize.impl,
            fallbackRule: fallbackRule.impl,
          );
  }
}
