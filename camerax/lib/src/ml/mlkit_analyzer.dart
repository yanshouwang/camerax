import 'package:camerax/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;
import 'package:meta/meta.dart';

import 'detector.dart';
import 'mlkit_analyzer_result.dart';

typedef MlKitAnalyzerResultConsumer = void Function(MlKitAnalyzerResult result);

final class MlKitAnalyzer implements Analyzer {
  final $base.MlKitAnalyzer _obj;

  MlKitAnalyzer({
    required List<Detector> detectors,
    required $base.CoordinateSystem targetCoordinateSystem,
    required MlKitAnalyzerResultConsumer consumer,
  }) : _obj = $base.MlKitAnalyzer(
          detectors: detectors.map((detector) => detector.obj).toList(),
          targetCoordinateSystem: targetCoordinateSystem,
          consumer: (result) => consumer(result.args),
        );

  @internal
  $base.MlKitAnalyzer get obj => _obj;

  @override
  void analyze(ImageProxy image) {
    _obj.analyze(image.obj);
  }
}
