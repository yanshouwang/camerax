enum ImageAnalysisStrategy { keepOnlyLatest, blockProducer }

enum ImageAnalysisCoordinateSystem { original, sensor, viewReferenced }

enum ImageAnalysisOutputImageFormat { yuv420_888, rgba8888, nv21 }

abstract base class ImageAnalysisAnalyzer {
  ImageAnalysisAnalyzer.impl();
}
