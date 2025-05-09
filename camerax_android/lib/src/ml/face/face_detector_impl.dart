import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/ml/detector_impl.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'face_detector_options_impl.dart';

final class FaceDetectorImpl extends FaceDetectorChannel with DetectorImpl {
  @override
  final FaceDetectorApi api;

  FaceDetectorImpl.impl(this.api) : super.impl();

  factory FaceDetectorImpl({
    FaceDetectorOptions? options,
  }) {
    if (options is! FaceDetectorOptionsImpl?) {
      throw TypeError();
    }
    final api = FaceDetectorApi(
      options: options?.api,
    );
    return FaceDetectorImpl.impl(api);
  }
}
