import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'address_type_impl.dart';

extension AddressApiX on AddressApi {
  Address get impl {
    return Address(
      type: type.impl,
      addressLines: addressLines,
    );
  }
}
