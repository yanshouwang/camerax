import 'package:camerax_core/camerax_core.dart' as core;

import 'finalizers.dart';
import 'image_proxy.dart';
import 'ml_metadata.dart';

abstract class ImageAnalyzer {
  ImageAnalyzer() {
    finalizer.attach(this, id);
  }

  void analyze(ImageProxy imageProxy);
}

abstract class MLAnalyzer extends ImageAnalyzer {
  factory MLAnalyzer(
          void Function(List<MLMetadata> recognition) onRecognized) =>
      _MLAnalyzer(onRecognized);
}

class _MLAnalyzer implements MLAnalyzer {
  final void Function(List<MLMetadata> recognition) onRecognized;

  _MLAnalyzer(this.onRecognized) {
    core.MLAnalyzerPigeon.instance.create(id);
    finalizer.attach(this, id);
  }

  @override
  void analyze(ImageProxy imageProxy) {
    throw UnimplementedError();
  }
}

extension on ImageAnalyzer {
  String get id => hashCode.toString();
}
