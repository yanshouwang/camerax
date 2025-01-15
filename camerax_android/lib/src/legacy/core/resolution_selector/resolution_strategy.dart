import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

import 'resolutioin_fallback_rule.dart';

extension ResolutionStrategyArgs on $interface.ResolutionStrategy {
  $native.ResolutionStrategy get obj {
    return $native.ResolutionStrategy(
      boundSize: boundSize?.obj,
      fallbackRule: fallbackRule.obj,
    );
  }
}

extension ResolutionStrategyObj on $native.ResolutionStrategy {
  $interface.ResolutionStrategy get args {
    final boundSize = this.boundSize;
    return boundSize == null
        ? $interface.ResolutionStrategy.highestAvailableStrategy
        : $interface.ResolutionStrategy(
            boundSize: boundSize.args,
            fallbackRule: fallbackRule.args,
          );
  }
}
