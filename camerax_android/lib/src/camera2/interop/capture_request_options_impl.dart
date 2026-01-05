import 'package:camerax_android/src/camera2.dart';
import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class CaptureRequestOptions$BuilderImpl
    extends ExtendableBuilderImpl<CaptureRequestOptions>
    implements CaptureRequestOptions$Builder {
  @override
  final CaptureRequestOptionsBuilderProxyApi api;

  CaptureRequestOptions$BuilderImpl.internal(this.api);

  @override
  Future<CaptureRequestOptions$Builder> clearCaptureRequestOption<ValueT>(
    CaptureRequest$Key<ValueT> key,
  ) {
    final keyApi = key.api;
    if (keyApi is CaptureRequestIntKeyProxyApi) {
      return api.clearIntCaptureRequestOption(keyApi).then((e) => e.impl);
    }
    if (keyApi is CaptureRequestLongKeyProxyApi) {
      return api.clearLongCaptureRequestOption(keyApi).then((e) => e.impl);
    }
    if (keyApi is CaptureRequestFloatKeyProxyApi) {
      return api.clearFloatCaptureRequestOption(keyApi).then((e) => e.impl);
    }
    if (keyApi is CaptureRequestBooleanKeyProxyApi) {
      return api.clearBooleanCaptureRequestOption(keyApi).then((e) => e.impl);
    }
    if (keyApi is CaptureRequestCameraMetadataControlModeKeyProxyApi) {
      return api
          .clearCameraMetadataControlModeCaptureRequestOption(keyApi)
          .then((e) => e.impl);
    }
    if (keyApi is CaptureRequestCameraMetadataControlAeModeKeyProxyApi) {
      return api
          .clearCameraMetadataControlAeModeCaptureRequestOption(keyApi)
          .then((e) => e.impl);
    }
    if (keyApi is CaptureRequestCameraMetadataControlAfModeKeyProxyApi) {
      return api
          .clearCameraMetadataControlAfModeCaptureRequestOption(keyApi)
          .then((e) => e.impl);
    }
    if (keyApi is CaptureRequestCameraMetadataControlAwbModeKeyProxyApi) {
      return api
          .clearCameraMetadataControlAwbModeCaptureRequestOption(keyApi)
          .then((e) => e.impl);
    }
    throw TypeError();
  }

  @override
  Future<CaptureRequestOptions$Builder> setCaptureRequestOption<ValueT>(
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
  Future<CaptureRequestOptions> build() => api.build().then((e) => e.impl);
}

final class CaptureRequestOptionsImpl implements CaptureRequestOptions {
  final CaptureRequestOptionsProxyApi api;

  CaptureRequestOptionsImpl.internal(this.api);

  @override
  Future<ValueT?> getCaptureRequestOption<ValueT>(
    CaptureRequest$Key<ValueT> key,
  ) {
    final keyApi = key.api;
    if (keyApi is CaptureRequestIntKeyProxyApi) {
      return api.getIntCaptureRequestOption(keyApi).then((e) => e as ValueT?);
    }
    if (keyApi is CaptureRequestLongKeyProxyApi) {
      return api.getLongCaptureRequestOption(keyApi).then((e) => e as ValueT?);
    }
    if (keyApi is CaptureRequestFloatKeyProxyApi) {
      return api.getFloatCaptureRequestOption(keyApi).then((e) => e as ValueT?);
    }
    if (keyApi is CaptureRequestBooleanKeyProxyApi) {
      return api
          .getBooleanCaptureRequestOption(keyApi)
          .then((e) => e as ValueT?);
    }
    if (keyApi is CaptureRequestCameraMetadataControlModeKeyProxyApi) {
      return api
          .getCameraMetadataControlModeCaptureRequestOption(keyApi)
          .then((e) => e?.impl as ValueT?);
    }
    if (keyApi is CaptureRequestCameraMetadataControlAeModeKeyProxyApi) {
      return api
          .getCameraMetadataControlAeModeCaptureRequestOption(keyApi)
          .then((e) => e?.impl as ValueT?);
    }
    if (keyApi is CaptureRequestCameraMetadataControlAfModeKeyProxyApi) {
      return api
          .getCameraMetadataControlAfModeCaptureRequestOption(keyApi)
          .then((e) => e?.impl as ValueT?);
    }
    if (keyApi is CaptureRequestCameraMetadataControlAwbModeKeyProxyApi) {
      return api
          .getCameraMetadataControlAwbModeCaptureRequestOption(keyApi)
          .then((e) => e?.impl as ValueT?);
    }
    throw TypeError();
  }
}

final class CaptureRequestOptionsChannelImpl
    extends CaptureRequestOptionsChannel {
  @override
  CaptureRequestOptions$Builder createBuilder() {
    final api = CaptureRequestOptionsBuilderProxyApi();
    return CaptureRequestOptions$BuilderImpl.internal(api);
  }
}

extension CaptureRequestOptions$BuilderX on CaptureRequestOptions$Builder {
  CaptureRequestOptionsBuilderProxyApi get api {
    final impl = this;
    if (impl is! CaptureRequestOptions$BuilderImpl) throw TypeError();
    return impl.api;
  }
}

extension CaptureRequestOptionsBuilderProxyApiX
    on CaptureRequestOptionsBuilderProxyApi {
  CaptureRequestOptions$Builder get impl =>
      CaptureRequestOptions$BuilderImpl.internal(this);
}

extension CaptureRequestOptionsX on CaptureRequestOptions {
  CaptureRequestOptionsProxyApi get api {
    final impl = this;
    if (impl is! CaptureRequestOptionsImpl) throw TypeError();
    return impl.api;
  }
}

extension CaptureRequestOptionsProxyApiX on CaptureRequestOptionsProxyApi {
  CaptureRequestOptions get impl => CaptureRequestOptionsImpl.internal(this);
}
