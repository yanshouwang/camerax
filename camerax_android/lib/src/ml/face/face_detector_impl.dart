import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/ml/interfaces.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class FaceDetectorImpl extends FaceDetectorApi
    with AutoCloseableImpl, CloseableImpl, DetectorImpl {
  @override
  final FaceDetectorApi api;

  FaceDetectorImpl.internal(this.api) : super.impl();
}

extension FaceDetectorX on FaceDetectorApi {
  FaceDetectorApi get api {
    final impl = this;
    if (impl is! FaceDetectorImpl) throw TypeError();
    return impl.api;
  }
}
