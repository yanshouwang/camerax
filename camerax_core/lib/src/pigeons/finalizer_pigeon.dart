import 'package:camerax_core/src/pigeons/pigeons.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

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
  final FinalizerHostPigeon hostPigeon;

  _FinalizerPigeon() : hostPigeon = FinalizerHostPigeon();

  @override
  Future<void> finalize(String id) {
    return hostPigeon.finalize(id);
  }
}
