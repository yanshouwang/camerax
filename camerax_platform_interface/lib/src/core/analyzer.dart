import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract base class Analyzer extends PlatformInterface {
  static final _token = Object();

  Analyzer.impl() : super(token: _token);
}
