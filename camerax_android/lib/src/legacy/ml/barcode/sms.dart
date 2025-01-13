import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension SmsObj on $native.Sms {
  $base.Sms get args {
    return $base.Sms(
      phoneNumber: phoneNumber,
      message: message,
    );
  }
}
