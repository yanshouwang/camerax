import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/core.dart';

enum ImageAnalysisStrategy { keepOnlyLatest, blockProducer }

enum ImageAnalysisCoordinateSystem { original, sensor, viewReferenced }

enum ImageAnalysisOutputImageFormat { yuv420_888, rgba8888, nv21 }

abstract base class ImageAnalysisAnalyzerApi {
  ImageAnalysisAnalyzerApi.impl();

  factory ImageAnalysisAnalyzerApi({
    required void Function(ImageProxyApi image) analyze,
  }) => CameraXPlugin.instance.$ImageAnalysisAnalyzerApi(analyze: analyze);
}
