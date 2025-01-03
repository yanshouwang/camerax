import 'dart:ui' as ui;

import 'package:camerax_platform_interface/src/camerax.dart';

import 'aspect_ratio_strategy.dart';
import 'resolution_mode.dart';
import 'resolution_strategy.dart';

typedef ResolutionFilter = List<ui.Size> Function(
    List<ui.Size> supportedSizes, int rotationDegrees);

abstract interface class ResolutionSelector {
  AspectRatioStrategy get aspectRatioStrategy;
  ResolutionMode get allowedResolutionMode;
  ResolutionFilter? get resolutionFilter;
  ResolutionStrategy? get resolutionStrategy;

  factory ResolutionSelector({
    AspectRatioStrategy? aspectRatioStrategy,
    ResolutionMode? allowedResolutionMode,
    ResolutionFilter? resolutionFilter,
    ResolutionStrategy? resolutionStrategy,
  }) =>
      CameraX.instance.createResolutionSelector(
        aspectRatioStrategy: aspectRatioStrategy,
        allowedResolutionMode: allowedResolutionMode,
        resolutionFilter: resolutionFilter,
        resolutionStrategy: resolutionStrategy,
      );
}
