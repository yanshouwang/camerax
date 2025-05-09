import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

final _token = Object();

abstract interface class Camera2CameraInfo {
  factory Camera2CameraInfo.from(CameraInfo cameraInfo) {
    final instance =
        CameraXPlugin.instance.newCamera2CameraInfoFrom(cameraInfo);
    PlatformInterface.verify(instance as PlatformInterface, _token);
    return instance;
  }

  Future<Range<int>?> getSensorInfoExposureTimeRange();
}

abstract base class Camera2CameraInfoChannel extends PlatformInterface
    implements Camera2CameraInfo {
  Camera2CameraInfoChannel.impl() : super(token: _token);
}
