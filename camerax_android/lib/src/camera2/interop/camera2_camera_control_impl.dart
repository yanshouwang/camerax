import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'capture_request_options_impl.dart';

final class Camera2CameraControlImpl extends Camera2CameraControlApi {
  final Camera2CameraControlProxyApi api;

  Camera2CameraControlImpl.internal(this.api) : super.impl();

  factory Camera2CameraControlImpl.from(CameraControlApi cameraControl) {
    final api = Camera2CameraControlProxyApi.from(
      cameraControl: cameraControl.api,
    );
    return Camera2CameraControlImpl.internal(api);
  }

  @override
  Future<void> addCaptureRequestOptions(CaptureRequestOptionsApi bundle) =>
      api.addCaptureRequestOptions(bundle.api);

  @override
  Future<void> clearCaptureRequestOptions() => api.clearCaptureRequestOptions();

  @override
  Future<CaptureRequestOptionsApi> getCaptureRequestOptions() =>
      api.getCaptureRequestOptions().then((e) => e.impl);

  @override
  Future<void> setCaptureRequestOptions(CaptureRequestOptionsApi bundle) =>
      api.setCaptureRequestOptions(bundle.api);
}
