import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'resolutioin_fallback_rule_impl.dart';

extension ResolutionStrategyX on ResolutionStrategy {
  ResolutionStrategyApi get api {
    return ResolutionStrategyApi(
      boundSize: boundSize?.api,
      fallbackRule: fallbackRule.api,
    );
  }
}

extension ResolutionStrategyApiX on ResolutionStrategyApi {
  ResolutionStrategy get impl {
    final boundSize = this.boundSize;
    return boundSize == null
        ? ResolutionStrategy.highestAvailableStrategy
        : ResolutionStrategy(
            boundSize: boundSize.impl,
            fallbackRule: fallbackRule.impl,
          );
  }
}
