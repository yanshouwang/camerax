import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'address_type.dart';

extension AddressObj on $native.Address {
  $base.Address get args {
    return $base.Address(
      type: type.args,
      addressLines: addressLines,
    );
  }
}
