import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

import 'wifi_encryption_type.dart';

extension WiFiObj on $native.WiFi {
  $interface.WiFi get args {
    return $interface.WiFi(
      encryptionType: encryptionType.args,
      ssid: ssid,
      password: password,
    );
  }
}
