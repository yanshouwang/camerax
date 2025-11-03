import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/ml/barcode.dart';
import 'package:camerax_android/src/ml/face.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

base mixin DetectorImpl<T> on Detector<T>, AutoCloseableImpl, CloseableImpl {}

extension DetectorX on Detector {
  BarcodeScannerApi get barcodeScannerApi {
    final impl = this;
    if (impl is! BarcodeScannerImpl) throw TypeError();
    return impl.api;
  }

  FaceDetectorApi get faceDetectorApi {
    final impl = this;
    if (impl is! FaceDetectorImpl) throw TypeError();
    return impl.api;
  }
}
