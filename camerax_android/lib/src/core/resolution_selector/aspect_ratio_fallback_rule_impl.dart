import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension AspectRatioFallbackRuleX on AspectRatioFallbackRule {
  AspectRatioFallbackRuleApi get api {
    switch (this) {
      case AspectRatioFallbackRule.none:
        return AspectRatioFallbackRuleApi.none;
      case AspectRatioFallbackRule.auto:
        return AspectRatioFallbackRuleApi.auto;
    }
  }
}

extension AspectRatioFallbackRuleApiX on AspectRatioFallbackRuleApi {
  AspectRatioFallbackRule get impl {
    switch (this) {
      case AspectRatioFallbackRuleApi.none:
        return AspectRatioFallbackRule.none;
      case AspectRatioFallbackRuleApi.auto:
        return AspectRatioFallbackRule.auto;
    }
  }
}
