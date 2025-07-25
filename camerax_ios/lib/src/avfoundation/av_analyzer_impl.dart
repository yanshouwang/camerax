import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_ios/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'av_metadata_object_impl.dart';

final class AVAnalyzerImpl extends AVAnalyzer with AnalyzerImpl {
  @override
  final AVAnalyzerApi api;

  AVAnalyzerImpl.internal(this.api) : super.impl();

  factory AVAnalyzerImpl({
    List<AVMetadataObjectType>? types,
    required Consumer<AVAnalyzerResult> consumer,
  }) {
    final api = AVAnalyzerApi(
      types: types?.map((e) => e.api).toList(),
      consumer: AVAnalyzerResultConsumerApi(accept: (_, e) => consumer(e.impl)),
    );
    return AVAnalyzerImpl.internal(api);
  }
}

extension AVAnalyzerResultApiX on AVAnalyzerResultApi {
  AVAnalyzerResult get impl =>
      AVAnalyzerResult(objects: objects.map((e) => e.impl).toList());
}
