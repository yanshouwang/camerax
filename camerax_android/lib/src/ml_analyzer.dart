import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:jni/jni.dart';

import 'image_proxy.dart';
import 'jni.dart';
import 'jni.g.dart' as jni;

class JMLAnalyzer implements MLAnalyzer {
  final jni.MlKitAnalyzer jniValue;

  JMLAnalyzer({
    required List<MLObjectType> types,
    required MLAnalyzedCallback onAnalyzed,
  }) : jniValue = _createMLAnalyzer(
          types: types,
          onAnalyzed: onAnalyzed,
        );

  @override
  void analyze(ImageProxy imageProxy) {
    if (imageProxy is! JImageProxy) {
      throw TypeError();
    }
    jniValue.analyze(imageProxy.jniValue);
  }
}

jni.MlKitAnalyzer _createMLAnalyzer({
  required List<MLObjectType> types,
  required MLAnalyzedCallback onAnalyzed,
}) {
  final detectors = types.jniValue;
  return jni.MlKitAnalyzer(
    detectors,
    jni.MyImageAnalysis.COORDINATE_SYSTEM_VIEW_REFERENCED,
    jni.ContextCompat.getMainExecutor(JNI.context),
    jni.Consumer.implement(jni.$ConsumerImpl(
      T: jni.MlKitAnalyzer_Result.type,
      accept: (result) {
        final timestamp = result.getTimestamp();
        final time = DateTime.fromMillisecondsSinceEpoch(timestamp);
        final duration = DateTime.now().difference(time);
        final items = <MLObject>[];
        for (var detector in detectors) {
          final value = result.getValue(detector);
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
        }
        if (items.isEmpty) {
          return;
        }
        onAnalyzed(items);
      },
    )),
  );
}

// final class JMLAnalyzer with TypeLogger implements MLAnalyzer {
//   final JList<jni.Detector> _detectors;
//   final MLAnalyzedCallback _onAnalyzed;

//   JMLAnalyzer({
//     required List<MLObjectType> types,
//     required MLAnalyzedCallback onAnalyzed,
//   })  : _detectors = types.jniValue,
//         _onAnalyzed = onAnalyzed;

//   @override
//   void analyze(ImageProxy imageProxy) async {
//     try {
//       if (imageProxy is! JImageProxy) {
//         throw TypeError();
//       }
//       final imageInfo = imageProxy.jniValue.getImageInfo();
//       final timestamp = imageInfo.getTimestamp();
//       final time = DateTime.fromMillisecondsSinceEpoch(timestamp);
//       final items = <MLObject>[];
//       for (var detector in _detectors) {
//         try {
//           final value = await detector.detect(imageProxy.jniValue);
//           final duration = DateTime.now().difference(time);
//           final type = detector.getDetectorType();
//           switch (type) {
//             case jni.Detector.TYPE_BARCODE_SCANNING:
//               final codes = value
//                   .castTo(JList.type(jni.Barcode.type))
//                   .map((barcode) => barcode.toDartValue(
//                         time: time,
//                         duration: duration,
//                       ))
//                   .toList();
//               items.addAll(codes);
//               break;
//             case jni.Detector.TYPE_FACE_DETECTION:
//               final faces = value
//                   .castTo(JList.type(jni.Face.type))
//                   .map((face) => face.toDartValue(
//                         time: time,
//                         duration: duration,
//                       ))
//                   .toList();
//               items.addAll(faces);
//               break;
//             default:
//               break;
//           }
//         } catch (e) {
//           logger.warning('Detect failed.', e);
//         }
//       }
//       _onAnalyzed(imageProxy, items);
//     } finally {
//       await imageProxy.close();
//     }
//   }
// }

// extension JDetectorX on jni.Detector {
//   Future<JObject> detect(jni.ImageProxy imageProxy) async {
//     final image = imageProxy.getImage();
//     // final imageInfo = imageProxy.getImageInfo();
//     // final rotationDegrees = imageInfo.getRotationDegrees();
//     const rotationDegrees = 90;
//     final completer = Completer<JObject>();
//     final task = process1(image, rotationDegrees);
//     final onSuccessListener = jni.OnSuccessListener.implement(
//       jni.$OnSuccessListenerImpl(
//         TResult: task.TResult,
//         onSuccess: (value) => completer.complete(value),
//       ),
//     );
//     final onFailureListener = jni.OnFailureListener.implement(
//       jni.$OnFailureListenerImpl(
//         onFailure: (error) => completer.completeError(error),
//       ),
//     );
//     task
//         .addOnSuccessListener(onSuccessListener)
//         .addOnFailureListener(onFailureListener);
//     final value = await completer.future;
//     return value;
//   }
// }
