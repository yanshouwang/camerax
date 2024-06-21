import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'camerax_platform_interface_platform_interface.dart';

/// An implementation of [CameraxPlatformInterfacePlatform] that uses method channels.
class MethodChannelCameraxPlatformInterface extends CameraxPlatformInterfacePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('camerax_platform_interface');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
