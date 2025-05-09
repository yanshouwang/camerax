import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'capture_request_options.dart';

final _token = Object();

abstract interface class Camera2CameraControl {
  factory Camera2CameraControl.from(CameraControl cameraControl) {
    final instance =
        CameraXPlugin.instance.newCamera2CameraControlFrom(cameraControl);
    PlatformInterface.verify(instance as PlatformInterface, _token);
    return instance;
  }

  Future<void> addCaptureRequestOptions(CaptureRequestOptions bundle);
  Future<void> clearCaptureRequestOptions();
  Future<CaptureRequestOptions> getCaptureRequestOptions();
  Future<void> setCaptureRequestOptions(CaptureRequestOptions bundle);
}

abstract base class Camera2CameraControlChannel extends PlatformInterface
    implements Camera2CameraControl {
  Camera2CameraControlChannel.impl() : super(token: _token);
}
