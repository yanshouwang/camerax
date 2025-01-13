import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension AddressTypeObj on $native.AddressType {
  $base.AddressType get args {
    switch (this) {
      case $native.AddressType.unknown:
        return $base.AddressType.unknown;
      case $native.AddressType.work:
        return $base.AddressType.work;
      case $native.AddressType.home:
        return $base.AddressType.home;
    }
  }
}
