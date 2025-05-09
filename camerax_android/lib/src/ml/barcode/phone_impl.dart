import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'phone_type_impl.dart';

extension PhoneApiX on PhoneApi {
  Phone get impl {
    return Phone(
      type: type.impl,
      number: number,
    );
  }
}
