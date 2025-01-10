import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract base class Size extends PlatformInterface {
  static final _token = Object();

  Size.impl() : super(token: _token);

  Future<int> getWidth();
  Future<int> getHeight();
}
