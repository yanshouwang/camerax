import 'package:camerax_core/camerax_core.dart' as core;

import 'finalizers.dart';
import 'image_proxy.dart';
import 'ml_metadata.dart';

abstract class ImageAnalyzer {
  Stream<ImageProxy> get imageProxyStream;

  factory ImageAnalyzer() => _ImageAnalyzer();
}

abstract class MLAnalyzer extends ImageAnalyzer {
  Stream<MLMetadata> get mlMetadataStream;

  factory MLAnalyzer() => _MLAnalyzer();
}

class _ImageAnalyzer implements ImageAnalyzer {
  _ImageAnalyzer() {
    finalizer.attach(this, id);
  }

  @override
  // TODO: implement imageProxyStream
  Stream<ImageProxy> get imageProxyStream => throw UnimplementedError();
}

class _MLAnalyzer extends _ImageAnalyzer implements MLAnalyzer {
  @override
  // TODO: implement mlMetadataStream
  Stream<MLMetadata> get mlMetadataStream => throw UnimplementedError();
}

extension on ImageAnalyzer {
  String get id => hashCode.toString();
}
