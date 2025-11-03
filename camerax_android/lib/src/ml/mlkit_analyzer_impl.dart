import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'barcode.dart';
import 'face.dart';
import 'interfaces.dart';

final class MlKitAnalyzerResultImpl extends MlKitAnalyzerResult {
  final MlKitAnalyzerResultApi api;

  MlKitAnalyzerResultImpl.internal(this.api, {required super.timestamp})
    : super.impl();

  @override
  Future<T?> getValue<T>(Detector<T> detector) {
    if (detector is BarcodeScannerImpl) {
      return api
          .getValue1(detector.barcodeScannerApi)
          .then((e) => e?.map((e1) => e1.impl).toList() as T?);
    } else if (detector is FaceDetectorImpl) {
      return api
          .getValue2(detector.faceDetectorApi)
          .then((e) => e?.map((e1) => e1.impl).toList() as T?);
    } else {
      throw TypeError();
    }
  }

  @override
  Future<Object?> getThrowable<T>(Detector<T> detector) {
    if (detector is BarcodeScannerImpl) {
      return api.getThrowable1(detector.barcodeScannerApi).then((e) => e?.impl);
    } else if (detector is FaceDetectionImpl) {
      return api.getThrowable2(detector.faceDetectorApi).then((e) => e?.impl);
    } else {
      throw TypeError();
    }
  }
}

final class MlKitAnalyzerImpl extends MlKitAnalyzer
    with ImageAnalysisAnalyzerImpl {
  @override
  final MlKitAnalyzerApi api;

  MlKitAnalyzerImpl.internal(this.api) : super.impl();

  factory MlKitAnalyzerImpl({
    required List<Detector> detectors,
    required ImageAnalysisCoordinateSystem targetCoordinateSystem,
    required Consumer<MlKitAnalyzerResult> consumer,
  }) {
    final api = MlKitAnalyzerApi(
      detectors1: detectors
          .whereType<BarcodeScanner>()
          .map((e) => e.api)
          .toList(),
      detectors2: detectors
          .whereType<FaceDetector>()
          .map((e) => e.api)
          .toList(),
      targetCoordinateSystem: targetCoordinateSystem.api,
      consumer: consumer.mlKitAnalyzerResultConsumerApi,
    );
    return MlKitAnalyzerImpl.internal(api);
  }
}

extension MlKitAnalyzerResultApiX on MlKitAnalyzerResultApi {
  MlKitAnalyzerResult get impl {
    return MlKitAnalyzerResultImpl.internal(this, timestamp: timestamp);
  }
}
