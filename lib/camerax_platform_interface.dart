import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'camerax_method_channel.dart';

abstract class CameraxPlatform extends PlatformInterface {
  /// Constructs a CameraxPlatform.
  CameraxPlatform() : super(token: _token);

  static final Object _token = Object();

  static CameraxPlatform _instance = MethodChannelCamerax();

  /// The default instance of [CameraxPlatform] to use.
  ///
  /// Defaults to [MethodChannelCamerax].
  static CameraxPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CameraxPlatform] when
  /// they register themselves.
  static set instance(CameraxPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
