import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';

import 'barcode.dart';
import 'face.dart';

abstract base class MlKitAnalyzerResultApi {
  MlKitAnalyzerResultApi.impl();

  Future<int> getTimestamp();
  Future<List<BarcodeApi>?> getValue1(BarcodeScannerApi detector);
  Future<List<FaceApi>?> getValue2(FaceDetectorApi detector);
  Future<Object?> getThrowable1(BarcodeScannerApi detector);
  Future<Object?> getThrowable2(FaceDetectorApi detector);
}

abstract base class MlKitAnalyzerApi extends ImageAnalysisAnalyzer {
  MlKitAnalyzerApi.impl() : super.impl();

  factory MlKitAnalyzerApi({
    required List<BarcodeScannerApi> detectors1,
    required List<FaceDetectorApi> detectors2,
    required ImageAnalysisCoordinateSystem targetCoordinateSystem,
    required MlKitAnalyzerResultConsumerApi consumer,
  }) => CameraXPlugin.instance.$MlKitAnalyzerApi(
    detectors1: detectors1,
    detectors2: detectors2,
    targetCoordinateSystem: targetCoordinateSystem,
    consumer: consumer,
  );
}
