import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'capture_request_options_impl.dart';

final class Camera2CameraControlImpl extends Camera2CameraControl {
  final Camera2CameraControlApi api;

  Camera2CameraControlImpl.internal(this.api) : super.impl();

  factory Camera2CameraControlImpl.from(CameraControl cameraControl) {
    if (cameraControl is! CameraControlImpl) {
      throw TypeError();
    }
    final api = Camera2CameraControlApi.from(cameraControl: cameraControl.api);
    return Camera2CameraControlImpl.api(api);
  }

  @override
  Future<void> addCaptureRequestOptions(CaptureRequestOptions bundle) {
    if (bundle is! CaptureRequestOptionsImpl) {
      throw TypeError();
    }
    return api.addCaptureRequestOptions(bundle.api);
  }

  @override
  Future<void> clearCaptureRequestOptions() => api.clearCaptureRequestOptions();

  @override
  Future<CaptureRequestOptions> getCaptureRequestOptions() =>
      api.getCaptureRequestOptions().then((e) => e.impl);

  @override
  Future<void> setCaptureRequestOptions(CaptureRequestOptions bundle) {
    if (bundle is! CaptureRequestOptionsImpl) {
      throw TypeError();
    }
    return api.setCaptureRequestOptions(bundle.api);
  }
}
