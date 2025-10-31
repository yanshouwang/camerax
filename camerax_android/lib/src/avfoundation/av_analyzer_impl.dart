import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/common/consumer.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'av_metadata_object_impl.dart';

final class AVAnalyzerImpl extends AVAnalyzer with ImageAnalysisAnalyzerMixin {
  @override
  final MlKitAnalyzerApi api;

  AVAnalyzerImpl.internal(this.api) : super.impl();

  factory AVAnalyzerImpl({
    List<AVMetadataObjectType>? types,
    required Consumer<AVAnalyzerResult> consumer,
  }) {
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
          final objects = <AVMetadataObject>[];
          for (var detectorApi in detectorApis) {
            if (detectorApi is BarcodeScannerApi) {
              final barcodeApis = await e.getBarcodes(detectorApi);
              if (barcodeApis == null || barcodeApis.isEmpty) {
                continue;
              }
              final codeObjects = barcodeApis
                  .map((e1) => e1.implOf(e.timestamp))
                  .whereType<AVMetadataMachineReadableCodeObject>();
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
                  .whereType<AVMetadataFaceObject>();
              objects.addAll(faceObjects);
            }
          }
          final value = AVAnalyzerResult(objects: objects);
          consumer(value);
        },
      ),
    );
    return AVAnalyzerImpl.internal(api);
  }
}
