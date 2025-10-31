import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'image_analysis.dart';
import 'image_proxy.dart';

abstract base class ImageAnalyzer extends ImageAnalysisAnalyzer {
  ImageAnalyzer.impl() : super.impl();

  factory ImageAnalyzer({required void Function(ImageProxy image) analyze}) =>
      CameraXPlugin.instance.newImageAnalyzer(analyze: analyze);
}
