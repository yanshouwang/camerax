import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/core/aspect_ratio.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'aspect_ratio_fallback_rule.dart';

extension AspectRatioStartegyArgs on $base.AspectRatioStrategy {
  $native.AspectRatioStrategy get obj {
    return $native.AspectRatioStrategy(
      preferredAspectRatio: preferredAspectRatio.obj,
      fallbackRule: fallbackRule.obj,
    );
  }
}

extension AspectRatioStartegyObj on $native.AspectRatioStrategy {
  $base.AspectRatioStrategy get args {
    return $base.AspectRatioStrategy(
      preferredAspectRatio: preferredAspectRatio.args,
      fallbackRule: fallbackRule.args,
    );
  }
}
