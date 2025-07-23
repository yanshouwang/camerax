import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_ios/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'vn_analyzer_result_impl.dart';
import 'vn_detector_impl.dart';

final class VNAnalyzerImpl extends VNAnalyzer with AnalyzerImpl {
  @override
  final VNAnalyzerApi api;

  VNAnalyzerImpl.internal(this.api) : super.impl();

  factory VNAnalyzerImpl({
    required List<VNDetector> detectors,
    required Consumer<VNAnalyzerResult> consumer,
  }) {
    final api = VNAnalyzerApi(
      detectors: detectors.cast<VNDetectorImpl>().map((e)=>e.api).toList(),
      consumer: VNAnalyzerResultConsumerApi(
        accept: (_, e) => consumer(e.impl),
      ),
    );
    return VNAnalyzerImpl.internal(api);
  }
}
