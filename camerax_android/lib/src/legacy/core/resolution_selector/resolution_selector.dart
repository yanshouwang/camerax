import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'aspect_ratio_startegy.dart';
import 'resolution_filter.dart';
import 'resolution_mode.dart';
import 'resolution_strategy.dart';

final class ResolutionSelector extends $base.ResolutionSelector {
  final $native.ResolutionSelector obj;

  ResolutionSelector.$native(this.obj) : super.impl();

  factory ResolutionSelector({
    $base.ResolutionMode? allowedResolutionMode,
    $base.AspectRatioStrategy? aspectRatioStrategy,
    $base.ResolutionFilter? resolutionFilter,
    $base.ResolutionStrategy? resolutionStrategy,
  }) {
    if (aspectRatioStrategy is! AspectRatioStrategy? ||
        resolutionFilter is! ResolutionFilter? ||
        resolutionStrategy is! ResolutionStrategy?) {
      throw TypeError();
    }
    final obj = $native.ResolutionSelector(
      allowedResolutionMode: allowedResolutionMode?.obj,
      aspectRatioStrategy: aspectRatioStrategy?.obj,
      resolutionFilter: resolutionFilter?.obj,
      resolutionStrategy: resolutionStrategy?.obj,
    );
    return ResolutionSelector.$native(obj);
  }

  @override
  Future<$base.ResolutionMode> getAllowedResolutionMode() async {
    final obj = await this.obj.getAllowedResolutionMode();
    return obj.args;
  }

  @override
  Future<$base.AspectRatioStrategy> getAspectRatioStrategy() async {
    final obj = await this.obj.getAspectRatioStrategy();
    return AspectRatioStrategy.$native(obj);
  }

  @override
  Future<$base.ResolutionFilter?> getResolutionFilter() async {
    final obj = await this.obj.getResolutionFilter();
    return obj == null ? null : ResolutionFilter.$native(obj);
  }

  @override
  Future<$base.ResolutionStrategy?> getResolutionStrategy() async {
    final obj = await this.obj.getResolutionStrategy();
    return obj == null ? null : ResolutionStrategy.$native(obj);
  }
}
