import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'aspect_ratio_startegy_impl.dart';
import 'resolution_filter_impl.dart';
import 'resolution_strategy_impl.dart';

extension ResolutionSelectorModeX on ResolutionSelectorMode {
  ResolutionSelectorModeApi get api => ResolutionSelectorModeApi.values[index];
}

extension ResolutionSelectorModeApiX on ResolutionSelectorModeApi {
  ResolutionSelectorMode get impl => ResolutionSelectorMode.values[index];
}

extension ResolutionSelectorX on ResolutionSelector {
  ResolutionSelectorApi get api {
    return ResolutionSelectorApi.build(
      allowedResolutionMode: allowedResolutionMode.api,
      aspectRatioStrategy: aspectRatioStrategy.api,
      resolutionFilter: resolutionFilter?.api,
      resolutionStrategy: resolutionStrategy?.api,
    );
  }
}

extension ResolutionSelectorApiX on ResolutionSelectorApi {
  ResolutionSelector get impl {
    return ResolutionSelector(
      allowedResolutionMode: allowedResolutionMode.impl,
      aspectRatioStrategy: aspectRatioStrategy.impl,
      resolutionFilter: resolutionFilter?.impl,
      resolutionStrategy: resolutionStrategy?.impl,
    );
  }
}
