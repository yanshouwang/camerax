import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'detector_impl.dart';
import 'mlkit_analyzer_result_impl.dart';

final class MlKitAnalyzerImpl extends MlKitAnalyzer
    with ImageAnalysisAnalyzerMixin {
  @override
  final MlKitAnalyzerApi api;

  MlKitAnalyzerImpl.internal(this.api) : super.impl();

  factory MlKitAnalyzerImpl({
    required List<Detector> detectors,
    required ImageAnalysisCoordinateSystem targetCoordinateSystem,
    required Consumer<MlKitAnalyzerResult> consumer,
  }) {
    final api = MlKitAnalyzerApi(
      detectors: detectors.cast<DetectorMixin>().map((e) => e.api).toList(),
      targetCoordinateSystem: targetCoordinateSystem.api,
      consumer: MlKitAnalyzerResultConsumerApi(
        accept: (_, e) => consumer(e.impl),
      ),
    );
    return MlKitAnalyzerImpl.api(api);
  }
}
