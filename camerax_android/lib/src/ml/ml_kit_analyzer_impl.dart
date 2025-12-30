import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_android/src/ml.dart';
import 'package:camerax_android/src/visionx.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class MlKitAnalyzer$ResultImpl implements MlKitAnalyzer$Result {
  final MlKitAnalyzerResultProxyApi api;

  MlKitAnalyzer$ResultImpl.internal(this.api);

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

final class MlKitAnalyzerImpl extends ImageAnalysis$AnalyzerImpl
    implements MlKitAnalyzer {
  @override
  final MlKitAnalyzerProxyApi api;

  MlKitAnalyzerImpl.internal(this.api);
}

final class MlKitAnalyzerChannelImpl extends MlKitAnalyzerChannel {
  @override
  MlKitAnalyzer create({
    required List<Detector> detectors,
    required ImageAnalysis$CoordinateSystem targetCoordinateSystem,
    required Consumer<MlKitAnalyzer$Result> consumer,
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

extension MlKitAnalyzer$ResultX on MlKitAnalyzer$Result {
  Future<VisionAnalyzer$Result> visionAnalyzerResult(
    List<Detector> detectors,
  ) async {
    final objects = <VisionObject>[];
    final barcodeScanners = detectors.whereType<BarcodeScanner>();
    final faceDetectors = detectors.whereType<FaceDetector>();
    for (var detector in barcodeScanners) {
      final codeObjects = await getValue(detector).then(
        (e) => e
            ?.map((e1) => e1.visionMachineReadableCodeObject(imageSize: null))
            .toList(),
      );
      if (codeObjects == null) continue;
      objects.addAll(codeObjects);
    }
    for (var detector in faceDetectors) {
      final faceObjects = await getValue(detector).then(
        (e) => e?.map((e1) => e1.visionFaceObject(imageSize: null)).toList(),
      );
      if (faceObjects == null) continue;
      objects.addAll(faceObjects);
    }
    return VisionAnalyzer$ResultImpl.internal(this, objects);
  }
}

extension MlKitAnalyzerResultProxyApiX on MlKitAnalyzerResultProxyApi {
  MlKitAnalyzer$Result get impl => MlKitAnalyzer$ResultImpl.internal(this);
}
