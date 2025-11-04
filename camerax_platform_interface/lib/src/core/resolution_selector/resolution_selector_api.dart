import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'aspect_ratio_strategy_api.dart';
import 'resolution_filter_api.dart';
import 'resolution_strategy_api.dart';

enum ResolutionSelectorMode {
  preferCaptureRateOverHigherResolution,
  preferHigherResolutionOverCaptureRate,
}

abstract base class ResolutionSelectorApi {
  ResolutionSelectorApi.impl();

  factory ResolutionSelectorApi({
    ResolutionSelectorMode? mode,
    AspectRatioStrategyApi? aspectRatioStrategy,
    ResolutionFilterApi? resolutionFilter,
    ResolutionStrategyApi? resolutionStrategy,
  }) => CameraXPlugin.instance.$ResolutionSelectorApi(
    mode: mode,
    aspectRatioStrategy: aspectRatioStrategy,
    resolutionFilter: resolutionFilter,
    resolutionStrategy: resolutionStrategy,
  );

  Future<ResolutionSelectorMode> getAllowedResolutionMode();
  Future<AspectRatioStrategyApi> getAspectRatioStrategy();
  Future<ResolutionFilterApi?> getResolutionFilter();
  Future<ResolutionStrategyApi?> getResolutionStrategy();
}
