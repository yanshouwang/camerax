import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_ios/src/core.dart';
import 'package:camerax_ios/src/visionx.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'av_metadata_object_impl.dart';

final class AVAnalyzerResultImpl extends AVAnalyzerResult {
  final AVAnalyzerResultProxyApi api;
  @override
  final List<AVMetadataObject> objects;

  AVAnalyzerResultImpl.internal(this.api, {required this.objects})
    : super.impl();
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

extension AVAnalyzerResultX on AVAnalyzerResult {
  VisionAnalyzerResult get visionAnalyzerResult =>
      VisionAnalyzerResultImpl.internal(this);
}

extension AVAnalyzerResultProxyApiX on AVAnalyzerResultProxyApi {
  Future<AVAnalyzerResult> impl() async {
    final api = this;
    final objects = await api.getObjects().then(
      (e) => Future.wait(e.map((e) => e.impl())),
    );
    return AVAnalyzerResultImpl.internal(this, objects: objects);
  }
}
