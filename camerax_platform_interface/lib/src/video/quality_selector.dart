import 'package:camerax_platform_interface/src/camerax.dart';
import 'package:camerax_platform_interface/src/core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'fallback_strategy.dart';
import 'quality.dart';

abstract base class QualitySelector extends PlatformInterface {
  static final _token = Object();

  QualitySelector.impl() : super(token: _token);

  factory QualitySelector.from(
    Quality quality, {
    FallbackStrategy? fallbackStrategy,
  }) =>
      CameraX.instance.createQualitySelectorFrom(
        quality,
        fallbackStrategy: fallbackStrategy,
      );

  factory QualitySelector.fromOrderedList(
    List<Quality> qualities, {
    FallbackStrategy? fallbackStrategy,
  }) =>
      CameraX.instance.createQualitySelectorFromOrderedList(
        qualities,
        fallbackStrategy: fallbackStrategy,
      );

  Future<Size?> getResolution(CameraInfo cameraInfo, Quality quality);
}
