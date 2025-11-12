import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_android/src/ml.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'vision_object_impl.dart';

final class VisionAnalyzerResultImpl extends VisionAnalyzerResult {
  final MlKitAnalyzerResultProxyApi api;
  @override
  final List<VisionObject> objects;

  VisionAnalyzerResultImpl.internal(this.api, this.objects) : super.impl();
}

final class VisionAnalyzerImpl extends VisionAnalyzer
    with ImageAnalysisAnalyzerImpl {
  VisionAnalyzerImpl.internal(this.api) : super.impl();

  factory VisionAnalyzerImpl({
    List<VisionObjectType>? types,
    required Consumer<VisionAnalyzerResult> consumer,
  }) {
    types ??= VisionObjectType.values;
    final formats = types
        .map((e) => e.api)
        .where((e) => e != BarcodeFormatApi.unknown)
        .toList();
    final detectors1 = [
      if (formats.isNotEmpty)
        BarcodeScannerProxyApi.options(
          options: BarcodeScannerOptionsProxyApi.build(formats: formats),
        ),
    ];
    final detectors2 = [
      if (types.contains(VisionObjectType.face))
        FaceDetectorProxyApi.options(
          options: FaceDetectorOptionsProxyApi.build(enableTracking: true),
        ),
    ];
    final api = MlKitAnalyzerProxyApi(
      detectors1: detectors1,
      detectors2: detectors2,
      targetCoordinateSystem: ImageAnalysisCoordinateSystemApi.viewReferenced,
      consumer: MlKitAnalyzerResultConsumerProxyApi(
        accept: (_, e) async {
          final res = await e.vimpl(detectors1, detectors2);
          consumer.accept(res);
        },
      ),
    );
    return VisionAnalyzerImpl.internal(api);
  }

  @override
  final MlKitAnalyzerProxyApi api;
}
