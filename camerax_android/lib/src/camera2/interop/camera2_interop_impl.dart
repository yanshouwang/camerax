import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/camera2.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class Camera2Interop$ExtenderImpl<T>
    implements Camera2Interop$Extender<T> {
  final Camera2InteropExtenderProxyApi api;

  Camera2Interop$ExtenderImpl.internal(this.api);

  @override
  Future<Camera2Interop$Extender<T>> setCaptureRequestOption<ValueT>(
    CaptureRequest$Key<ValueT> key,
    ValueT value,
  ) {
    final keyApi = key.api;
    if (keyApi is CaptureRequestIntKeyProxyApi) {
      if (value is int) {
        return api
            .setIntCaptureRequestOption(keyApi, value)
            .then((e) => e.impl<T>());
      }
      if (value is CameraMetadata$ControlMode) {
        return CameraMetadataUtilProxyApi.toControlMode(value.api)
            .then((e) => api.setIntCaptureRequestOption(keyApi, e))
            .then((e) => e.impl<T>());
      }
      if (value is CameraMetadata$ControlAeMode) {
        return CameraMetadataUtilProxyApi.toControlAeMode(value.api)
            .then((e) => api.setIntCaptureRequestOption(keyApi, e))
            .then((e) => e.impl<T>());
      }
      if (value is CameraMetadata$ControlAfMode) {
        return CameraMetadataUtilProxyApi.toControlAfMode(value.api)
            .then((e) => api.setIntCaptureRequestOption(keyApi, e))
            .then((e) => e.impl<T>());
      }
      if (value is CameraMetadata$ControlAwbMode) {
        return CameraMetadataUtilProxyApi.toControlAwbMode(value.api)
            .then((e) => api.setIntCaptureRequestOption(keyApi, e))
            .then((e) => e.impl<T>());
      }
    }
    if (keyApi is CaptureRequestLongKeyProxyApi && value is int) {
      return api
          .setLongCaptureRequestOption(keyApi, value)
          .then((e) => e.impl<T>());
    }
    if (keyApi is CaptureRequestFloatKeyProxyApi && value is double) {
      return api
          .setFloatCaptureRequestOption(keyApi, value)
          .then((e) => e.impl<T>());
    }
    if (keyApi is CaptureRequestBooleanKeyProxyApi && value is bool) {
      return api
          .setBooleanCaptureRequestOption(keyApi, value)
          .then((e) => e.impl<T>());
    }
    throw TypeError();
  }

  @override
  Future<Camera2Interop$Extender<T>> setPhysicalCameraId(String cameraId) =>
      api.setPhysicalCameraId(cameraId).then((e) => e.impl<T>());

  @override
  Future<Camera2Interop$Extender<T>> setSessionCaptureCallback(
    CameraCaptureSession$CaptureCallback captureCallback,
  ) => api
      .setSessionCaptureCallback(captureCallback.api)
      .then((e) => e.impl<T>());

  @override
  Future<Camera2Interop$Extender<T>> setSessionStateCallback(
    CameraCaptureSession$StateCallback stateCallback,
  ) => api.setSessionStateCallback(stateCallback.api).then((e) => e.impl<T>());
}

final class Camera2InteropChannelImpl extends Camera2InteropChannel {
  @override
  Camera2Interop$Extender<T> createExtender<T>(
    ExtendableBuilder<T> baseBuilder,
  ) {
    switch (baseBuilder) {
      case CaptureRequestOptions$BuilderImpl impl:
        final api =
            Camera2InteropExtenderProxyApi.fromCaptureRequestOptionsBuilder(
              builder: impl.api,
            );
        return Camera2Interop$ExtenderImpl<T>.internal(api);
      default:
        throw TypeError();
    }
  }
}

extension Camera2InteropExtenderProxyApiX on Camera2InteropExtenderProxyApi {
  Camera2Interop$Extender<T> impl<T>() =>
      Camera2Interop$ExtenderImpl<T>.internal(this);
}
