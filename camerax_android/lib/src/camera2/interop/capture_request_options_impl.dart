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
    throw TypeError();
  }

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
        return CameraMetadataUtilProxyApi.toControlMode(value.api)
            .then((e) => api.setIntCaptureRequestOption(keyApi, e))
            .then((e) => e.impl);
      }
      if (value is CameraMetadata$ControlAeMode) {
        return CameraMetadataUtilProxyApi.toControlAeMode(value.api)
            .then((e) => api.setIntCaptureRequestOption(keyApi, e))
            .then((e) => e.impl);
      }
      if (value is CameraMetadata$ControlAfMode) {
        return CameraMetadataUtilProxyApi.toControlAfMode(value.api)
            .then((e) => api.setIntCaptureRequestOption(keyApi, e))
            .then((e) => e.impl);
      }
      if (value is CameraMetadata$ControlAwbMode) {
        return CameraMetadataUtilProxyApi.toControlAwbMode(value.api)
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
    final keyApi = key.api;
    if (keyApi is CaptureRequestIntKeyProxyApi) {
      if (ValueT == int) {
        return api.getIntCaptureRequestOption(keyApi).then((e) => e as ValueT?);
      }
      if (ValueT == CameraMetadata$ControlMode) {
        return api
            .getIntCaptureRequestOption(keyApi)
            .then(
              (e) => e == null
                  ? null
                  : CameraMetadataUtilProxyApi.fromControlMode(
                      e,
                    ).then((e) => e.impl as ValueT?),
            );
      }
      if (ValueT == CameraMetadata$ControlAeMode) {
        return api
            .getIntCaptureRequestOption(keyApi)
            .then(
              (e) => e == null
                  ? null
                  : CameraMetadataUtilProxyApi.fromControlAeMode(
                      e,
                    ).then((e) => e.impl as ValueT?),
            );
      }
      if (ValueT == CameraMetadata$ControlAfMode) {
        return api
            .getIntCaptureRequestOption(keyApi)
            .then(
              (e) => e == null
                  ? null
                  : CameraMetadataUtilProxyApi.fromControlAfMode(
                      e,
                    ).then((e) => e.impl as ValueT?),
            );
      }
      if (ValueT == CameraMetadata$ControlAwbMode) {
        return api
            .getIntCaptureRequestOption(keyApi)
            .then(
              (e) => e == null
                  ? null
                  : CameraMetadataUtilProxyApi.fromControlAwbMode(
                      e,
                    ).then((e) => e.impl as ValueT?),
            );
      }
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
