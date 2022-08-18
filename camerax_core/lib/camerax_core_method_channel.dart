import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'camerax_core_platform_interface.dart';

/// An implementation of [CameraxCorePlatform] that uses method channels.
class MethodChannelCameraxCore extends CameraxCorePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('camerax_core');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
