import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';

abstract base class Camera2CameraInfoApi {
  Camera2CameraInfoApi.impl();

  factory Camera2CameraInfoApi.from(CameraInfoApi cameraInfo) {
    return CameraXPlugin.instance.$Camera2CameraInfoApiFrom(cameraInfo);
  }

  Future<RangeApi?> getSensorInfoExposureTimeRange();
}
