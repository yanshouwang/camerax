import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension SmsObj on $native.Sms {
  $interface.Sms get args {
    return $interface.Sms(
      phoneNumber: phoneNumber,
      message: message,
    );
  }
}
