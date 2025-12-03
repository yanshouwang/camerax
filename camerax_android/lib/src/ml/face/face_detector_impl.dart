import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/ml/common.dart';
import 'package:camerax_android/src/ml/interfaces.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'face_detector_options_impl.dart';
import 'face_impl.dart';

final class FaceDetectorImpl extends FaceDetector
    with AutoCloseableImpl, CloseableImpl, DetectorImpl {
  @override
  final FaceDetectorProxyApi api;

  FaceDetectorImpl.internal(this.api) : super.impl();

  factory FaceDetectorImpl() {
    final api = FaceDetectorProxyApi();
    return FaceDetectorImpl.internal(api);
  }

  factory FaceDetectorImpl.options(FaceDetectorOptions options) {
    final api = FaceDetectorProxyApi.options(options: options.api);
    return FaceDetectorImpl.internal(api);
  }

  @override
  Future<List<Face>> process(InputImage image) =>
      api.process(image.api).then((e) => e.map((e1) => e1.impl).toList());
}

extension FaceDetectorX on FaceDetector {
  FaceDetectorProxyApi get api {
    final impl = this;
    if (impl is! FaceDetectorImpl) throw TypeError();
    return impl.api;
  }
}
