import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/camera2.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class CaptureResult$KeyImpl<T> implements CaptureResult$Key<T> {
  final CaptureResultKeyProxyApi api;

  CaptureResult$KeyImpl.internal(this.api);

  @override
  Future<String> getName() => api.getName();
}

base class CaptureResultImpl extends CameraMetadataImpl<CaptureResult$Key>
    implements CaptureResult {
  final CaptureResultProxyApi api;

  CaptureResultImpl.internal(this.api);

  @override
  Future<T?> get<T>(CaptureResult$Key<T> key) {
    final keyApi = key.api;
    if (keyApi is CaptureResultIntKeyProxyApi) {
      return api.getInt(keyApi).then((e) => e as T?);
    }
    if (keyApi is CaptureResultLongKeyProxyApi) {
      return api.getLong(keyApi).then((e) => e as T?);
    }
    if (keyApi is CaptureResultFloatKeyProxyApi) {
      return api.getFloat(keyApi).then((e) => e as T?);
    }
    if (keyApi is CaptureResultBooleanKeyProxyApi) {
      return api.getBoolean(keyApi).then((e) => e as T?);
    }
    if (keyApi is CaptureResultCameraMetadataControlModeKeyProxyApi) {
      return api
          .getCameraMetadataControlMode(keyApi)
          .then((e) => e?.impl as T?);
    }
    if (keyApi is CaptureResultCameraMetadataControlAeModeKeyProxyApi) {
      return api
          .getCameraMetadataControlAeMode(keyApi)
          .then((e) => e?.impl as T?);
    }
    if (keyApi is CaptureResultCameraMetadataControlAfModeKeyProxyApi) {
      return api
          .getCameraMetadataControlAfMode(keyApi)
          .then((e) => e?.impl as T?);
    }
    if (keyApi is CaptureResultCameraMetadataControlAwbModeKeyProxyApi) {
      return api
          .getCameraMetadataControlAwbMode(keyApi)
          .then((e) => e?.impl as T?);
    }
    throw TypeError();
  }

  @override
  Future<String> getCameraId() => api.getCameraId();

  @override
  Future<int> getFrameNumber() => api.getFrameNumber();

  @override
  Future<CaptureRequest> getRequest() => api.getRequest().then((e) => e.impl);

  @override
  Future<int> getSequenceId() => api.getSequenceId();
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

extension CaptureResult$KeyX on CaptureResult$Key {
  CaptureResultKeyProxyApi get api {
    final impl = this;
    if (impl is! CaptureResult$KeyImpl) throw TypeError();
    return impl.api;
  }
}

extension CaptureResultProxyApiX on CaptureResultProxyApi {
  CaptureResult get impl => CaptureResultImpl.internal(this);
}
