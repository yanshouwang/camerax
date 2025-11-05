import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_ios/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'av_metadata_object_impl.dart';

final class AVAnalyzerImpl extends AVAnalyzer with ImageAnalysisAnalyzerImpl {
  @override
  final AVAnalyzer api;

  AVAnalyzerImpl.internal(this.api) : super.impl();

  factory AVAnalyzerImpl({
    List<AVMetadataObjectType>? types,
    required ConsumerApi<AVAnalyzerResult> consumer,
  }) {
    final api = AVAnalyzer(
      types: types?.map((e) => e.api).toList(),
      consumer: consumer.avAnalyzerResultConsumerApi,
    );
    return AVAnalyzerImpl.internal(api);
  }
}

extension AVAnalyzerResultApiX on AVAnalyzerResult {
  AVAnalyzerResult get impl =>
      AVAnalyzerResult(objects.map((e) => e.impl).toList());
}
