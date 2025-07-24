import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'barcode.dart';
import 'detector_impl.dart';
import 'face.dart';

final class MlKitAnalyzerResultImpl extends MlKitAnalyzerResult {
  final MlKitAnalyzerResultApi api;

  MlKitAnalyzerResultImpl.internal(
    this.api, {
    required super.timestamp,
  }) : super.impl();

  @override
  Future<T?> getValue<T>(Detector<T> detector) {
    if (detector is BarcodeScannerImpl) {
      final barcodeScanner = detector as BarcodeScannerImpl;
      return api
          .getBarcodes(barcodeScanner.api)
          .then((e) => e?.map((e1) => e1.impl).toList() as T?);
    } else if (detector is FaceDetectorImpl) {
      final faceDetector = detector as FaceDetectorImpl;
      return api
          .getFaces(faceDetector.api)
          .then((e) => e?.map((e1) => e1.impl).toList() as T?);
    } else {
      throw TypeError();
    }
  }

  @override
  Future<Object?> getThrowable(Detector detector) {
    if (detector is! DetectorImpl) {
      throw TypeError();
    }
    return api.getThrowable(detector.api).then((e) => e?.impl);
  }
}

extension MlKitAnalyzerResultApiX on MlKitAnalyzerResultApi {
  MlKitAnalyzerResult get impl {
    return MlKitAnalyzerResultImpl.internal(
      this,
      timestamp: timestamp,
    );
  }
}
