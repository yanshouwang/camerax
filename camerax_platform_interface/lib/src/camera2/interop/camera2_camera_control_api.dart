import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/core.dart';

import 'capture_request_options_api.dart';

abstract base class Camera2CameraControlApi {
  Camera2CameraControlApi.impl();

  factory Camera2CameraControlApi.from(CameraControlApi cameraControl) =>
      CameraXPlugin.instance.$Camera2CameraControlApiFrom(cameraControl);

  Future<void> addCaptureRequestOptions(CaptureRequestOptionsApi bundle);
  Future<void> clearCaptureRequestOptions();
  Future<CaptureRequestOptionsApi> getCaptureRequestOptions();
  Future<void> setCaptureRequestOptions(CaptureRequestOptionsApi bundle);
}
