import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/camera2.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class Camera2Interop$ExtenderImpl<T>
    implements Camera2Interop$Extender<T> {}

final class Camera2Interop$CaptureRequestOptions$ExtenderImpl
    extends Camera2Interop$ExtenderImpl<CaptureRequestOptions$Builder> {
  final Camera2InteropCaptureRequestOptionsExtenderProxyApi api;

  Camera2Interop$CaptureRequestOptions$ExtenderImpl.internal(this.api);

  @override
  Future<Camera2Interop$Extender<CaptureRequestOptions$Builder>>
  setCaptureRequestOption<ValueT>(
    CaptureRequest$Key<ValueT> key,
    ValueT value,
  ) {
    final keyApi = key.api;
    if (keyApi is CaptureRequestIntKeyProxyApi && value is int) {
      return api.setIntCaptureRequestOption(keyApi, value).then((e) => e.impl);
    }
    if (keyApi is CaptureRequestLongKeyProxyApi && value is int) {
      return api.setLongCaptureRequestOption(keyApi, value).then((e) => e.impl);
    }
    if (keyApi is CaptureRequestFloatKeyProxyApi && value is double) {
      return api
          .setFloatCaptureRequestOption(keyApi, value)
          .then((e) => e.impl);
    }
    if (keyApi is CaptureRequestBooleanKeyProxyApi && value is bool) {
      return api
          .setBooleanCaptureRequestOption(keyApi, value)
          .then((e) => e.impl);
    }
    if (keyApi is CaptureRequestCameraMetadataControlModeKeyProxyApi &&
        value is CameraMetadata$ControlMode) {
      return api
          .setCameraMetadataControlModeCaptureRequestOption(keyApi, value.api)
          .then((e) => e.impl);
    }
    if (keyApi is CaptureRequestCameraMetadataControlAeModeKeyProxyApi &&
        value is CameraMetadata$ControlAeMode) {
      return api
          .setCameraMetadataControlAeModeCaptureRequestOption(keyApi, value.api)
          .then((e) => e.impl);
    }
    if (keyApi is CaptureRequestCameraMetadataControlAfModeKeyProxyApi &&
        value is CameraMetadata$ControlAfMode) {
      return api
          .setCameraMetadataControlAfModeCaptureRequestOption(keyApi, value.api)
          .then((e) => e.impl);
    }
    if (keyApi is CaptureRequestCameraMetadataControlAwbModeKeyProxyApi &&
        value is CameraMetadata$ControlAwbMode) {
      return api
          .setCameraMetadataControlAwbModeCaptureRequestOption(
            keyApi,
            value.api,
          )
          .then((e) => e.impl);
    }
    throw TypeError();
  }

  @override
  Future<Camera2Interop$Extender<CaptureRequestOptions$Builder>>
  setPhysicalCameraId(String cameraId) =>
      api.setPhysicalCameraId(cameraId).then((e) => e.impl);

  @override
  Future<Camera2Interop$Extender<CaptureRequestOptions$Builder>>
  setSessionCaptureCallback(
    CameraCaptureSession$CaptureCallback captureCallback,
  ) => api.setSessionCaptureCallback(captureCallback.api).then((e) => e.impl);

  @override
  Future<Camera2Interop$Extender<CaptureRequestOptions$Builder>>
  setSessionStateCallback(CameraCaptureSession$StateCallback stateCallback) =>
      api.setSessionStateCallback(stateCallback.api).then((e) => e.impl);
}

final class Camera2InteropChannelImpl extends Camera2InteropChannel {
  @override
  Camera2Interop$Extender<T> createExtender<T>(
    ExtendableBuilder<T> baseBuilder,
  ) {
    final baseBuilderApi = baseBuilder.api;
    if (baseBuilderApi is CaptureRequestOptionsBuilderProxyApi) {
      final api = Camera2InteropCaptureRequestOptionsExtenderProxyApi(
        baseBuilder: baseBuilderApi,
      );
      return Camera2Interop$CaptureRequestOptions$ExtenderImpl.internal(api)
          as Camera2Interop$Extender<T>;
    }
    throw TypeError();
  }
}

extension Camera2InteropCaptureRequestOptionsExtenderProxyApiX
    on Camera2InteropCaptureRequestOptionsExtenderProxyApi {
  Camera2Interop$Extender<CaptureRequestOptions$Builder> get impl =>
      Camera2Interop$CaptureRequestOptions$ExtenderImpl.internal(this);
}
