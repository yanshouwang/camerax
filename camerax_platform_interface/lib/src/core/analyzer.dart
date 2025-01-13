import 'package:camerax_platform_interface/src/camerax.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'image_proxy.dart';

typedef ImageProxyCallback = void Function(ImageProxy image);

abstract base class Analyzer extends PlatformInterface {
  static final _token = Object();

  Analyzer.impl() : super(token: _token);

  factory Analyzer(ImageProxyCallback analyze) =>
      CameraX.instance.createAnalyzer(analyze);
}
