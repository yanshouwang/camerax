import 'package:camerax_platform_interface/src/camerax.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'aspect_ratio_strategy.dart';
import 'resolution_filter.dart';
import 'resolution_mode.dart';
import 'resolution_strategy.dart';

abstract base class ResolutionSelector extends PlatformInterface {
  static final _token = Object();

  ResolutionSelector.impl() : super(token: _token);

  factory ResolutionSelector({
    ResolutionMode? allowedResolutionMode,
    AspectRatioStrategy? aspectRatioStrategy,
    ResolutionFilter? resolutionFilter,
    ResolutionStrategy? resolutionStrategy,
  }) =>
      CameraX.instance.createResolutionSelector(
        allowedResolutionMode: allowedResolutionMode,
        aspectRatioStrategy: aspectRatioStrategy,
        resolutionFilter: resolutionFilter,
        resolutionStrategy: resolutionStrategy,
      );

  Future<ResolutionMode> getAllowedResolutionMode();
  Future<AspectRatioStrategy> getAspectRatioStrategy();
  Future<ResolutionFilter?> getResolutionFilter();
  Future<ResolutionStrategy?> getResolutionStrategy();
}
