import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'camerax_ios_platform_interface.dart';

/// An implementation of [CameraxIosPlatform] that uses method channels.
class MethodChannelCameraxIos extends CameraxIosPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('camerax_ios');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
