import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_android/src/ml/barcode.dart';
import 'package:camerax_android/src/ml/face.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class MlKitAnalyzerResultImpl extends MlKitAnalyzerResultApi {
  final MlKitAnalyzerResultProxyApi api;

  MlKitAnalyzerResultImpl.internal(this.api) : super.impl();

  @override
  Future<Object?> getThrowable1(BarcodeScannerApi detector) =>
      api.getThrowable1(detector.api).then((e) => e?.impl);

  @override
  Future<Object?> getThrowable2(FaceDetectorApi detector) =>
      api.getThrowable2(detector.api).then((e) => e?.impl);

  @override
  Future<int> getTimestamp() => api.getTimestamp();

  @override
  Future<List<BarcodeApi>?> getValue1(BarcodeScannerApi detector) =>
      api.getValue1(detector.api).then((e) => e?.map((e1) => e1.impl).toList());

  @override
  Future<List<FaceApi>?> getValue2(FaceDetectorApi detector) =>
      api.getValue2(detector.api).then((e) => e?.map((e1) => e1.impl).toList());
}

final class MlKitAnalyzerImpl extends MlKitAnalyzerApi
    with ImageAnalysisAnalyzerImpl {
  @override
  final MlKitAnalyzerProxyApi api;

  MlKitAnalyzerImpl.internal(this.api) : super.impl();

  factory MlKitAnalyzerImpl({
    required List<BarcodeScannerApi> detectors1,
    required List<FaceDetectorApi> detectors2,
    required ImageAnalysisCoordinateSystem targetCoordinateSystem,
    required MlKitAnalyzerResultConsumerApi consumer,
  }) {
    final api = MlKitAnalyzerProxyApi(
      detectors1: detectors1.map((e) => e.api).toList(),
      detectors2: detectors2.map((e) => e.api).toList(),
      targetCoordinateSystem: targetCoordinateSystem.api,
      consumer: consumer.api,
    );
    return MlKitAnalyzerImpl.internal(api);
  }
}

extension MlKitAnalyzerResultProxyApiX on MlKitAnalyzerResultProxyApi {
  MlKitAnalyzerResultApi get impl => MlKitAnalyzerResultImpl.internal(this);
}
