import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension AddressTypeObj on $native.AddressType {
  $interface.AddressType get args {
    switch (this) {
      case $native.AddressType.unknown:
        return $interface.AddressType.unknown;
      case $native.AddressType.work:
        return $interface.AddressType.work;
      case $native.AddressType.home:
        return $interface.AddressType.home;
    }
  }
}
