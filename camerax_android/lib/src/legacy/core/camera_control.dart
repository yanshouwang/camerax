import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'focus_metering_action.dart';

final class CameraControl extends $base.CameraControl {
  final $native.CameraControl obj;

  CameraControl.$native(this.obj) : super.impl();

  @override
  Future<void> cancelFocusAndMetering() async {
    await obj.cancelFocusAndMetering();
  }

  @override
  Future<void> enableTorch(bool torch) async {
    await obj.enableTorch(torch);
  }

  @override
  Future<int> setExposureCompensationIndex(int value) async {
    final newValue = await obj.setExposureCompensationIndex(value);
    return newValue;
  }

  @override
  Future<void> setLinearZoom(double linearZoom) async {
    await obj.setLinearZoom(linearZoom);
  }

  @override
  Future<void> setZoomRatio(double ratio) async {
    await obj.setZoomRatio(ratio);
  }

  @override
  Future<void> startFocusAndMetering($base.FocusMeteringAction action) async {
    if (action is! FocusMeteringAction) {
      throw TypeError();
    }
    await obj.startFocusAndMetering(action.obj);
  }
}
