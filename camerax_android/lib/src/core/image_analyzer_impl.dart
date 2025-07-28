import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'analyzer_impl.dart';
import 'image_proxy_impl.dart';

final class ImageAnalyzerImpl extends ImageAnalyzer with AnalyzerImpl {
  @override
  final ImageAnalyzerApi api;

  ImageAnalyzerImpl.internal(this.api) : super.impl();

  factory ImageAnalyzerImpl({
    required ImageProxyCallback analyze,
  }) {
    final api = ImageAnalyzerApi(
      analyze: (_, e) => analyze(e.impl),
    );
    return ImageAnalyzerImpl.internal(api);
  }
}
