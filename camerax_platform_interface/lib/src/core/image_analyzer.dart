import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'analyzer.dart';
import 'image_proxy.dart';

typedef ImageProxyCallback = void Function(ImageProxy image);

abstract base class ImageAnalyzer extends Analyzer {
  ImageAnalyzer.impl() : super.impl();

  factory ImageAnalyzer({
    required ImageProxyCallback analyze,
  }) =>
      CameraXPlugin.instance.newImageAnalyzer(
        analyze: analyze,
      );
}
