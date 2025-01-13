import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'phone_type.dart';

extension PhoneObj on $native.Phone {
  $base.Phone get args {
    return $base.Phone(
      type: type.args,
      number: number,
    );
  }
}
