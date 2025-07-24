import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'vn_barcode_observation_impl.dart';
import 'vn_barcode_scanner_impl.dart';
import 'vn_detector_impl.dart';

final class VNAnalyzerResultImpl extends VNAnalyzerResult {
  final VNAnalyzerResultApi api;

  VNAnalyzerResultImpl.internal(this.api, {required super.timestamp})
    : super.impl();

  @override
  Future<List<VNObservation>?> getValue(VNDetector detector) {
    if (detector is VNBarcodeScannerImpl) {
      return api
          .getBarcodes(detector.api)
          .then((e) => e?.map((e1) => e1.impl).toList());
    } else {
      throw TypeError();
    }
  }

  @override
  Future<Object?> getError(VNDetector detector) {
    if (detector is! VNDetectorImpl) {
      throw TypeError();
    }
    return api.getError(detector.api).then((e) => e?.impl);
  }
}

extension VNAnalyzerResultApiX on VNAnalyzerResultApi {
  VNAnalyzerResult get impl {
    return VNAnalyzerResultImpl.internal(this, timestamp: timestamp);
  }
}
