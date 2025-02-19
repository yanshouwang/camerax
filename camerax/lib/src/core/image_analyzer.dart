import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;
import 'package:meta/meta.dart';

import 'analyzer.dart';
import 'image_proxy.dart';

typedef ImageProxyCallback = void Function(ImageProxy image);

final class ImageAnalyzer extends Analyzer {
  final $interface.ImageAnalyzer _obj;

  ImageAnalyzer({
    required ImageProxyCallback analyze,
  }) : _obj = $interface.ImageAnalyzer(
          analyze: (image) => analyze(image.args),
        );

  @internal
  @override
  $interface.ImageAnalyzer get obj => _obj;
}
