import 'package:camerax/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;
import 'package:meta/meta.dart';

import 'fallback_strategy.dart';

final class QualitySelector {
  final $interface.QualitySelector _obj;

  QualitySelector._native(this._obj);

  QualitySelector.from(
    $interface.Quality quality, {
    FallbackStrategy? fallbackStrategy,
  }) : _obj = $interface.QualitySelector.from(
          quality,
          fallbackStrategy: fallbackStrategy?.obj,
        );

  QualitySelector.fromOrderedList(
    List<$interface.Quality> qualities, {
    FallbackStrategy? fallbackStrategy,
  }) : _obj = $interface.QualitySelector.fromOrderedList(
          qualities,
          fallbackStrategy: fallbackStrategy?.obj,
        );

  static Future<$interface.Size?> getResolution(
          CameraInfo cameraInfo, $interface.Quality quality) =>
      $interface.QualitySelector.getResolution(cameraInfo.obj, quality);

  @internal
  $interface.QualitySelector get obj => _obj;
}

extension QualitySelectorObj on $interface.QualitySelector {
  @internal
  QualitySelector get args {
    return QualitySelector._native(this);
  }
}
