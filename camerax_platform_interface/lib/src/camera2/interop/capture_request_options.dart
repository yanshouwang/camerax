import 'package:camerax_platform_interface/src/camera2.dart';
import 'package:camerax_platform_interface/src/camerax_plugin.dart';

abstract base class CaptureRequestOptions {
  CaptureRequestOptions.impl();

  factory CaptureRequestOptions({
    ControlMode? mode,
    ControlAeMode? aeMode,
    ControlAfMode? afMode,
    ControlAwbMode? awbMode,
    int? sensorExposureTime,
  }) =>
      CameraXPlugin.instance.newCaptureRequestOptions(
        mode: mode,
        aeMode: aeMode,
        afMode: afMode,
        awbMode: awbMode,
        sensorExposureTime: sensorExposureTime,
      );
}
