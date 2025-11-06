import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'focus_metering_action_impl.dart';
import 'focus_metering_result_impl.dart';

final class CameraControlImpl extends CameraControl {
  final CameraControlProxyApi api;

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
  Future<FocusMeteringResult> startFocusAndMetering(
    FocusMeteringAction action,
  ) => api.startFocusAndMetering(action.api).then((e) => e.impl);

  @override
  Future<void> enableLowLightBoostAsync(bool lowLightBoost) =>
      api.enableLowLightBoostAsync(lowLightBoost);

  @override
  Future<void> setTorchStrengthLevel(int torchStrengthLevel) =>
      api.setTorchStrengthLevel(torchStrengthLevel);
}

extension CameraControlX on CameraControl {
  CameraControlProxyApi get api {
    final impl = this;
    if (impl is! CameraControlImpl) throw TypeError();
    return impl.api;
  }
}

extension CameraControlProxyApiX on CameraControlProxyApi {
  CameraControl get impl => CameraControlImpl.internal(this);
}
