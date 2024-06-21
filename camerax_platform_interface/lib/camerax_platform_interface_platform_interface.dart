import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'camerax_platform_interface_method_channel.dart';

abstract class CameraxPlatformInterfacePlatform extends PlatformInterface {
  /// Constructs a CameraxPlatformInterfacePlatform.
  CameraxPlatformInterfacePlatform() : super(token: _token);

  static final Object _token = Object();

  static CameraxPlatformInterfacePlatform _instance = MethodChannelCameraxPlatformInterface();

  /// The default instance of [CameraxPlatformInterfacePlatform] to use.
  ///
  /// Defaults to [MethodChannelCameraxPlatformInterface].
  static CameraxPlatformInterfacePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CameraxPlatformInterfacePlatform] when
  /// they register themselves.
  static set instance(CameraxPlatformInterfacePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
