import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'focus_metering_action_impl.dart';

final class CameraControlImpl extends CameraControl {
  final CameraControlApi api;

  CameraControlImpl.internal(this.api) : super.impl();

  @override
  Future<void> cancelFocusAndMetering() => api.cancelFocusAndMetering();

  @override
  Future<void> enableTorch(bool torch) => api.enableTorch(torch);

  @override
  Future<int> setExposureCompensationIndex(int value) =>
      api.setExposureCompensationIndex(value);

  @override
  Future<void> setLinearZoom(double linearZoom) =>
      api.setLinearZoom(linearZoom);

  @override
  Future<void> setZoomRatio(double ratio) => api.setZoomRatio(ratio);

  @override
  Future<bool> startFocusAndMetering(FocusMeteringAction action) {
    if (action is! FocusMeteringActionImpl) {
      throw TypeError();
    }
    return api
        .startFocusAndMetering(action.api)
        .then((e) => e.isFocusSuccessful);
  }
}

extension CameraControlApiX on CameraControlApi {
  CameraControl get impl => CameraControlImpl.internal(this);
}
