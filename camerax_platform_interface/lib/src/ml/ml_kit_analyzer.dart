import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';

import 'interfaces.dart';

abstract base class MlKitAnalyzerResult {
  MlKitAnalyzerResult.impl();

  int get timestamp;

  Future<T?> getValue<T>(Detector<T> detector);
  Future<Object?> getThrowable(Detector detector);
}

abstract base class MlKitAnalyzer extends ImageAnalysisAnalyzer {
  MlKitAnalyzer.impl() : super.impl();

  factory MlKitAnalyzer({
    required List<Detector> detectors,
    required ImageAnalysisCoordinateSystem targetCoordinateSystem,
    required Consumer<MlKitAnalyzerResult> consumer,
  }) => CameraXPlugin.instance.$MlKitAnalyzer(
    detectors: detectors,
    targetCoordinateSystem: targetCoordinateSystem,
    consumer: consumer,
  );
}
