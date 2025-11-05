import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'aspect_ratio_strategy.dart';
import 'resolution_filter.dart';
import 'resolution_strategy.dart';

enum ResolutionSelectorMode {
  preferCaptureRateOverHigherResolution,
  preferHigherResolutionOverCaptureRate,
}

abstract base class ResolutionSelector {
  ResolutionSelector.impl();

  factory ResolutionSelector({
    ResolutionSelectorMode? mode,
    AspectRatioStrategy? aspectRatioStrategy,
    ResolutionFilter? resolutionFilter,
    ResolutionStrategy? resolutionStrategy,
  }) => CameraXPlugin.instance.$ResolutionSelectorApi(
    mode: mode,
    aspectRatioStrategy: aspectRatioStrategy,
    resolutionFilter: resolutionFilter,
    resolutionStrategy: resolutionStrategy,
  );

  Future<ResolutionSelectorMode> getAllowedResolutionMode();
  Future<AspectRatioStrategy> getAspectRatioStrategy();
  Future<ResolutionFilter?> getResolutionFilter();
  Future<ResolutionStrategy?> getResolutionStrategy();
}
