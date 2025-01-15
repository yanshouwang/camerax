import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension AspectRatioFallbackRuleArgs on $interface.AspectRatioFallbackRule {
  $native.AspectRatioFallbackRule get obj {
    switch (this) {
      case $interface.AspectRatioFallbackRule.none:
        return $native.AspectRatioFallbackRule.none;
      case $interface.AspectRatioFallbackRule.auto:
        return $native.AspectRatioFallbackRule.auto;
    }
  }
}

extension AspectRatioFallbackRuleObj on $native.AspectRatioFallbackRule {
  $interface.AspectRatioFallbackRule get args {
    switch (this) {
      case $native.AspectRatioFallbackRule.none:
        return $interface.AspectRatioFallbackRule.none;
      case $native.AspectRatioFallbackRule.auto:
        return $interface.AspectRatioFallbackRule.auto;
    }
  }
}
