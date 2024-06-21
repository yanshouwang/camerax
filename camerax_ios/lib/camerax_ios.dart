
import 'camerax_ios_platform_interface.dart';

class CameraxIos {
  Future<String?> getPlatformVersion() {
    return CameraxIosPlatform.instance.getPlatformVersion();
  }
}
