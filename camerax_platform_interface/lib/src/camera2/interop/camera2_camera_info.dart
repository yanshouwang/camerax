import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';

abstract base class Camera2CameraInfo {
  Camera2CameraInfo.impl();

  factory Camera2CameraInfo.from(CameraInfo cameraInfo) {
    return CameraXPlugin.instance.newCamera2CameraInfoFrom(cameraInfo);
  }

  Future<Range<int>?> getSensorInfoExposureTimeRange();
}
