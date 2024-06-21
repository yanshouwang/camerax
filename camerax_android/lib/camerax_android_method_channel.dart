import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'camerax_android_platform_interface.dart';

/// An implementation of [CameraxAndroidPlatform] that uses method channels.
class MethodChannelCameraxAndroid extends CameraxAndroidPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('camerax_android');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
