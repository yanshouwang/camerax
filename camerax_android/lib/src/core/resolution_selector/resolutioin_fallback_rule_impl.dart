import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension ResolutioinFallbackRuleX on ResolutionFallbackRule {
  ResolutionFallbackRuleApi get api {
    switch (this) {
      case ResolutionFallbackRule.none:
        return ResolutionFallbackRuleApi.none;
      case ResolutionFallbackRule.closestHigherThenLower:
        return ResolutionFallbackRuleApi.closestHigherThenLower;
      case ResolutionFallbackRule.closestHigher:
        return ResolutionFallbackRuleApi.closestHigher;
      case ResolutionFallbackRule.closestLowerThenHigher:
        return ResolutionFallbackRuleApi.closestLowerThenHigher;
      case ResolutionFallbackRule.closestLower:
        return ResolutionFallbackRuleApi.closestLower;
    }
  }
}

extension ResolutioinFallbackRuleApiX on ResolutionFallbackRuleApi {
  ResolutionFallbackRule get impl {
    switch (this) {
      case ResolutionFallbackRuleApi.none:
        return ResolutionFallbackRule.none;
      case ResolutionFallbackRuleApi.closestHigherThenLower:
        return ResolutionFallbackRule.closestHigherThenLower;
      case ResolutionFallbackRuleApi.closestHigher:
        return ResolutionFallbackRule.closestHigher;
      case ResolutionFallbackRuleApi.closestLowerThenHigher:
        return ResolutionFallbackRule.closestLowerThenHigher;
      case ResolutionFallbackRuleApi.closestLower:
        return ResolutionFallbackRule.closestLower;
    }
  }
}
