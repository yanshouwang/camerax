import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'image_analysis_impl.dart';
import 'image_proxy_impl.dart';

final class ImageAnalyzerImpl extends ImageAnalyzer
    with ImageAnalysisAnalyzerImpl {
  @override
  final ImageAnalyzerApi api;

  ImageAnalyzerImpl.internal(this.api) : super.impl();

  factory ImageAnalyzerImpl({
    required void Function(ImageProxy image) analyze,
  }) {
    final api = ImageAnalyzerApi(analyze: (_, e) => analyze(e.impl));
    return ImageAnalyzerImpl.internal(api);
  }
}
