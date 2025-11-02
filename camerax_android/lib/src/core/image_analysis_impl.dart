import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

base mixin ImageAnalysisAnalyzerMixin on ImageAnalysisAnalyzer {
  ImageAnalysisAnalyzerApi get api;
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

extension ImageAnalysisAnalyzerX on ImageAnalysisAnalyzer {
  ImageAnalysisAnalyzerApi get api {
    final impl = this;
    if (impl is! ImageAnalysisAnalyzerMixin) throw TypeError();
    return impl.api;
  }
}
