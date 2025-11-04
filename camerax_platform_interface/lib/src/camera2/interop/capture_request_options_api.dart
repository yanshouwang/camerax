import 'package:camerax_platform_interface/src/camera2.dart';
import 'package:camerax_platform_interface/src/camerax_plugin.dart';

abstract base class CaptureRequestOptionsApi {
  CaptureRequestOptionsApi.impl();

  factory CaptureRequestOptionsApi({
    CameraMetadataControlMode? mode,
    CameraMetadataControlAeMode? aeMode,
    CameraMetadataControlAfMode? afMode,
    CameraMetadataControlAwbMode? awbMode,
    int? sensorExposureTime,
  }) => CameraXPlugin.instance.$CaptureRequestOptionsApi(
    mode: mode,
    aeMode: aeMode,
    afMode: afMode,
    awbMode: awbMode,
    sensorExposureTime: sensorExposureTime,
  );
}
