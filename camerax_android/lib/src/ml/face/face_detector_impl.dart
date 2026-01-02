import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/ml.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class FaceDetectorImpl extends DetectorImpl<List<Face>>
    implements FaceDetector {
  @override
  final FaceDetectorProxyApi api;

  FaceDetectorImpl.internal(this.api);

  @override
  Future<List<Face>> process(InputImage image) =>
      api.process(image.api).then((e) => e.map((e1) => e1.impl).toList());
}

final class FaceDetectorChannelImpl extends FaceDetectorChannel {
  @override
  FaceDetector create() {
    final api = FaceDetectorProxyApi();
    return FaceDetectorImpl.internal(api);
  }

  @override
  FaceDetector createWithOptions(FaceDetectorOptions options) {
    final api = FaceDetectorProxyApi.options(options: options.api);
    return FaceDetectorImpl.internal(api);
  }
}

extension FaceDetectorX on FaceDetector {
  FaceDetectorProxyApi get api {
    final impl = this;
    if (impl is! FaceDetectorImpl) throw TypeError();
    return impl.api;
  }
}
