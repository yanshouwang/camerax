import 'package:camerax_platform_interface/src/camera2.dart';
import 'package:camerax_platform_interface/src/core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class Camera2CameraInfo {
  factory Camera2CameraInfo.from(CameraInfo cameraInfo) =>
      Camera2CameraInfoChannel.instance.from(cameraInfo);

  Future<String> getCameraId();
  Future<T?> getCameraCharacteristic<T>(CameraCharacteristics$Key<T> key);
}

abstract base class Camera2CameraInfoChannel extends PlatformInterface {
  Camera2CameraInfoChannel() : super(token: _token);

  static final _token = Object();

  static Camera2CameraInfoChannel? _instance;

  static Camera2CameraInfoChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(Camera2CameraInfoChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  Camera2CameraInfo from(CameraInfo cameraInfo);
}
