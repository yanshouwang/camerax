import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'analyzer_impl.dart';
import 'image_proxy_impl.dart';

final class ImageAnalyzerImpl extends ImageAnalyzer with AnalyzerImpl {
  @override
  final ImageAnalyzerApi api;

  ImageAnalyzerImpl.internal(this.api) : super.impl();

  factory ImageAnalyzerImpl({required ImageAnalyzerCallback analyze}) {
    final api = ImageAnalyzerApi(
      analyze: (_, imageApi) => analyze(imageApi.impl),
    );
    return ImageAnalyzerImpl.internal(api);
  }
}
