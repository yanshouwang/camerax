import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'analyzer.dart';
import 'image_proxy.dart';

typedef ImageProxyCallback = void Function(ImageProxy image);

final _token = Object();

abstract interface class ImageAnalyzer implements Analyzer {
  factory ImageAnalyzer({
    required ImageProxyCallback analyze,
  }) {
    final instance = CameraXPlugin.instance.newImageAnalyzer(
      analyze: analyze,
    );
    PlatformInterface.verify(instance as PlatformInterface, _token);
    return instance;
  }
}

abstract base class ImageAnalyzerChannel extends PlatformInterface
    implements ImageAnalyzer {
  ImageAnalyzerChannel.impl() : super(token: _token);
}
