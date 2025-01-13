import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension EmailTypeObj on $native.EmailType {
  $base.EmailType get args {
    switch (this) {
      case $native.EmailType.unknown:
        return $base.EmailType.unknown;
      case $native.EmailType.work:
        return $base.EmailType.work;
      case $native.EmailType.home:
        return $base.EmailType.home;
    }
  }
}
