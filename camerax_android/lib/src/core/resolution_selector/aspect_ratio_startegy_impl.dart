import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/core/aspect_ratio_impl.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension AspectRatioStrategyFallbackRuleX on AspectRatioStrategyFallbackRule {
  AspectRatioStrategyFallbackRuleApi get api =>
      AspectRatioStrategyFallbackRuleApi.values[index];
}

extension AspectRatioStrategyFallbackRuleApiX
    on AspectRatioStrategyFallbackRuleApi {
  AspectRatioStrategyFallbackRule get impl =>
      AspectRatioStrategyFallbackRule.values[index];
}

extension AspectRatioStartegyX on AspectRatioStrategy {
  AspectRatioStrategyApi get api {
    return AspectRatioStrategyApi(
      preferredAspectRatio: preferredAspectRatio.api,
      fallbackRule: fallbackRule.api,
    );
  }
}

extension AspectRatioStartegyApiX on AspectRatioStrategyApi {
  AspectRatioStrategy get impl {
    return AspectRatioStrategy(
      preferredAspectRatio: preferredAspectRatio.impl,
      fallbackRule: fallbackRule.impl,
    );
  }
}
