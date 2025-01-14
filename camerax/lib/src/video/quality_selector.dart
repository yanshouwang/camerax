import 'package:camerax/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;
import 'package:meta/meta.dart';

import 'fallback_strategy.dart';

final class QualitySelector {
  final $base.QualitySelector _obj;

  QualitySelector._native(this._obj);

  QualitySelector.from(
    $base.Quality quality, {
    FallbackStrategy? fallbackStrategy,
  }) : _obj = $base.QualitySelector.from(
          quality,
          fallbackStrategy: fallbackStrategy?.obj,
        );

  QualitySelector.fromOrderedList(
    List<$base.Quality> qualities, {
    FallbackStrategy? fallbackStrategy,
  }) : _obj = $base.QualitySelector.fromOrderedList(
          qualities,
          fallbackStrategy: fallbackStrategy?.obj,
        );

  static Future<$base.Size?> getResolution(
          CameraInfo cameraInfo, $base.Quality quality) =>
      $base.QualitySelector.getResolution(cameraInfo.obj, quality);

  @internal
  $base.QualitySelector get obj => _obj;
}

extension QualitySelectorObj on $base.QualitySelector {
  @internal
  QualitySelector get args {
    return QualitySelector._native(this);
  }
}
