import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'analyzer.dart';
import 'image_proxy.dart';

final class ImageAnalyzer extends $base.Analyzer with Analyzer {
  @override
  final $native.ImageAnalyzer obj;

  ImageAnalyzer.$native(this.obj) : super.impl();

  factory ImageAnalyzer($base.ImageProxyCallback analyze) {
    final obj = $native.ImageAnalyzer(
      analyze: (obj, imageObj) {
        analyze(imageObj.args);
      },
    );
    return ImageAnalyzer.$native(obj);
  }
}
