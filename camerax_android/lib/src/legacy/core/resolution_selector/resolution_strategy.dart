import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'resolutioin_fallback_rule.dart';

extension ResolutionStrategyArgs on $base.ResolutionStrategy {
  $native.ResolutionStrategy get obj {
    return $native.ResolutionStrategy(
      boundSize: boundSize?.obj,
      fallbackRule: fallbackRule.obj,
    );
  }
}

extension ResolutionStrategyObj on $native.ResolutionStrategy {
  $base.ResolutionStrategy get args {
    final boundSize = this.boundSize;
    return boundSize == null
        ? $base.ResolutionStrategy.highestAvailableStrategy
        : $base.ResolutionStrategy(
            boundSize: boundSize.args,
            fallbackRule: fallbackRule.args,
          );
  }
}
