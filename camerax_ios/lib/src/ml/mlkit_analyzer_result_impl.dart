import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'barcode.dart';
import 'detector_impl.dart';

final class MlKitAnalyzerResultImpl extends MlKitAnalyzerResult {
  final VNAnalyzerResultApi api;

  MlKitAnalyzerResultImpl.internal(this.api, {required super.timestamp})
    : super.impl();

  @override
  Future<T?> getValue<T>(Detector<T> detector) {
    if (detector is BarcodeScannerImpl) {
      final barcodeScanner = detector as BarcodeScannerImpl;
      return api
          .getBarcodes(barcodeScanner.api)
          .then((e) => e?.map((e1) => e1.implOfSize(api.size)).toList() as T?);
    } else {
      throw TypeError();
    }
  }

  @override
  Future<Object?> getThrowable(Detector detector) {
    if (detector is! DetectorImpl) {
      throw TypeError();
    }
    return api.getError(detector.api).then((e) => e?.impl);
  }
}

extension VNAnalyzerResultApiX on VNAnalyzerResultApi {
  MlKitAnalyzerResult get impl {
    return MlKitAnalyzerResultImpl.internal(this, timestamp: timestamp);
  }
}
