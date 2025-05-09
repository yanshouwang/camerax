import 'package:camerax_platform_interface/src/camera2.dart';
import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

final _token = Object();

abstract interface class CaptureRequestOptions {
  factory CaptureRequestOptions({
    ControlMode? mode,
    ControlAeMode? aeMode,
    ControlAfMode? afMode,
    ControlAwbMode? awbMode,
    int? sensorExposureTime,
  }) {
    final instance = CameraXPlugin.instance.newCaptureRequestOptions(
      mode: mode,
      aeMode: aeMode,
      afMode: afMode,
      awbMode: awbMode,
      sensorExposureTime: sensorExposureTime,
    );
    PlatformInterface.verify(instance as PlatformInterface, _token);
    return instance;
  }
}

abstract base class CaptureRequestOptionsChannel extends PlatformInterface
    implements CaptureRequestOptions {
  CaptureRequestOptionsChannel.impl() : super(token: _token);
}
