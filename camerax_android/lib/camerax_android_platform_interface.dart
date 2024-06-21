import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'camerax_android_method_channel.dart';

abstract class CameraxAndroidPlatform extends PlatformInterface {
  /// Constructs a CameraxAndroidPlatform.
  CameraxAndroidPlatform() : super(token: _token);

  static final Object _token = Object();

  static CameraxAndroidPlatform _instance = MethodChannelCameraxAndroid();

  /// The default instance of [CameraxAndroidPlatform] to use.
  ///
  /// Defaults to [MethodChannelCameraxAndroid].
  static CameraxAndroidPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CameraxAndroidPlatform] when
  /// they register themselves.
  static set instance(CameraxAndroidPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
