import 'package:camerax_ios/src/avfoundation.dart';
import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_ios/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'vision_object_impl.dart';

final class VisionAnalyzerResultImpl extends VisionAnalyzerResult {
  final AVAnalyzerResult result;

  VisionAnalyzerResultImpl.internal(this.result) : super.impl();

  @override
  List<VisionObject> get objects =>
      result.objects.map((e) => e.visionObjectOrNull).nonNulls.toList();
}

final class VisionAnalyzerImpl extends VisionAnalyzer
    with ImageAnalysisAnalyzerImpl {
  final AVAnalyzer analyzer;

  VisionAnalyzerImpl.internal(this.analyzer) : super.impl();

  factory VisionAnalyzerImpl({
    List<VisionObjectType>? types,
    required Consumer<VisionAnalyzerResult> consumer,
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

  @override
  ImageAnalysisAnalyzerProxyApi get api => analyzer.api;
}
