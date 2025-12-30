import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_ios/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class ImageAnalysis$AnalyzerImpl
    implements ImageAnalysis$Analyzer {
  ImageAnalysisAnalyzerProxyApi get api;

  @override
  Future<void> analyze(ImageProxy image) => api.analyze(image.api);

  @override
  Future<Size<int>?> getDefaultTargetResolution() => throw UnimplementedError();

  @override
  Future<ImageAnalysis$CoordinateSystem> getTargetCoordinateSystem() =>
      throw UnimplementedError();
}

final class ImageAnalysis$AnalyzerImplImpl extends ImageAnalysis$AnalyzerImpl {
  @override
  final ImageAnalysisAnalyzerImplProxyApi api;

  ImageAnalysis$AnalyzerImplImpl.internal(this.api);
}

final class ImageAnalysisChannelImpl extends ImageAnalysisChannel {
  @override
  ImageAnalysis$Analyzer createAnalyzer({
    required Consumer<ImageProxy> consumer,
  }) {
    final api = ImageAnalysisAnalyzerImplProxyApi(consumer: consumer.api);
    return ImageAnalysis$AnalyzerImplImpl.internal(api);
  }
}

extension ImageAnalysis$StrategyX on ImageAnalysis$Strategy {
  ImageAnalysisStrategyApi get api => ImageAnalysisStrategyApi.values[index];
}

extension ImageAnalysisStrategyApiX on ImageAnalysisStrategyApi {
  ImageAnalysis$Strategy get impl => ImageAnalysis$Strategy.values[index];
}

extension ImageAnalysis$CoordinateSystemX on ImageAnalysis$CoordinateSystem {
  ImageAnalysisCoordinateSystemApi get api =>
      ImageAnalysisCoordinateSystemApi.values[index];
}

extension ImageAnalysisCoordinateSystemApiX
    on ImageAnalysisCoordinateSystemApi {
  ImageAnalysis$CoordinateSystem get impl =>
      ImageAnalysis$CoordinateSystem.values[index];
}

extension ImageAnalysis$OutputImageFormatX on ImageAnalysis$OutputImageFormat {
  ImageAnalysisOutputImageFormatApi get api =>
      ImageAnalysisOutputImageFormatApi.values[index];
}

extension ImageAnalysisOutputImageFormatApiX
    on ImageAnalysisOutputImageFormatApi {
  ImageAnalysis$OutputImageFormat get impl =>
      ImageAnalysis$OutputImageFormat.values[index];
}

extension ImageAnalysis$AnalyzerX on ImageAnalysis$Analyzer {
  ImageAnalysisAnalyzerProxyApi get api {
    final impl = this;
    if (impl is! ImageAnalysis$AnalyzerImpl) throw TypeError();
    return impl.api;
  }
}
