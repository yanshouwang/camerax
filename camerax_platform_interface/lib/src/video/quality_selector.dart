import 'package:camerax_platform_interface/src/camerax.dart';

import 'fallback_strategy.dart';
import 'quality.dart';

abstract interface class QualitySelector {
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
}
