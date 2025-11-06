import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_android/src/ml/barcode.dart';
import 'package:camerax_android/src/ml/face.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class MlKitAnalyzerResultImpl extends MlKitAnalyzerResult {
  final MlKitAnalyzerResultProxyApi api;

  MlKitAnalyzerResultImpl.internal(this.api) : super.impl();

  @override
  int get timestamp => api.timestamp;

  @override
  Future<Object?> getThrowable(Detector detector) {
    if (detector is BarcodeScanner) {
      return api.getThrowable1(detector.api).then((e) => e?.impl);
    } else if (detector is FaceDetector) {
      return api.getThrowable2(detector.api).then((e) => e?.impl);
    } else {
      throw TypeError();
    }
  }

  @override
  Future<T?> getValue<T>(Detector<T> detector) {
    if (detector is BarcodeScanner) {
      final barcodeScanner = detector as BarcodeScanner;
      return api
          .getValue1(barcodeScanner.api)
          .then((e) => e?.map((e1) => e1.impl).toList() as T?);
    } else if (detector is FaceDetector) {
      final faceDetector = detector as FaceDetector;
      return api
          .getValue2(faceDetector.api)
          .then((e) => e?.map((e1) => e1.impl).toList() as T?);
    } else {
      throw TypeError();
    }
  }
}

final class MlKitAnalyzerImpl extends MlKitAnalyzer
    with ImageAnalysisAnalyzerImpl {
  @override
  final MlKitAnalyzerProxyApi api;

  MlKitAnalyzerImpl.internal(this.api) : super.impl();

  factory MlKitAnalyzerImpl({
    required List<Detector> detectors,
    required ImageAnalysisCoordinateSystem targetCoordinateSystem,
    required Consumer<MlKitAnalyzerResult> consumer,
  }) {
    final api = MlKitAnalyzerProxyApi(
      detectors1: detectors
          .whereType<BarcodeScanner>()
          .map((e) => e.api)
          .toList(),
      detectors2: detectors
          .whereType<FaceDetector>()
          .map((e) => e.api)
          .toList(),
      targetCoordinateSystem: targetCoordinateSystem.api,
      consumer: consumer.api,
    );
    return MlKitAnalyzerImpl.internal(api);
  }
}

extension MlKitAnalyzerResultProxyApiX on MlKitAnalyzerResultProxyApi {
  MlKitAnalyzerResult get impl => MlKitAnalyzerResultImpl.internal(this);
}
