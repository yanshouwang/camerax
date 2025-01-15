import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension EmailTypeObj on $native.EmailType {
  $interface.EmailType get args {
    switch (this) {
      case $native.EmailType.unknown:
        return $interface.EmailType.unknown;
      case $native.EmailType.work:
        return $interface.EmailType.work;
      case $native.EmailType.home:
        return $interface.EmailType.home;
    }
  }
}
