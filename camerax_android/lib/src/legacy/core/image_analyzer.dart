import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

import 'analyzer.dart';
import 'image_proxy.dart';

final class ImageAnalyzer extends $interface.ImageAnalyzer with Analyzer {
  @override
  final $native.ImageAnalyzer obj;

  ImageAnalyzer.$native(this.obj) : super.impl();

  factory ImageAnalyzer({
    required $interface.ImageProxyCallback analyze,
  }) {
    final obj = $native.ImageAnalyzer(
      analyze: (obj, imageObj) => analyze(imageObj.args),
    );
    return ImageAnalyzer.$native(obj);
  }
}
