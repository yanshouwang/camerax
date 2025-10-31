import 'aspect_ratio_strategy.dart';
import 'resolution_filter.dart';
import 'resolution_strategy.dart';

enum ResolutionSelectorMode {
  preferCaptureRateOverHigherResolution,
  preferHigherResolutionOverCaptureRate,
}

final class ResolutionSelector {
  final ResolutionSelectorMode allowedResolutionMode;
  final AspectRatioStrategy aspectRatioStrategy;
  final ResolutionFilter? resolutionFilter;
  final ResolutionStrategy? resolutionStrategy;

  const ResolutionSelector({
    this.allowedResolutionMode =
        ResolutionSelectorMode.preferCaptureRateOverHigherResolution,
    this.aspectRatioStrategy = AspectRatioStrategy.ratio4_3FallbackAutoStrategy,
    this.resolutionFilter,
    this.resolutionStrategy,
  });
}
