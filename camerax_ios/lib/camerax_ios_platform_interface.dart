import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'camerax_ios_method_channel.dart';

abstract class CameraxIosPlatform extends PlatformInterface {
  /// Constructs a CameraxIosPlatform.
  CameraxIosPlatform() : super(token: _token);

  static final Object _token = Object();

  static CameraxIosPlatform _instance = MethodChannelCameraxIos();

  /// The default instance of [CameraxIosPlatform] to use.
  ///
  /// Defaults to [MethodChannelCameraxIos].
  static CameraxIosPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CameraxIosPlatform] when
  /// they register themselves.
  static set instance(CameraxIosPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
