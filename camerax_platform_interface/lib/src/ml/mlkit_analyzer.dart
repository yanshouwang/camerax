import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';

import 'detector.dart';
import 'mlkit_analyzer_result.dart';

abstract base class MlKitAnalyzer extends Analyzer {
  MlKitAnalyzer.impl() : super.impl();

  factory MlKitAnalyzer({
    required List<Detector> detectors,
    required CoordinateSystem targetCoordinateSystem,
    required Consumer<MlKitAnalyzerResult> consumer,
  }) => CameraXPlugin.instance.newMlKitAnalyzer(
    detectors: detectors,
    targetCoordinateSystem: targetCoordinateSystem,
    consumer: consumer,
  );
}
