import 'package:camerax_platform_interface/src/core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class CameraFilter {
  factory CameraFilter({
    required List<CameraInfo> Function(List<CameraInfo> cameraInfos) filter,
  }) => CameraFilterChannel.instance.create(filter: filter);
}

abstract base class CameraFilterChannel extends PlatformInterface {
  CameraFilterChannel() : super(token: _token);

  static final _token = Object();

  static CameraFilterChannel? _instance;

  static CameraFilterChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(CameraFilterChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  CameraFilter create({
    required List<CameraInfo> Function(List<CameraInfo> cameraInfos) filter,
  });
}
