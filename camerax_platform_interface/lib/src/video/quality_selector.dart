import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'fallback_strategy.dart';
import 'quality.dart';

abstract interface class QualitySelector {
  factory QualitySelector.from(
    Quality quality, {
    FallbackStrategy? fallbackStrategy,
  }) =>
      CameraXPlugin.instance.createQualitySelectorFrom(
        quality,
        fallbackStrategy: fallbackStrategy,
      );

  factory QualitySelector.fromOrderedList(
    List<Quality> qualities, {
    FallbackStrategy? fallbackStrategy,
  }) =>
      CameraXPlugin.instance.createQualitySelectorFromOrderedList(
        qualities,
        fallbackStrategy: fallbackStrategy,
      );
}
