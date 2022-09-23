import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'camerax_platform_interface.dart';

/// An implementation of [CameraxPlatform] that uses method channels.
class MethodChannelCamerax extends CameraxPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('camerax');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
