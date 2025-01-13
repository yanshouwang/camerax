import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension PhoneTypeObj on $native.PhoneType {
  $base.PhoneType get args {
    switch (this) {
      case $native.PhoneType.unknown:
        return $base.PhoneType.unknown;
      case $native.PhoneType.work:
        return $base.PhoneType.work;
      case $native.PhoneType.home:
        return $base.PhoneType.home;
      case $native.PhoneType.fax:
        return $base.PhoneType.fax;
      case $native.PhoneType.mobile:
        return $base.PhoneType.mobile;
    }
  }
}
