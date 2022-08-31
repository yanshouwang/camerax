import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pigeons.g.dart';

abstract class FinalizerPigeon extends PlatformInterface {
  /// Constructs a [FinalizerPigeon].
  FinalizerPigeon() : super(token: _token);

  static final Object _token = Object();

  static FinalizerPigeon _instance = _FinalizerPigeon();

  /// The default instance of [FinalizerPigeon] to use.
  ///
  /// Defaults to [_FinalizerPigeon].
  static FinalizerPigeon get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FinalizerPigeon] when
  /// they register themselves.
  static set instance(FinalizerPigeon instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> finalize(String id);
}

class _FinalizerPigeon extends FinalizerPigeon {
  final FinalizerHostPigeon host;

  _FinalizerPigeon() : host = FinalizerHostPigeon();

  @override
  Future<void> finalize(String id) {
    return host.finalize(id);
  }
}
