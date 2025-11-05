import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';

import 'image_proxy_api.dart';

enum ImageAnalysisStrategy { keepOnlyLatest, blockProducer }

enum ImageAnalysisCoordinateSystem { original, sensor, viewReferenced }

enum ImageAnalysisOutputImageFormat { yuv420_888, rgba8888, nv21 }

abstract base class ImageAnalysisAnalyzerApi {
  ImageAnalysisAnalyzerApi.impl();

  factory ImageAnalysisAnalyzerApi({required ImageProxyConsumerApi consumer}) =>
      CameraXPlugin.instance.$ImageAnalysisAnalyzerApi(consumer: consumer);

  void analyze(ImageProxyApi image);
  SizeApi? getDefaultTargetResolution();
  ImageAnalysisCoordinateSystem getTargetCoordinateSystem();
}
