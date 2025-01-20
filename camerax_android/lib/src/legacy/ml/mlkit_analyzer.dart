import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

import 'detector.dart';
import 'mlkit_analyzer_result.dart';

final class MlKitAnalyzer extends $interface.MlKitAnalyzer with Analyzer {
  @override
  final $native.MlKitAnalyzer obj;

  MlKitAnalyzer.$native(this.obj) : super.impl();

  factory MlKitAnalyzer({
    required List<$interface.Detector> detectors,
    required $interface.CoordinateSystem targetCoordinateSystem,
    required $interface.MlKitAnalyzerResultConsumer consumer,
  }) {
    final obj = $native.MlKitAnalyzer(
      detectors:
          detectors.cast<Detector>().map((detector) => detector.obj).toList(),
      targetCoordinateSystem: targetCoordinateSystem.obj,
      consumer: $native.MlKitAnalyzerResultConsumer(
        accept: (obj, valueObj) => consumer(valueObj.args),
      ),
    );
    return MlKitAnalyzer.$native(obj);
  }
}
