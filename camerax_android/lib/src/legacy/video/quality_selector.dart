import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/common.dart';
import 'package:camerax_android/src/legacy/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

import 'fallback_strategy.dart';
import 'quality.dart';

final class QualitySelector extends $interface.QualitySelector {
  final $native.QualitySelector obj;

  QualitySelector.$native(this.obj) : super.impl();

  factory QualitySelector.from(
    $interface.Quality quality, {
    $interface.FallbackStrategy? fallbackStrategy,
  }) {
    if (fallbackStrategy is! FallbackStrategy?) {
      throw TypeError();
    }
    final obj = $native.QualitySelector.from(
      quality: quality.obj,
      fallbackStrategy: fallbackStrategy?.obj,
    );
    return QualitySelector.$native(obj);
  }

  factory QualitySelector.fromOrderedList(
    List<$interface.Quality> qualities, {
    $interface.FallbackStrategy? fallbackStrategy,
  }) {
    if (fallbackStrategy is! FallbackStrategy?) {
      throw TypeError();
    }
    final obj = $native.QualitySelector.fromOrderedList(
      qualities: qualities.map((quality) => quality.obj).toList(),
      fallbackStrategy: fallbackStrategy?.obj,
    );
    return QualitySelector.$native(obj);
  }

  static Future<$interface.Size?> getResolution(
      $interface.CameraInfo cameraInfo, $interface.Quality quality) async {
    if (cameraInfo is! CameraInfo) {
      throw TypeError();
    }
    final obj = await $native.QualitySelector.getResolution(
        cameraInfo.obj, quality.obj);
    return obj?.args;
  }
}
