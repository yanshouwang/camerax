import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'detector.dart';
import 'mlkit_analyzer_result.dart';

final class MlKitAnalyzer extends $base.MlKitAnalyzer with Analyzer {
  @override
  final $native.MlKitAnalyzer obj;

  MlKitAnalyzer.$native(this.obj) : super.impl();

  factory MlKitAnalyzer({
    required List<$base.Detector> detectors,
    required $base.CoordinateSystem targetCoordinateSystem,
    required $base.MlKitAnalyzerResultConsumer consumer,
  }) {
    final obj = $native.MlKitAnalyzer(
      detectors:
          detectors.cast<Detector>().map((detector) => detector.obj).toList(),
      targetCoordinateSystem: targetCoordinateSystem.obj,
      consumer: $native.MlKitAnalyzerResultConsumer(
        accept: (obj, valueObj) {
          consumer(valueObj.args);
        },
      ),
    );
    return MlKitAnalyzer.$native(obj);
  }
}
