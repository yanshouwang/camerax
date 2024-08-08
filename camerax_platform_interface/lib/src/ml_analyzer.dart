import 'camerax_plugin.dart';
import 'image_analyzer.dart';
import 'ml.dart';

typedef MLAnalyzedCallback = void Function(List<MLObject> items);

abstract interface class MLAnalyzer implements ImageAnalyzer {
  factory MLAnalyzer({
    required List<MLObjectType> types,
    required MLAnalyzedCallback onAnalyzed,
  }) {
    return CameraXPlugin.instance.createMLAnalyzer(
      types: types,
      onAnalyzed: onAnalyzed,
    );
  }
}
