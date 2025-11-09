import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_ios/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'av_metadata_object_impl.dart';

final class AVAnalyzerResultImpl extends AVAnalyzerResult {
  final AVAnalyzerResultProxyApi api;

  AVAnalyzerResultImpl.internal(this.api) : super.impl();

  @override
  List<AVMetadataObject> get objects => api.objects.map((e) => e.impl).toList();
}

final class AVAnalyzerImpl extends AVAnalyzer with ImageAnalysisAnalyzerImpl {
  @override
  final AVAnalyzerProxyApi api;

  AVAnalyzerImpl.internal(this.api) : super.impl();

  factory AVAnalyzerImpl({
    List<AVMetadataObjectType>? types,
    required Consumer<AVAnalyzerResult> consumer,
  }) {
    final api = AVAnalyzerProxyApi(
      types: types?.map((e) => e.api).toList(),
      consumer: consumer.api,
    );
    return AVAnalyzerImpl.internal(api);
  }
}

extension AVAnalyzerResultProxyApiX on AVAnalyzerResultProxyApi {
  AVAnalyzerResult get impl => AVAnalyzerResultImpl.internal(this);
}
