import 'package:camerax_platform_interface/src/camera2.dart';
import 'package:camerax_platform_interface/src/core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class Camera2CameraControl {
  factory Camera2CameraControl.from(CameraControl cameraControl) =>
      Camera2CameraControlChannel.instance.from(cameraControl);

  Future<void> addCaptureRequestOptions(CaptureRequestOptions bundle);
  Future<void> clearCaptureRequestOptions();
  Future<CaptureRequestOptions> getCaptureRequestOptions();
  Future<void> setCaptureRequestOptions(CaptureRequestOptions bundle);
}

abstract base class Camera2CameraControlChannel extends PlatformInterface {
  Camera2CameraControlChannel() : super(token: _token);

  static final _token = Object();

  static Camera2CameraControlChannel? _instance;

  static Camera2CameraControlChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(Camera2CameraControlChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  Camera2CameraControl from(CameraControl cameraControl);
}
