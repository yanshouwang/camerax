import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'fallback_strategy.dart';
import 'quality.dart';

final _token = Object();

abstract interface class QualitySelector {
  factory QualitySelector.from(
    Quality quality, {
    FallbackStrategy? fallbackStrategy,
  }) {
    final instance = CameraXPlugin.instance.newQualitySelectorFrom(
      quality,
      fallbackStrategy: fallbackStrategy,
    );
    PlatformInterface.verify(instance as PlatformInterface, _token);
    return instance;
  }

  factory QualitySelector.fromOrderedList(
    List<Quality> qualities, {
    FallbackStrategy? fallbackStrategy,
  }) {
    final instance = CameraXPlugin.instance.newQualitySelectorFromOrderedList(
      qualities,
      fallbackStrategy: fallbackStrategy,
    );
    PlatformInterface.verify(instance as PlatformInterface, _token);
    return instance;
  }

  static Future<Size?> getResolution(CameraInfo cameraInfo, Quality quality) =>
      CameraXPlugin.instance.getResolution(cameraInfo, quality);
}

abstract base class QualitySelectorChannel extends PlatformInterface
    implements QualitySelector {
  QualitySelectorChannel.impl() : super(token: _token);
}
