import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'vn_barcode_observation_impl.dart';
import 'vn_barcode_scanner_impl.dart';
import 'vn_detector_impl.dart';

final class VNAnalyzerResultImpl extends VNAnalyzerResult {
  final MlKitAnalyzerResultApi api;

  VNAnalyzerResultImpl.internal(this.api, {required super.timestamp})
    : super.impl();

  @override
  Future<List<VNObservation>?> getValue(VNDetector detector) {
    if (detector is VNBarcodeScannerImpl) {
      return api
          .getBarcodes(detector.api)
          .then(
            (e) =>
                e
                    ?.map((e1) => e1.implOfSize(api.size))
                    .whereType<VNBarcodeObservation>()
                    .toList(),
          );
    } else {
      throw TypeError();
    }
  }

  @override
  Future<Object?> getError(VNDetector detector) {
    if (detector is! VNDetectorImpl) {
      throw TypeError();
    }
    return api.getThrowable(detector.api).then((e) => e?.impl);
  }
}

extension VNAnalyzerResultApiX on MlKitAnalyzerResultApi {
  VNAnalyzerResult get impl {
    return VNAnalyzerResultImpl.internal(this, timestamp: timestamp);
  }
}
