
import 'camerax_android_platform_interface.dart';

class CameraxAndroid {
  Future<String?> getPlatformVersion() {
    return CameraxAndroidPlatform.instance.getPlatformVersion();
  }
}
