import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'image_proxy.dart';

abstract base class Analyzer extends PlatformInterface {
  static final _token = Object();

  Analyzer.impl() : super(token: _token);

  void analyze(ImageProxy image);
}
