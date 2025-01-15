import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension WiFiEncryptionTypeObj on $native.WiFiEncryptionType {
  $interface.WiFiEncryptionType get args {
    switch (this) {
      case $native.WiFiEncryptionType.open:
        return $interface.WiFiEncryptionType.open;
      case $native.WiFiEncryptionType.wpa:
        return $interface.WiFiEncryptionType.wpa;
      case $native.WiFiEncryptionType.wep:
        return $interface.WiFiEncryptionType.wep;
    }
  }
}
