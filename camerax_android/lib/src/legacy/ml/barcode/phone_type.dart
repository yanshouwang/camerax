import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension PhoneTypeObj on $native.PhoneType {
  $interface.PhoneType get args {
    switch (this) {
      case $native.PhoneType.unknown:
        return $interface.PhoneType.unknown;
      case $native.PhoneType.work:
        return $interface.PhoneType.work;
      case $native.PhoneType.home:
        return $interface.PhoneType.home;
      case $native.PhoneType.fax:
        return $interface.PhoneType.fax;
      case $native.PhoneType.mobile:
        return $interface.PhoneType.mobile;
    }
  }
}
