import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'image_proxy_impl.dart';

final class ImageAnalysisImageAnalyzerImplImpl extends ImageAnalysisAnalyzer
    with ImageAnalysisAnalyzerImpl {
  @override
  final ImageAnalysisAnalyzerImplProxyApi api;

  ImageAnalysisImageAnalyzerImplImpl.internal(this.api) : super.impl();

  factory ImageAnalysisImageAnalyzerImplImpl({
    required Consumer<ImageProxy> consumer,
  }) {
    final api = ImageAnalysisAnalyzerImplProxyApi(consumer: consumer.api);
    return ImageAnalysisImageAnalyzerImplImpl.internal(api);
  }
}

base mixin ImageAnalysisAnalyzerImpl on ImageAnalysisAnalyzer {
  ImageAnalysisAnalyzerProxyApi get api;

  @override
  Future<void> analyze(ImageProxy image) => api.analyze(image.api);

  @override
  Future<Size<int>?> getDefaultTargetResolution() =>
      api.getDefaultTargetResolution().then((e) => e?.impl);

  @override
  Future<ImageAnalysisCoordinateSystem> getTargetCoordinateSystem() =>
      api.getTargetCoordinateSystem().then((e) => e.impl);
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

extension ImageAnalysisCoordinateSystemApiX
    on ImageAnalysisCoordinateSystemApi {
  ImageAnalysisCoordinateSystem get impl =>
      ImageAnalysisCoordinateSystem.values[index];
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

extension ImageAnalysisAnalyzerX on ImageAnalysisAnalyzer {
  ImageAnalysisAnalyzerProxyApi get api {
    final impl = this;
    if (impl is! ImageAnalysisAnalyzerImpl) throw TypeError();
    return impl.api;
  }
}
