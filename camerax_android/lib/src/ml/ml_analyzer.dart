// import 'package:camerax_android/src/core.dart';
// import 'package:camerax_android/src/jni.dart' as jni;
// import 'package:camerax_platform_interface/camerax_platform_interface.dart';
// import 'package:jni/jni.dart';

// final class MyMLAnalyzer implements MLAnalyzer {
//   final jni.MlKitAnalyzer jniValue;

//   MyMLAnalyzer({
//     required List<MLObjectType> types,
//     required CoordinateSystem targetCoordinateSystem,
//     required MLObjectsCallback onAnalyzed,
//   }) : jniValue = _createMLKitAnalyzer(
//           types: types,
//           targetCoordinateSystem: targetCoordinateSystem,
//           onAnalyzed: onAnalyzed,
//         );

//   @override
//   void analyze(ImageProxy imageProxy) {
//     if (imageProxy is! MyImageProxy) {
//       throw TypeError();
//     }
//     jniValue.analyze(imageProxy.jniValue);
//   }
// }

// jni.MlKitAnalyzer _createMLKitAnalyzer({
//   required List<MLObjectType> types,
//   required CoordinateSystem targetCoordinateSystem,
//   required MLObjectsCallback onAnalyzed,
// }) {
//   final detectors = types.jniValue;
//   return jni.MlKitAnalyzer(
//     detectors,
//     targetCoordinateSystem.jniValue,
//     jni.ContextCompat.getMainExecutor(jni.MyJNI.context),
//     jni.Consumer.implement(
//       jni.$ConsumerImpl(
//         T: jni.MlKitAnalyzer_Result.type,
//         accept: (result) {
//           final timestamp = result.getTimestamp();
//           final time = DateTime.fromMillisecondsSinceEpoch(timestamp);
//           final duration = DateTime.now().difference(time);
//           final items = <MLObject>[];
//           for (var detector in detectors) {
//             final value = result.getValue(detector);
//             final type = detector.getDetectorType();
//             switch (type) {
//               case jni.Detector.TYPE_BARCODE_SCANNING:
//                 final codes = value
//                     .castTo(JList.type(jni.Barcode.type))
//                     .map((barcode) => barcode.toDartValue(
//                           time: time,
//                           duration: duration,
//                         ))
//                     .toList();
//                 items.addAll(codes);
//                 break;
//               case jni.Detector.TYPE_FACE_DETECTION:
//                 final faces = value
//                     .castTo(JList.type(jni.Face.type))
//                     .map((face) => face.toDartValue(
//                           time: time,
//                           duration: duration,
//                         ))
//                     .toList();
//                 items.addAll(faces);
//                 break;
//               default:
//                 break;
//             }
//           }
//           onAnalyzed(items);
//         },
//       ),
//     ),
//   );
// }
