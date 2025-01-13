import 'package:camerax_platform_interface/src/camerax.dart';
import 'package:camerax_platform_interface/src/core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'detector.dart';
import 'mlkit_analyzer_result.dart';

typedef MlKitAnalyzerResultConsumer = void Function(MlKitAnalyzerResult result);

abstract base class MlKitAnalyzer extends PlatformInterface
    implements Analyzer {
  static final _token = Object();

  MlKitAnalyzer.impl() : super(token: _token);

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
