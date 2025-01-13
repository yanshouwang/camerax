import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension WiFiEncryptionTypeObj on $native.WiFiEncryptionType {
  $base.WiFiEncryptionType get args {
    switch (this) {
      case $native.WiFiEncryptionType.open:
        return $base.WiFiEncryptionType.open;
      case $native.WiFiEncryptionType.wpa:
        return $base.WiFiEncryptionType.wpa;
      case $native.WiFiEncryptionType.wep:
        return $base.WiFiEncryptionType.wep;
    }
  }
}
