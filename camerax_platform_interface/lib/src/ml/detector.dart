import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract base class Detector<T> extends PlatformInterface {
  static final _token = Object();

  Detector.impl() : super(token: _token);

  Future<void> close();
}
