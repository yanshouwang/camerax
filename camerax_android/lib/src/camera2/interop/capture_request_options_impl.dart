import 'package:camerax_android/src/camera2.dart';
import 'package:camerax_android/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class CaptureRequestOptions$BuilderImpl
    implements CaptureRequestOptions$Builder {
  final CaptureRequestOptionsBuilderProxyApi api;

  CaptureRequestOptions$BuilderImpl.internal(this.api);

  @override
  Future<CaptureRequestOptions$Builder> setCaptureRequestOption<ValueT>(
    CaptureRequest$Key<ValueT> key,
    ValueT value,
  ) {
    final keyApi = key.api;
    if (keyApi is CaptureRequestIntKeyProxyApi) {
      if (value is int) {
        return api
            .setIntCaptureRequestOption(keyApi, value)
            .then((e) => e.impl);
      }
      if (value is CameraMetadata$ControlMode) {
        return CameraMetadataProxyApi.toControlMode(value.api)
            .then((e) => api.setIntCaptureRequestOption(keyApi, e))
            .then((e) => e.impl);
      }
      if (value is CameraMetadata$ControlAeMode) {
        return CameraMetadataProxyApi.toControlAeMode(value.api)
            .then((e) => api.setIntCaptureRequestOption(keyApi, e))
            .then((e) => e.impl);
      }
      if (value is CameraMetadata$ControlAfMode) {
        return CameraMetadataProxyApi.toControlAfMode(value.api)
            .then((e) => api.setIntCaptureRequestOption(keyApi, e))
            .then((e) => e.impl);
      }
      if (value is CameraMetadata$ControlAwbMode) {
        return CameraMetadataProxyApi.toControlAwbMode(value.api)
            .then((e) => api.setIntCaptureRequestOption(keyApi, e))
            .then((e) => e.impl);
      }
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
    // TODO: implement getCaptureRequestOption
    throw UnimplementedError();
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
