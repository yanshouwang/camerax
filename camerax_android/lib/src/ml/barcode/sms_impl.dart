import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension SmsApiX on SmsApi {
  Sms get impl {
    return Sms(
      phoneNumber: phoneNumber,
      message: message,
    );
  }
}
