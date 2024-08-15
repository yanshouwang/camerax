import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/core.dart';

import 'ml_object.dart';
import 'ml_object_type.dart';

typedef MLObjectsCallback = void Function(List<MLObject> items);

abstract interface class MLAnalyzer implements Analyzer {
  factory MLAnalyzer({
    required List<MLObjectType> types,
    required CoordinateSystem targetCoordinateSystem,
    required MLObjectsCallback onAnalyzed,
  }) {
    return CameraXPlugin.instance.createMLAnalyzer(
      types: types,
      targetCoordinateSystem: targetCoordinateSystem,
      onAnalyzed: onAnalyzed,
    );
  }
}
