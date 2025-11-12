import 'package:camerax_platform_interface/src/camera2.dart';
import 'package:camerax_platform_interface/src/camerax_plugin.dart';

abstract base class CaptureRequestOptions {
  CaptureRequestOptions.impl();

  factory CaptureRequestOptions({
    CameraMetadataControlMode? mode,
    CameraMetadataControlAeMode? aeMode,
    CameraMetadataControlAfMode? afMode,
    CameraMetadataControlAwbMode? awbMode,
    int? sensorExposureTime,
  }) => CameraXPlugin.instance.$CaptureRequestOptions(
    mode: mode,
    aeMode: aeMode,
    afMode: afMode,
    awbMode: awbMode,
    sensorExposureTime: sensorExposureTime,
  );
}
