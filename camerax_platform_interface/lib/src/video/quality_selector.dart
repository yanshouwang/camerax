import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';

import 'fallback_strategy.dart';
import 'quality.dart';

abstract base class QualitySelector {
  static Future<Size<int>?> getResolution(
    CameraInfo cameraInfo,
    Quality quality,
  ) =>
      CameraXPlugin.instance.$QualitySelectorGetResolution(cameraInfo, quality);

  QualitySelector.impl();

  factory QualitySelector.from(
    Quality quality, {
    FallbackStrategy? fallbackStrategy,
  }) => CameraXPlugin.instance.newQualitySelectorFrom(
    quality,
    fallbackStrategy: fallbackStrategy,
  );

  factory QualitySelector.fromOrderedList(
    List<Quality> qualities, {
    FallbackStrategy? fallbackStrategy,
  }) => CameraXPlugin.instance.newQualitySelectorFromOrderedList(
    qualities,
    fallbackStrategy: fallbackStrategy,
  );
}
