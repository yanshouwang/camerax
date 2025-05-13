import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'wifi_encryption_type_impl.dart';

extension WiFiApiX on WiFiApi {
  WiFi get impl {
    return WiFi(
      encryptionType: encryptionType.impl,
      ssid: ssid,
      password: password,
    );
  }
}
