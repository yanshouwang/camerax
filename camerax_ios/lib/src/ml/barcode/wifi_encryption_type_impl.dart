import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension WiFiEncryptionTypeApiX on WiFiEncryptionTypeApi {
  WiFiEncryptionType get impl {
    switch (this) {
      case WiFiEncryptionTypeApi.open:
        return WiFiEncryptionType.open;
      case WiFiEncryptionTypeApi.wpa:
        return WiFiEncryptionType.wpa;
      case WiFiEncryptionTypeApi.wep:
        return WiFiEncryptionType.wep;
    }
  }
}
