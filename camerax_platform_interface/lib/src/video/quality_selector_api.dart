import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';

import 'fallback_strategy_api.dart';
import 'quality_api.dart';

abstract base class QualitySelectorApi {
  static Future<SizeApi?> getResolution(
    CameraInfoApi cameraInfo,
    QualityApi quality,
  ) => CameraXPlugin.instance.$QualitySelectorApiGetResolution(
    cameraInfo,
    quality,
  );

  QualitySelectorApi.impl();

  factory QualitySelectorApi.from1(QualityApi quality) =>
      CameraXPlugin.instance.$QualitySelectorApiFrom1(quality);

  factory QualitySelectorApi.from2(
    QualityApi quality,
    FallbackStrategyApi fallbackStrategy,
  ) => CameraXPlugin.instance.$QualitySelectorApiFrom2(
    quality,
    fallbackStrategy: fallbackStrategy,
  );

  factory QualitySelectorApi.fromOrderedList1(List<QualityApi> qualities) =>
      CameraXPlugin.instance.$QualitySelectorApiFromOrderedList1(qualities);

  factory QualitySelectorApi.fromOrderedList2(
    List<QualityApi> qualities,
    FallbackStrategyApi fallbackStrategy,
  ) => CameraXPlugin.instance.$QualitySelectorApiFromOrderedList2(
    qualities,
    fallbackStrategy: fallbackStrategy,
  );
}
