import 'dart:ui';

import 'package:camerax_core/camerax_core.dart' as core;

import 'extensions.dart';
import 'finalizer.dart';

abstract class ImageAnalyzer {
  ImageAnalyzer() {
    core.ImageAnalyzerPigeon.instance.create(id);
    final imageProxyStreamSubscription = core
        .ImageAnalyzerPigeon.instance.imageProxyStream
        .where((e) => e.id == id)
        .map((e) => _ImageProxy(e.imageProxy))
        .listen(analyze);
    final arguments = FinalizerArguments(
      id: id,
      streamSubscription: imageProxyStreamSubscription,
    );
    finalizer.attach(this, arguments);
  }

  void analyze(ImageProxy imageProxy);
}

abstract class ImageProxy {
  void close();
}

class MLAnalyzer implements ImageAnalyzer {
  MLAnalyzer(void Function(MLRecognition) handleRecognition) {
    core.MLAnalyzerPigeon.instance.create(id);
    final recognitionStreamSubscription = core
        .MLAnalyzerPigeon.instance.recognitionStream
        .where((e) => e.id == id)
        .map((e) => _MLRecognition(e.recognition))
        .listen(handleRecognition);
    final arguments = FinalizerArguments(
      id: id,
      streamSubscription: recognitionStreamSubscription,
    );
    finalizer.attach(this, arguments);
  }

  @override
  void analyze(ImageProxy imageProxy) {
    core.MLAnalyzerPigeon.instance.analyze(id, imageProxy.id);
  }
}

abstract class MLRecognition {
  List<MLObject> get objs;
}

abstract class MLObject {
  List<Offset> get corners;
}

abstract class Barcode extends MLObject {
  String get value;
}

class _ImageProxy implements ImageProxy {
  _ImageProxy(core.ImageProxy imageProxy);

  @override
  void close() {
    throw UnimplementedError();
  }
}

class _MLRecognition implements MLRecognition {
  @override
  final List<MLObject> objs;

  _MLRecognition(core.MLRecognition recognition)
      : objs = recognition.objs.map((obj) {
          switch (obj.type) {
            case core.MLObject_Type.barcode:
              return _Barcode(obj);
            default:
              throw ArgumentError.value(obj);
          }
        }).toList();
}

class _MLObject implements MLObject {
  @override
  final List<Offset> corners;

  _MLObject(core.MLObject obj)
      : corners = obj.corners
            .map((corner) => Offset(corner.dx.toDouble(), corner.dy.toDouble()))
            .toList();
}

class _Barcode extends _MLObject implements Barcode {
  @override
  final String value;

  _Barcode(core.MLObject obj)
      : value = obj.barcode.value,
        super(obj);
}

extension on core.MLObject {
  core.MLObject_Type get type => whichType();
}
