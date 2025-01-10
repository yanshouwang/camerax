import 'package:camerax_platform_interface/src/camerax.dart';
import 'package:camerax_platform_interface/src/core.dart';

import 'ml_object.dart';
import 'ml_object_type.dart';

typedef MLObjectsCallback = void Function(List<MLObject> items);

abstract base class MLAnalyzer extends Analyzer {
  factory MLAnalyzer({
    required List<MLObjectType> types,
    required CoordinateSystem targetCoordinateSystem,
    required MLObjectsCallback onAnalyzed,
  }) {
    return CameraX.instance.createMLAnalyzer(
      types: types,
      targetCoordinateSystem: targetCoordinateSystem,
      onAnalyzed: onAnalyzed,
    );
  }
}
