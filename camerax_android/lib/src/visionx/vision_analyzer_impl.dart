import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_android/src/ml.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'vision_object_impl.dart';

final class VisionAnalyzerResultImpl extends VisionAnalyzerResult {
  final MlKitAnalyzerResult result;
  @override
  final List<VisionObject> objects;

  VisionAnalyzerResultImpl.internal(this.result, this.objects) : super.impl();
}

final class VisionAnalyzerImpl extends VisionAnalyzer
    with ImageAnalysisAnalyzerImpl {
  final MlKitAnalyzer analyzer;

  VisionAnalyzerImpl.internal(this.analyzer) : super.impl();

  factory VisionAnalyzerImpl({
    List<VisionObjectType>? types,
    required Consumer<VisionAnalyzerResult> consumer,
  }) {
    types ??= VisionObjectType.values;
    final formats = types.map((e) => e.formatOrNull).nonNulls.toList();
    final detectors = <Detector>[
      if (formats.isNotEmpty)
        BarcodeScanner.options(BarcodeScannerOptions(formats: formats)),
      if (types.contains(VisionObjectType.face))
        FaceDetector.options(FaceDetectorOptions(enableTracking: true)),
    ];
    final analyzer = MlKitAnalyzer(
      detectors: detectors,
      targetCoordinateSystem: ImageAnalysisCoordinateSystem.viewReferenced,
      consumer: Consumer(
        accept: (e) async {
          final res = await e.visionAnalyzerResult(detectors);
          consumer.accept(res);
        },
      ),
    );
    return VisionAnalyzerImpl.internal(analyzer);
  }

  @override
  ImageAnalysisAnalyzerProxyApi get api => analyzer.api;
}
