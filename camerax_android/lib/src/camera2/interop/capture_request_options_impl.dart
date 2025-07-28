import 'package:camerax_android/src/camera2.dart';
import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class CaptureRequestOptionsImpl extends CaptureRequestOptions {
  final CaptureRequestOptionsApi api;

  CaptureRequestOptionsImpl.internal(this.api) : super.impl();

  factory CaptureRequestOptionsImpl({
    ControlMode? mode,
    ControlAeMode? aeMode,
    ControlAfMode? afMode,
    ControlAwbMode? awbMode,
    int? sensorExposureTime,
  }) {
    final api = CaptureRequestOptionsApi.build(
      mode: mode?.api,
      aeMode: aeMode?.api,
      afMode: afMode?.api,
      awbMode: awbMode?.api,
      sensorExposureTime: sensorExposureTime,
    );
    return CaptureRequestOptionsImpl.internal(api);
  }
}

extension CaptureRequestOptioinsApiX on CaptureRequestOptionsApi {
  CaptureRequestOptions get impl => CaptureRequestOptionsImpl.internal(this);
}
