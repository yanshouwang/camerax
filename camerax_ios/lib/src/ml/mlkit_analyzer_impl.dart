import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_ios/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'detector_impl.dart';
import 'mlkit_analyzer_result_impl.dart';

final class MlKitAnalyzerImpl extends MlKitAnalyzer with AnalyzerImpl {
  @override
  final VNAnalyzerApi api;

  MlKitAnalyzerImpl.internal(this.api) : super.impl();

  factory MlKitAnalyzerImpl({
    required List<Detector> detectors,
    required CoordinateSystem targetCoordinateSystem,
    required Consumer<MlKitAnalyzerResult> consumer,
  }) {
    final api = VNAnalyzerApi(
      detectors: detectors.cast<DetectorImpl>().map((e) => e.api).toList(),
      consumer: VNAnalyzerResultConsumerApi(
        accept: (_, e) => consumer(e.impl),
      ),
    );
    return MlKitAnalyzerImpl.internal(api);
  }
}
