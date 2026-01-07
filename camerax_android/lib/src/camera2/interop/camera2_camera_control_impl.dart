import 'package:camerax_android/src/camera2.dart';
import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class Camera2CameraControlImpl implements Camera2CameraControl {
  final Camera2CameraControlProxyApi api;

  Camera2CameraControlImpl.internal(this.api);

  @override
  Future<void> addCaptureRequestOptions(CaptureRequestOptions bundle) =>
      api.addCaptureRequestOptions(bundle.api);

  @override
  Future<void> clearCaptureRequestOptions() => api.clearCaptureRequestOptions();

  @override
  Future<CaptureRequestOptions> getCaptureRequestOptions() =>
      api.getCaptureRequestOptions().then((e) => e.impl);

  @override
  Future<void> setCaptureRequestOptions(CaptureRequestOptions bundle) =>
      api.setCaptureRequestOptions(bundle.api);
}

final class Camera2CameraControlChannelImpl
    extends Camera2CameraControlChannel {
  @override
  Camera2CameraControl from(CameraControl cameraControl) {
    final api = Camera2CameraControlProxyApi.from(
      cameraControl: cameraControl.api,
    );
    return Camera2CameraControlImpl.internal(api);
  }
}
