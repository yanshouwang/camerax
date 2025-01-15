import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension ResolutioinFallbackRuleArgs on $interface.ResolutionFallbackRule {
  $native.ResolutionFallbackRule get obj {
    switch (this) {
      case $interface.ResolutionFallbackRule.none:
        return $native.ResolutionFallbackRule.none;
      case $interface.ResolutionFallbackRule.closestHigherThenLower:
        return $native.ResolutionFallbackRule.closestHigherThenLower;
      case $interface.ResolutionFallbackRule.closestHigher:
        return $native.ResolutionFallbackRule.closestHigher;
      case $interface.ResolutionFallbackRule.closestLowerThenHigher:
        return $native.ResolutionFallbackRule.closestLowerThenHigher;
      case $interface.ResolutionFallbackRule.closestLower:
        return $native.ResolutionFallbackRule.closestLower;
    }
  }
}

extension ResolutioinFallbackRuleObj on $native.ResolutionFallbackRule {
  $interface.ResolutionFallbackRule get args {
    switch (this) {
      case $native.ResolutionFallbackRule.none:
        return $interface.ResolutionFallbackRule.none;
      case $native.ResolutionFallbackRule.closestHigherThenLower:
        return $interface.ResolutionFallbackRule.closestHigherThenLower;
      case $native.ResolutionFallbackRule.closestHigher:
        return $interface.ResolutionFallbackRule.closestHigher;
      case $native.ResolutionFallbackRule.closestLowerThenHigher:
        return $interface.ResolutionFallbackRule.closestLowerThenHigher;
      case $native.ResolutionFallbackRule.closestLower:
        return $interface.ResolutionFallbackRule.closestLower;
    }
  }
}
