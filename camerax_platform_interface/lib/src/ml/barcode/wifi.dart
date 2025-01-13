import 'wifi_encryption_type.dart';

final class WiFi {
  final WiFiEncryptionType encryptionType;
  final String? ssid;
  final String? password;

  WiFi({
    required this.encryptionType,
    required this.ssid,
    required this.password,
  });
}
