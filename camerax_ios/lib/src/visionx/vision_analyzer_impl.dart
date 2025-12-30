import 'package:camerax_ios/src/avfoundation.dart';
import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_ios/src/core.dart';
import 'package:camerax_ios/src/visionx.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class VisionAnalyzer$ResultImpl implements VisionAnalyzer$Result {
  final AVAnalyzer$Result result;

  VisionAnalyzer$ResultImpl.internal(this.result);

  @override
  List<VisionObject> get objects =>
      result.objects.map((e) => e.visionObjectOrNull).nonNulls.toList();
}

final class VisionAnalyzerImpl extends ImageAnalysis$AnalyzerImpl
    implements VisionAnalyzer {
  final AVAnalyzer analyzer;

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
    final analyzer = AVAnalyzer(
      types: types.map((e) => e.avMetadataObjectType).toList(),
      consumer: Consumer(
        accept: (e) => consumer.accept(e.visionAnalyzerResult),
      ),
    );
    return VisionAnalyzerImpl.internal(analyzer);
  }
}
