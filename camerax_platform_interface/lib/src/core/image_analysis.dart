import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';

import 'image_proxy.dart';

enum ImageAnalysisStrategy { keepOnlyLatest, blockProducer }

enum ImageAnalysisCoordinateSystem { original, sensor, viewReferenced }

enum ImageAnalysisOutputImageFormat { yuv420_888, rgba8888, nv21 }

abstract base class ImageAnalysisAnalyzer {
  ImageAnalysisAnalyzer.impl();

  factory ImageAnalysisAnalyzer({required Consumer<ImageProxy> consumer}) =>
      CameraXPlugin.instance.$ImageAnalysisAnalyzer(consumer: consumer);

  Future<void> analyze(ImageProxy image);
  Future<Size<int>?> getDefaultTargetResolution();
  Future<ImageAnalysisCoordinateSystem> getTargetCoordinateSystem();
}
