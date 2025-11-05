import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'face_detector_options_impl.dart';

final class FaceDetectorImpl extends FaceDetectorApi
    with AutoCloseableImpl, CloseableImpl {
  @override
  final FaceDetectorProxyApi api;

  FaceDetectorImpl.internal(this.api) : super.impl();

  factory FaceDetectorImpl() {
    final api = FaceDetectorProxyApi();
    return FaceDetectorImpl.internal(api);
  }

  factory FaceDetectorImpl.options(FaceDetectorOptionsApi options) {
    final api = FaceDetectorProxyApi.options(options: options.api);
    return FaceDetectorImpl.internal(api);
  }
}

extension FaceDetectorApiX on FaceDetectorApi {
  FaceDetectorProxyApi get api {
    final impl = this;
    if (impl is! FaceDetectorImpl) throw TypeError();
    return impl.api;
  }
}
