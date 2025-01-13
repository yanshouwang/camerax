import 'package:camerax_platform_interface/src/camerax.dart';
import 'package:camerax_platform_interface/src/core.dart';

import 'detector.dart';
import 'mlkit_analyzer_result.dart';

typedef MlKitAnalyzerResultConsumer = void Function(MlKitAnalyzerResult result);

abstract base class MlKitAnalyzer extends Analyzer {
  MlKitAnalyzer.impl() : super.impl();

  factory MlKitAnalyzer({
    required List<Detector> detectors,
    required CoordinateSystem targetCoordinateSystem,
    required MlKitAnalyzerResultConsumer consumer,
  }) {
    return CameraX.instance.createMlKitAnalyzer(
      detectors: detectors,
      targetCoordinateSystem: targetCoordinateSystem,
      consumer: consumer,
    );
  }
}