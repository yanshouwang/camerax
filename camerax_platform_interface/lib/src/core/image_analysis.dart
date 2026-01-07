import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

enum ImageAnalysis$Strategy { keepOnlyLatest, blockProducer }

enum ImageAnalysis$CoordinateSystem { original, sensor, viewReferenced }

enum ImageAnalysis$OutputImageFormat { yuv420_888, rgba8888, nv21 }

abstract interface class ImageAnalysis$Analyzer {
  factory ImageAnalysis$Analyzer({required Consumer<ImageProxy> consumer}) =>
      ImageAnalysisChannel.instance.createAnalyzer(consumer: consumer);

  Future<void> analyze(ImageProxy image);
  Future<Size<int>?> getDefaultTargetResolution();
  Future<ImageAnalysis$CoordinateSystem> getTargetCoordinateSystem();
}

abstract base class ImageAnalysisChannel extends PlatformInterface {
  ImageAnalysisChannel() : super(token: _token);

  static final _token = Object();

  static ImageAnalysisChannel? _instance;

  static ImageAnalysisChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(ImageAnalysisChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  ImageAnalysis$Analyzer createAnalyzer({
    required Consumer<ImageProxy> consumer,
  });
}
