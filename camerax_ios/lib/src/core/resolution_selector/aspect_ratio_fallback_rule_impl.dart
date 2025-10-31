import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension AspectRatioFallbackRuleX on AspectRatioStrategyFallbackRule {
  AspectRatioFallbackRuleApi get api {
    switch (this) {
      case AspectRatioStrategyFallbackRule.none:
        return AspectRatioFallbackRuleApi.none;
      case AspectRatioStrategyFallbackRule.auto:
        return AspectRatioFallbackRuleApi.auto;
    }
  }
}

extension AspectRatioFallbackRuleApiX on AspectRatioFallbackRuleApi {
  AspectRatioStrategyFallbackRule get impl {
    switch (this) {
      case AspectRatioFallbackRuleApi.none:
        return AspectRatioStrategyFallbackRule.none;
      case AspectRatioFallbackRuleApi.auto:
        return AspectRatioStrategyFallbackRule.auto;
    }
  }
}
