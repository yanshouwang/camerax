import 'package:camerax_android/src/legacy.dart';
import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'fallback_strategy.dart';
import 'quality.dart';

final class QualitySelector extends $base.QualitySelector {
  final $native.QualitySelector obj;

  QualitySelector.$native(this.obj) : super.impl();

  factory QualitySelector.from(
    $base.Quality quality, {
    $base.FallbackStrategy? fallbackStrategy,
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
    List<$base.Quality> qualities, {
    $base.FallbackStrategy? fallbackStrategy,
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

  @override
  Future<$base.Size?> getResolution(
      $base.CameraInfo cameraInfo, $base.Quality quality) async {
    if (cameraInfo is! CameraInfo) {
      throw TypeError();
    }
    final obj = await this.obj.getResolution(cameraInfo.obj, quality.obj);
    return obj == null ? null : Size.$native(obj);
  }
}
