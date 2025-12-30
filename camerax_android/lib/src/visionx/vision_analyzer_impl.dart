import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_android/src/ml.dart';
import 'package:camerax_android/src/visionx.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class VisionAnalyzer$ResultImpl implements VisionAnalyzer$Result {
  final MlKitAnalyzer$Result result;
  @override
  final List<VisionObject> objects;

  VisionAnalyzer$ResultImpl.internal(this.result, this.objects);
}

final class VisionAnalyzerImpl extends ImageAnalysis$AnalyzerImpl
    implements VisionAnalyzer {
  final MlKitAnalyzer analyzer;

  VisionAnalyzerImpl.internal(this.analyzer);

  @override
  ImageAnalysisAnalyzerProxyApi get api => analyzer.api;
}

final class VisionAnalyzerChannelImpl extends VisionAnalyzerChannel {
  @override
  VisionAnalyzer create({
    List<VisionObjectType>? types,
    required Consumer<VisionAnalyzer$Result> consumer,
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
      targetCoordinateSystem: ImageAnalysis$CoordinateSystem.viewReferenced,
      consumer: Consumer(
        accept: (e) async {
          final res = await e.visionAnalyzerResult(detectors);
          consumer.accept(res);
        },
      ),
    );
    return VisionAnalyzerImpl.internal(analyzer);
  }
}
