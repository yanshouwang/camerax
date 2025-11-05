import 'package:camerax_android/src/camera2.dart';
import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class CaptureRequestOptionsImpl extends CaptureRequestOptions {
  final CaptureRequestOptionsProxyApi api;

  CaptureRequestOptionsImpl.internal(this.api) : super.impl();

  factory CaptureRequestOptionsImpl({
    CameraMetadataControlMode? mode,
    CameraMetadataControlAeMode? aeMode,
    CameraMetadataControlAfMode? afMode,
    CameraMetadataControlAwbMode? awbMode,
    int? sensorExposureTime,
  }) {
    final api = CaptureRequestOptionsProxyApi.build(
      mode: mode?.api,
      aeMode: aeMode?.api,
      afMode: afMode?.api,
      awbMode: awbMode?.api,
      sensorExposureTime: sensorExposureTime,
    );
    return CaptureRequestOptionsImpl.internal(api);
  }
}

extension CaptureRequestOptionsApiX on CaptureRequestOptions {
  CaptureRequestOptionsProxyApi get api {
    final impl = this;
    if (impl is! CaptureRequestOptionsImpl) throw TypeError();
    return impl.api;
  }
}

extension CaptureRequestOptionsProxyApiX on CaptureRequestOptionsProxyApi {
  CaptureRequestOptions get impl => CaptureRequestOptionsImpl.internal(this);
}
