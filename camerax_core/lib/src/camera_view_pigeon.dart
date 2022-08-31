import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pigeons.g.dart';

abstract class CameraViewPigeon extends PlatformInterface {
  /// Constructs a [CameraViewPigeon].
  CameraViewPigeon() : super(token: _token);

  static final Object _token = Object();

  static CameraViewPigeon _instance = _CameraViewPigeon();

  /// The default instance of [CameraViewPigeon] to use.
  ///
  /// Defaults to [_CameraViewPigeon].
  static CameraViewPigeon get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CameraViewPigeon] when
  /// they register themselves.
  static set instance(CameraViewPigeon instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> create(String id, String controllerId, int scaleTypeNumber);

  Future<void> setScaleType(String id, int number);
}

class _CameraViewPigeon extends CameraViewPigeon {
  final CameraViewHostPigeon hostPigeon;

  _CameraViewPigeon() : hostPigeon = CameraViewHostPigeon();

  @override
  Future<void> create(String id, String controllerId, int scaleTypeNumber) {
    return hostPigeon.create(id, controllerId, scaleTypeNumber);
  }

  @override
  Future<void> setScaleType(String id, int number) {
    return hostPigeon.setScaleType(id, number);
  }
}
