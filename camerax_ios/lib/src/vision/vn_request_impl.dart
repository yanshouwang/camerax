import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/vision/vn_detect_face_rectangles_request_impl.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'vn_detect_barcodes_request_impl.dart';

base mixin VNRequestImpl on VNRequest {
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
