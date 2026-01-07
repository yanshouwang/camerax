import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/camera2.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class CaptureRequest$KeyImpl<T> implements CaptureRequest$Key<T> {
  final CaptureRequestKeyProxyApi api;

  CaptureRequest$KeyImpl.internal(this.api);

  @override
  Future<String> getName() => api.getName();
}

final class CaptureRequestImpl extends CameraMetadataImpl<CaptureRequest$Key>
    implements CaptureRequest {
  final CaptureRequestProxyApi api;

  CaptureRequestImpl.internal(this.api);

  @override
  Future<T?> get<T>(CaptureRequest$Key<T> key) {
    final keyApi = key.api;
    if (keyApi is CaptureRequestIntKeyProxyApi) {
      return api.getInt(keyApi).then((e) => e as T?);
    }
    if (keyApi is CaptureRequestLongKeyProxyApi) {
      return api.getLong(keyApi).then((e) => e as T?);
    }
    if (keyApi is CaptureRequestFloatKeyProxyApi) {
      return api.getFloat(keyApi).then((e) => e as T?);
    }
    if (keyApi is CaptureRequestBooleanKeyProxyApi) {
      return api.getBoolean(keyApi).then((e) => e as T?);
    }
    if (keyApi is CaptureRequestCameraMetadataControlModeKeyProxyApi) {
      return api
          .getCameraMetadataControlMode(keyApi)
          .then((e) => e?.impl as T?);
    }
    if (keyApi is CaptureRequestCameraMetadataControlAeModeKeyProxyApi) {
      return api
          .getCameraMetadataControlAeMode(keyApi)
          .then((e) => e?.impl as T?);
    }
    if (keyApi is CaptureRequestCameraMetadataControlAfModeKeyProxyApi) {
      return api
          .getCameraMetadataControlAfMode(keyApi)
          .then((e) => e?.impl as T?);
    }
    if (keyApi is CaptureRequestCameraMetadataControlAwbModeKeyProxyApi) {
      return api
          .getCameraMetadataControlAwbMode(keyApi)
          .then((e) => e?.impl as T?);
    }
    throw TypeError();
  }

  @override
  Future<bool> isReprocess() => api.isReprocess();
}

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

extension CaptureRequestProxyApiX on CaptureRequestProxyApi {
  CaptureRequest get impl => CaptureRequestImpl.internal(this);
}
