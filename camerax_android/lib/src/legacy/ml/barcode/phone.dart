import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

import 'phone_type.dart';

extension PhoneObj on $native.Phone {
  $interface.Phone get args {
    return $interface.Phone(
      type: type.args,
      number: number,
    );
  }
}
