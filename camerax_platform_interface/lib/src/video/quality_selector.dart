import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';
import 'package:camerax_platform_interface/src/video.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class QualitySelector {
  static Future<Size<int>?> getResolution(
    CameraInfo cameraInfo,
    Quality quality,
  ) => QualitySelectorChannel.instance.getResolution(cameraInfo, quality);

  factory QualitySelector.from(
    Quality quality, [
    FallbackStrategy? fallbackStrategy,
  ]) => QualitySelectorChannel.instance.from(quality, fallbackStrategy);

  factory QualitySelector.fromOrderedList(
    List<Quality> qualities, [
    FallbackStrategy? fallbackStrategy,
  ]) => QualitySelectorChannel.instance.fromOrderedList(
    qualities,
    fallbackStrategy,
  );
}

abstract base class QualitySelectorChannel extends PlatformInterface {
  QualitySelectorChannel() : super(token: _token);

  static final _token = Object();

  static QualitySelectorChannel? _instance;

  static QualitySelectorChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(QualitySelectorChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  Future<Size<int>?> getResolution(CameraInfo cameraInfo, Quality quality);

  QualitySelector from(Quality quality, [FallbackStrategy? fallbackStrategy]);
  QualitySelector fromOrderedList(
    List<Quality> qualities, [
    FallbackStrategy? fallbackStrategy,
  ]);
}
