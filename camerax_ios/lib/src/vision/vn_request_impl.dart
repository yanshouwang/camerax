import 'package:camerax_ios/src/api.dart';
import 'package:camerax_ios/src/vision.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class VNRequestImpl implements VNRequest {
  VNRequestProxyApi get api;

  @override
  Future<bool> getPreferBackgroundProcessing() =>
      api.getPreferBackgroundProcessing();

  @override
  Future<void> setPreferBackgroundProcessing(bool value) =>
      api.setPreferBackgroundProcessing(value);

  @override
  Future<void> cancel() => api.cancel();
}

extension VNRequestX on VNRequest {
  VNRequestProxyApi get api {
    final impl = this;
    if (impl is! VNRequestImpl) throw TypeError();
    return impl.api;
  }
}

extension VNRequestProxyApiX on VNRequestProxyApi {
  VNRequest get impl {
    final api = this;
    if (api is VNDetectBarcodesRequestProxyApi) {
      return VNDetectBarcodesRequestImpl.internal(api);
    }
    if (api is VNDetectFaceRectanglesRequestProxyApi) {
      return VNDetectFaceRectanglesRequestImpl.internal(api);
    }
    throw TypeError();
  }
}
