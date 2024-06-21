
import 'camerax_platform_interface.dart';

class Camerax {
  Future<String?> getPlatformVersion() {
    return CameraxPlatform.instance.getPlatformVersion();
  }
}
