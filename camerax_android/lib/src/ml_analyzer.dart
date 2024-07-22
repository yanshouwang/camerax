import 'dart:async';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:hybrid_logging/hybrid_logging.dart';
import 'package:jni/jni.dart';

import 'image_proxy.dart';
import 'jni.dart';
import 'jni.g.dart' as jni;

final class JMLAnalyzer with TypeLogger implements MLAnalyzer {
  final JList<jni.Detector> _detectors;
  final MLAnalyzedCallback _onAnalyzed;

  JMLAnalyzer({
    required List<MLObjectType> types,
    required MLAnalyzedCallback onAnalyzed,
  })  : _detectors = types.jniValue,
        _onAnalyzed = onAnalyzed;

  @override
  void analyze(ImageProxy imageProxy) async {
    try {
      if (imageProxy is! JImageProxy) {
        throw TypeError();
      }
      final imageInfo = imageProxy.jniValue.getImageInfo();
      final timestamp = imageInfo.getTimestamp();
      final time = DateTime.fromMillisecondsSinceEpoch(timestamp);
      final items = <MLObject>[];
      for (var detector in _detectors) {
        try {
          final value = await detector.detect(imageProxy.jniValue);
          final duration = DateTime.now().difference(time);
          final type = detector.getDetectorType();
          switch (type) {
            case jni.Detector.TYPE_BARCODE_SCANNING:
              final codes = value
                  .castTo(JList.type(jni.Barcode.type))
                  .map((barcode) => barcode.toDartValue(
                        time: time,
                        duration: duration,
                      ))
                  .toList();
              items.addAll(codes);
              break;
            case jni.Detector.TYPE_FACE_DETECTION:
              final faces = value
                  .castTo(JList.type(jni.Face.type))
                  .map((face) => face.toDartValue(
                        time: time,
                        duration: duration,
                      ))
                  .toList();
              items.addAll(faces);
              break;
            default:
              break;
          }
        } catch (e) {
          logger.warning('Detect failed.', e);
        }
      }
      _onAnalyzed(imageProxy, items);
    } finally {
      await imageProxy.close();
    }
  }
}

extension JDetectorX on jni.Detector {
  Future<JObject> detect(jni.ImageProxy imageProxy) async {
    final image = imageProxy.getImage();
    final imageInfo = imageProxy.getImageInfo();
    final rotationDegrees = imageInfo.getRotationDegrees();
    final completer = Completer<JObject>();
    final task = process1(image, rotationDegrees);
    final onSuccessListener = jni.OnSuccessListener.implement(
      jni.$OnSuccessListenerImpl(
        TResult: task.TResult,
        onSuccess: (value) => completer.complete(value),
      ),
    );
    final onFailureListener = jni.OnFailureListener.implement(
      jni.$OnFailureListenerImpl(
        onFailure: (error) => completer.completeError(error),
      ),
    );
    task
        .addOnSuccessListener(onSuccessListener)
        .addOnFailureListener(onFailureListener);
    final value = await completer.future;
    return value;
  }
}
