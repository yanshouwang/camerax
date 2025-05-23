import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'analyzer_impl.dart';
import 'image_proxy_impl.dart';

final class ImageAnalyzerImpl extends ImageAnalyzerChannel with AnalyzerImpl {
  @override
  final ImageAnalyzerApi api;

  ImageAnalyzerImpl.impl(this.api) : super.impl();

  factory ImageAnalyzerImpl({
    required ImageProxyCallback analyze,
  }) {
    final api = ImageAnalyzerApi(
      analyze: (_, imageApi) async {
        final image = await imageApi.impl();
        analyze(image);
      },
    );
    return ImageAnalyzerImpl.impl(api);
  }
}
