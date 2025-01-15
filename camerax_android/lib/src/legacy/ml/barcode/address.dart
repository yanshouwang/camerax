import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

import 'address_type.dart';

extension AddressObj on $native.Address {
  $interface.Address get args {
    return $interface.Address(
      type: type.args,
      addressLines: addressLines,
    );
  }
}
