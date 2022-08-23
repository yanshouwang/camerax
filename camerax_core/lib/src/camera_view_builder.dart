import 'package:flutter/widgets.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class CameraViewBuilder extends PlatformInterface {
  /// Constructs a [CameraViewBuilder].
  CameraViewBuilder() : super(token: _token);

  static final Object _token = Object();

  static CameraViewBuilder _instance = _CameraViewBuilder();

  /// The default instance of [CameraViewBuilder] to use.
  ///
  /// Defaults to [_CameraViewBuilder].
  static CameraViewBuilder get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CameraViewBuilder] when
  /// they register themselves.
  static set instance(CameraViewBuilder instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Widget build({required String id, required String viewType});
}

class _CameraViewBuilder extends CameraViewBuilder {
  @override
  Widget build({required String id, required String viewType}) {
    throw UnimplementedError();
  }
}
