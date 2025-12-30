import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class CaptureRequest$KeyImpl<T> implements CaptureRequest$Key<T> {
  final CaptureRequestKeyProxyApi api;

  CaptureRequest$KeyImpl.internal(this.api);

  @override
  Future<String> getName() => api.getName();
}

final class CaptureRequestImpl implements CaptureRequest {}

final class CaptureRequestChannelImpl extends CaptureRequestChannel {
  @override
  CaptureRequest$Key<bool> get controlAeLock =>
      CaptureRequest$KeyImpl.internal(CaptureRequestProxyApi.controlAeLock);

  @override
  CaptureRequest$Key<CameraMetadata$ControlAeMode> get controlAeMode =>
      CaptureRequest$KeyImpl.internal(CaptureRequestProxyApi.controlAeMode);

  @override
  CaptureRequest$Key<CameraMetadata$ControlAfMode> get controlAfMode =>
      CaptureRequest$KeyImpl.internal(CaptureRequestProxyApi.controlAfMode);

  @override
  CaptureRequest$Key<bool> get controlAwbLock =>
      CaptureRequest$KeyImpl.internal(CaptureRequestProxyApi.controlAwbLock);

  @override
  CaptureRequest$Key<CameraMetadata$ControlAwbMode> get controlAwbMode =>
      CaptureRequest$KeyImpl.internal(CaptureRequestProxyApi.controlAwbMode);

  @override
  CaptureRequest$Key<CameraMetadata$ControlMode> get controlMode =>
      CaptureRequest$KeyImpl.internal(CaptureRequestProxyApi.controlMode);

  @override
  CaptureRequest$Key<double> get lensAperture =>
      CaptureRequest$KeyImpl.internal(CaptureRequestProxyApi.lensAperture);

  @override
  CaptureRequest$Key<int> get sensorExposureTime =>
      CaptureRequest$KeyImpl.internal(
        CaptureRequestProxyApi.sensorExposureTime,
      );

  @override
  CaptureRequest$Key<int> get sensorSensitivity =>
      CaptureRequest$KeyImpl.internal(CaptureRequestProxyApi.sensorSensitivity);
}

extension CaptureRequest$KeyX on CaptureRequest$Key {
  CaptureRequestKeyProxyApi get api {
    final impl = this;
    if (impl is! CaptureRequest$KeyImpl) throw TypeError();
    return impl.api;
  }
}
