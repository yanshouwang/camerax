import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension AspectRatioFallbackRuleArgs on $base.AspectRatioFallbackRule {
  $native.AspectRatioFallbackRule get obj {
    switch (this) {
      case $base.AspectRatioFallbackRule.none:
        return $native.AspectRatioFallbackRule.none;
      case $base.AspectRatioFallbackRule.auto:
        return $native.AspectRatioFallbackRule.auto;
    }
  }
}

extension AspectRatioFallbackRuleObj on $native.AspectRatioFallbackRule {
  $base.AspectRatioFallbackRule get args {
    switch (this) {
      case $native.AspectRatioFallbackRule.none:
        return $base.AspectRatioFallbackRule.none;
      case $native.AspectRatioFallbackRule.auto:
        return $base.AspectRatioFallbackRule.auto;
    }
  }
}
