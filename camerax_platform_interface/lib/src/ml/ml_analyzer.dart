import 'package:camerax_platform_interface/src/camerax.dart';
import 'package:camerax_platform_interface/src/core.dart';

import 'ml_object.dart';
import 'ml_object_type.dart';

typedef MlObjectsCallback = void Function(List<MlObject> items);

abstract base class MlKitAnalyzer extends Analyzer {
  MlKitAnalyzer.impl() : super.impl();

  factory MlKitAnalyzer({
    required List<MlObjectType> types,
    required CoordinateSystem targetCoordinateSystem,
    required MlObjectsCallback onAnalyzed,
  }) {
    return CameraX.instance.createMlKitAnalyzer(
      types: types,
      targetCoordinateSystem: targetCoordinateSystem,
      onAnalyzed: onAnalyzed,
    );
  }
}
