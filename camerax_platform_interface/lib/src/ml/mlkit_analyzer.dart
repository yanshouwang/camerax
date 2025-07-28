import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';

import 'detector.dart';

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

abstract base class MlKitAnalyzerResult {
  final int timestamp;

  MlKitAnalyzerResult.impl({required this.timestamp});

  Future<T?> getValue<T>(Detector<T> detector);
  Future<Object?> getThrowable(Detector detector);
}
