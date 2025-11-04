import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'image_proxy_impl.dart';

final class ImageAnalysisImageAnalyzerImplImpl extends ImageAnalysisAnalyzerApi
    with ImageAnalysisAnalyzerImpl {
  @override
  final ImageAnalysisAnalyzerImplProxyApi api;

  ImageAnalysisImageAnalyzerImplImpl.internal(this.api) : super.impl();

  factory ImageAnalysisImageAnalyzerImplImpl({
    required void Function(ImageProxyApi image) analyze,
  }) {
    final api = ImageAnalysisAnalyzerImplProxyApi(
      analyze: (_, e) => analyze(e.impl),
    );
    return ImageAnalysisImageAnalyzerImplImpl.internal(api);
  }
}

base mixin ImageAnalysisAnalyzerImpl on ImageAnalysisAnalyzerApi {
  ImageAnalysisAnalyzerProxyApi get api;
}

extension ImageAnalysisStrategyX on ImageAnalysisStrategy {
  ImageAnalysisStrategyApi get api => ImageAnalysisStrategyApi.values[index];
}

extension ImageAnalysisStrategyApiX on ImageAnalysisStrategyApi {
  ImageAnalysisStrategy get impl => ImageAnalysisStrategy.values[index];
}

extension ImageAnalysisCoordinateSystemX on ImageAnalysisCoordinateSystem {
  ImageAnalysisCoordinateSystemApi get api =>
      ImageAnalysisCoordinateSystemApi.values[index];
}

extension ImageAnalysisOutputImageFormatX on ImageAnalysisOutputImageFormat {
  ImageAnalysisOutputImageFormatApi get api =>
      ImageAnalysisOutputImageFormatApi.values[index];
}

extension ImageAnalysisOutputImageFormatApiX
    on ImageAnalysisOutputImageFormatApi {
  ImageAnalysisOutputImageFormat get impl =>
      ImageAnalysisOutputImageFormat.values[index];
}

extension ImageAnalysisAnalyzerApiX on ImageAnalysisAnalyzerApi {
  ImageAnalysisAnalyzerProxyApi get api {
    final impl = this;
    if (impl is! ImageAnalysisAnalyzerImpl) throw TypeError();
    return impl.api;
  }
}
