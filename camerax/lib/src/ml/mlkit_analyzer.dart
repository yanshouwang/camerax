import 'package:camerax/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;
import 'package:meta/meta.dart';

import 'detector.dart';
import 'mlkit_analyzer_result.dart';

typedef MlKitAnalyzerResultConsumer = void Function(MlKitAnalyzerResult result);

final class MlKitAnalyzer extends Analyzer {
  final $interface.MlKitAnalyzer _obj;

  MlKitAnalyzer({
    required List<Detector> detectors,
    required $interface.CoordinateSystem targetCoordinateSystem,
    required MlKitAnalyzerResultConsumer consumer,
  }) : _obj = $interface.MlKitAnalyzer(
          detectors: detectors.map((detector) => detector.obj).toList(),
          targetCoordinateSystem: targetCoordinateSystem,
          consumer: (result) => consumer(result.args),
        );

  @internal
  @override
  $interface.MlKitAnalyzer get obj => _obj;
}
