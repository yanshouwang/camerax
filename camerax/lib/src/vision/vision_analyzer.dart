import 'dart:io';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'vision_object.dart';

final class VisionAnalyzer extends ImageAnalysisAnalyzerApi {
  VisionAnalyzer.impl() : super.impl();

  factory VisionAnalyzer({
    List<AVMetadataObjectType>? types,
    required ConsumerApi<AVAnalyzerResultApi> consumer,
  }) {
    if (Platform.isAndroid) return MlVisionAnalyzer(types, consumer);
    if (Platform.isIOS) return AVisionAnalyzer(types, consumer);
    throw UnimplementedError();
    final detectorApis = <DetectorApi>[];
    if (types != null) {
      final formatApis = types
          .map((e) => e.barcodeFormatApi)
          .where((e) => e != BarcodeFormatApi.unknown)
          .toList();
      if (formatApis.isNotEmpty) {
        final barcodeScannerApi = BarcodeScannerApi(
          options: BarcodeScannerOptionsApi.build(formats: formatApis),
        );
        detectorApis.add(barcodeScannerApi);
      }
      if (types.contains(AVMetadataObjectType.face)) {
        final faceDetectorApi = FaceDetectorApi();
        detectorApis.add(faceDetectorApi);
      }
    }
    final api = MlKitAnalyzerApi(
      detectors: detectorApis,
      targetCoordinateSystem: ImageAnalysisCoordinateSystemApi.viewReferenced,
      consumer: MlKitAnalyzerResultConsumerApi(
        accept: (_, e) async {
          final objects = <AVMetadataObjectApi>[];
          for (var detectorApi in detectorApis) {
            if (detectorApi is BarcodeScannerApi) {
              final barcodeApis = await e.getBarcodes(detectorApi);
              if (barcodeApis == null || barcodeApis.isEmpty) {
                continue;
              }
              final codeObjects = barcodeApis
                  .map((e1) => e1.implOf(e.timestamp))
                  .whereType<AVMetadataMachineReadableCodeObjectApi>();
              if (codeObjects.isEmpty) {
                continue;
              }
              objects.addAll(codeObjects);
            } else if (detectorApi is FaceDetectorApi) {
              final faceApis = await e.getFaces(detectorApi);
              if (faceApis == null || faceApis.isEmpty) {
                continue;
              }
              final faceObjects = faceApis
                  .map((e1) => e1.implOf(e.timestamp))
                  .whereType<AVMetadataFaceObjectApi>();
              objects.addAll(faceObjects);
            }
          }
          final value = AVAnalyzerResultApi(objects: objects);
          consumer(value);
        },
      ),
    );
    return VisionAnalyzer.internal(api);
  }
}
