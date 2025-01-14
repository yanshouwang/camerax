import 'aspect_ratio_strategy.dart';
import 'resolution_filter.dart';
import 'resolution_mode.dart';
import 'resolution_strategy.dart';

final class ResolutionSelector {
  final ResolutionMode allowedResolutionMode;
  final AspectRatioStrategy aspectRatioStrategy;
  final ResolutionFilter? resolutionFilter;
  final ResolutionStrategy? resolutionStrategy;

  const ResolutionSelector({
    this.allowedResolutionMode =
        ResolutionMode.preferCaptureRateOverHigherResolution,
    this.aspectRatioStrategy = AspectRatioStrategy.ratio4_3FallbackAutoStrategy,
    this.resolutionFilter,
    this.resolutionStrategy,
  });
}
