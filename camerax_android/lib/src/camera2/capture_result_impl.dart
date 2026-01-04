import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/camera2.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class CaptureResult$KeyImpl<T> implements CaptureResult$Key<T> {
  final CaptureResultKeyProxyApi api;

  CaptureResult$KeyImpl.internal(this.api);

  @override
  Future<String> getName() => api.getName();
}

final class CaptureResultImpl extends CameraMetadataImpl<CaptureResult$Key>
    implements CaptureResult {
  final CaptureResultProxyApi api;

  CaptureResultImpl.internal(this.api);
}

final class CaptureResultChannelImpl extends CaptureResultChannel {
  @override
  CaptureResult$Key<bool> get controlAeLock =>
      CaptureResult$KeyImpl.internal(CaptureResultProxyApi.controlAeLock);
  @override
  CaptureResult$Key<CameraMetadata$ControlAeMode> get controlAeMode =>
      CaptureResult$KeyImpl.internal(CaptureResultProxyApi.controlAeMode);
  @override
  CaptureResult$Key<CameraMetadata$ControlAfMode> get controlAfMode =>
      CaptureResult$KeyImpl.internal(CaptureResultProxyApi.controlAfMode);
  @override
  CaptureResult$Key<bool> get controlAwbLock =>
      CaptureResult$KeyImpl.internal(CaptureResultProxyApi.controlAwbLock);
  @override
  CaptureResult$Key<CameraMetadata$ControlAwbMode> get controlAwbMode =>
      CaptureResult$KeyImpl.internal(CaptureResultProxyApi.controlAwbMode);
  @override
  CaptureResult$Key<CameraMetadata$ControlMode> get controlMode =>
      CaptureResult$KeyImpl.internal(CaptureResultProxyApi.controlMode);
  @override
  CaptureResult$Key<double> get lensAperture =>
      CaptureResult$KeyImpl.internal(CaptureResultProxyApi.lensAperture);
  @override
  CaptureResult$Key<int> get sensorExposureTime =>
      CaptureResult$KeyImpl.internal(CaptureResultProxyApi.sensorExposureTime);
  @override
  CaptureResult$Key<int> get sensorSensitivity =>
      CaptureResult$KeyImpl.internal(CaptureResultProxyApi.sensorSensitivity);
}

extension CaptureResultProxyApiX on CaptureResultProxyApi {
  CaptureResult get impl => CaptureResultImpl.internal(this);
}
