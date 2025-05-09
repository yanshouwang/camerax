import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'detector.dart';
import 'mlkit_analyzer_result.dart';

typedef MlKitAnalyzerResultConsumer = void Function(MlKitAnalyzerResult result);

final _token = Object();

abstract interface class MlKitAnalyzer implements Analyzer {
  factory MlKitAnalyzer({
    required List<Detector> detectors,
    required CoordinateSystem targetCoordinateSystem,
    required MlKitAnalyzerResultConsumer consumer,
  }) {
    final instance = CameraXPlugin.instance.newMlKitAnalyzer(
      detectors: detectors,
      targetCoordinateSystem: targetCoordinateSystem,
      consumer: consumer,
    );
    PlatformInterface.verify(instance as PlatformInterface, _token);
    return instance;
  }
}

abstract base class MlKitAnalyzerChannel extends PlatformInterface
    implements MlKitAnalyzer {
  MlKitAnalyzerChannel.impl() : super(token: _token);
}
