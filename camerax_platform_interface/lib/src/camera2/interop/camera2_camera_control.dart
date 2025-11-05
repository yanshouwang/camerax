import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/core.dart';

import 'capture_request_options.dart';

abstract base class Camera2CameraControl {
  Camera2CameraControl.impl();

  factory Camera2CameraControl.from(CameraControl cameraControl) =>
      CameraXPlugin.instance.$Camera2CameraControlFrom(cameraControl);

  Future<void> addCaptureRequestOptions(CaptureRequestOptions bundle);
  Future<void> clearCaptureRequestOptions();
  Future<CaptureRequestOptions> getCaptureRequestOptions();
  Future<void> setCaptureRequestOptions(CaptureRequestOptions bundle);
}
