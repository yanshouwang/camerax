import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'camerax_core_method_channel.dart';

abstract class CameraxCorePlatform extends PlatformInterface {
  /// Constructs a CameraxCorePlatform.
  CameraxCorePlatform() : super(token: _token);

  static final Object _token = Object();

  static CameraxCorePlatform _instance = MethodChannelCameraxCore();

  /// The default instance of [CameraxCorePlatform] to use.
  ///
  /// Defaults to [MethodChannelCameraxCore].
  static CameraxCorePlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CameraxCorePlatform] when
  /// they register themselves.
  static set instance(CameraxCorePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
