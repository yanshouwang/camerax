// import 'package:camerax_ios/src/camerax.g.dart';
// import 'package:camerax_ios/src/core.dart';
// import 'package:camerax_platform_interface/camerax_platform_interface.dart';

// import 'barcode_scanner_impl.dart';
// import 'detector_impl.dart';
// import 'face_detector_impl.dart';

// final class MlKitAnalyzerImpl extends MlKitAnalyzer with AnalyzerImpl {
//   @override
//   final AVAnalyzerApi api;

//   MlKitAnalyzerImpl.internal(this.api) : super.impl();

//   factory MlKitAnalyzerImpl({
//     required List<Detector> detectors,
//     required ImageAnalysisCoordinateSystem targetCoordinateSystem,
//     required Consumer<MlKitAnalyzerResult> consumer,
//   }) {
//     final api = AVAnalyzerApi(
//       types: detectors
//           .cast<DetectorImpl>()
//           .map((e) => e.typeApis)
//           .expand((e) => e)
//           .toList(),
//       consumer: AVAnalyzerResultConsumerApi(accept: (_, e) => consumer(e.impl)),
//     );
//     return MlKitAnalyzerImpl.internal(api);
//   }
// }

// final class MlKitAnalyzerResultImpl extends MlKitAnalyzerResult {
//   final AVAnalyzerResultApi api;

//   MlKitAnalyzerResultImpl.internal(this.api) : super.impl(timestamp: 0);

//   @override
//   Future<T?> getValue<T>(Detector<T> detector) {
//     if (detector is BarcodeScannerImpl) {
//       final impls = api.objects
//           .whereType<AVMetadataMachineReadableCodeObjectApi>()
//           .map((e) => e.impl)
//           .toList();
//       return Future.value(impls as T?);
//     }
//     if (detector is FaceDetectorImpl) {
//       final impls = api.objects
//           .whereType<AVMetadataFaceObjectApi>()
//           .map((e) => e.impl)
//           .toList();
//       return Future.value(impls as T?);
//     }
//     throw TypeError();
//   }

//   @override
//   Future<Object?> getThrowable(Detector detector) => Future.value(null);
// }

// extension AVAnalyzerResultApiX on AVAnalyzerResultApi {
//   MlKitAnalyzerResult get impl {
//     return MlKitAnalyzerResultImpl.internal(this);
//   }
// }
