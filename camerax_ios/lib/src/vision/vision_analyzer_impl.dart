import 'package:camerax_ios/src/avfoundation.dart';
import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_ios/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'vision_object_impl.dart';

final class VisionAnalyzerResultImpl extends VisionAnalyzerResult {
  final AVAnalyzerResultProxyApi api;

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
    final api = AVAnalyzerProxyApi(
      types: types.map((e) => e.api).toList(),
      consumer: AVAnalyzerResultConsumerProxyApi(
        accept: (_, e) async {
          final res = await e.vimpl();
          consumer.accept(res);
        },
      ),
    );
    return VisionAnalyzerImpl.internal(api);
  }

  @override
  final AVAnalyzerProxyApi api;
}
