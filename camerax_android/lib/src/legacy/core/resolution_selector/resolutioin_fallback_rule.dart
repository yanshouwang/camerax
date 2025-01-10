import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension ResolutioinFallbackRuleArgs on $base.ResolutionFallbackRule {
  $native.ResolutionFallbackRule get obj {
    switch (this) {
      case $base.ResolutionFallbackRule.none:
        return $native.ResolutionFallbackRule.none;
      case $base.ResolutionFallbackRule.closestHigherThenLower:
        return $native.ResolutionFallbackRule.closestHigherThenLower;
      case $base.ResolutionFallbackRule.closestHigher:
        return $native.ResolutionFallbackRule.closestHigher;
      case $base.ResolutionFallbackRule.closestLowerThenHigher:
        return $native.ResolutionFallbackRule.closestLowerThenHigher;
      case $base.ResolutionFallbackRule.closestLower:
        return $native.ResolutionFallbackRule.closestLower;
    }
  }
}

extension ResolutioinFallbackRuleObj on $native.ResolutionFallbackRule {
  $base.ResolutionFallbackRule get args {
    switch (this) {
      case $native.ResolutionFallbackRule.none:
        return $base.ResolutionFallbackRule.none;
      case $native.ResolutionFallbackRule.closestHigherThenLower:
        return $base.ResolutionFallbackRule.closestHigherThenLower;
      case $native.ResolutionFallbackRule.closestHigher:
        return $base.ResolutionFallbackRule.closestHigher;
      case $native.ResolutionFallbackRule.closestLowerThenHigher:
        return $base.ResolutionFallbackRule.closestLowerThenHigher;
      case $native.ResolutionFallbackRule.closestLower:
        return $base.ResolutionFallbackRule.closestLower;
    }
  }
}
