import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'vn_analyzer_result_impl.dart';
import 'vn_detector_impl.dart';

final class VNAnalyzerImpl extends VNAnalyzer with AnalyzerImpl {
  @override
  final MlKitAnalyzerApi api;

  VNAnalyzerImpl.internal(this.api) : super.impl();

  factory VNAnalyzerImpl({
    required List<VNDetector> detectors,
    required Consumer<VNAnalyzerResult> consumer,
  }) {
    final api = MlKitAnalyzerApi(
      detectors: detectors.cast<VNDetectorImpl>().map((e) => e.api).toList(),
      targetCoordinateSystem: CoordinateSystemApi.viewReferenced,
      consumer: MlKitAnalyzerResultConsumerApi(
        accept: (_, e) => consumer(e.impl),
      ),
    );
    return VNAnalyzerImpl.internal(api);
  }
}
