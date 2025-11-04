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

  factory QualitySelectorApi.from(
    QualityApi quality, {
    FallbackStrategyApi? fallbackStrategy,
  }) => CameraXPlugin.instance.$QualitySelectorApiFrom(
    quality,
    fallbackStrategy: fallbackStrategy,
  );

  factory QualitySelectorApi.fromOrderedList(
    List<QualityApi> qualities, {
    FallbackStrategyApi? fallbackStrategy,
  }) => CameraXPlugin.instance.$QualitySelectorApiFromOrderedList(
    qualities,
    fallbackStrategy: fallbackStrategy,
  );
}
