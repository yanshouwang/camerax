import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension PersonNameObj on $native.PersonName {
  $base.PersonName get args {
    return $base.PersonName(
      formattedName: formattedName,
      pronunciation: pronunciation,
      prefix: prefix,
      first: first,
      middle: middle,
      last: last,
      suffix: suffix,
    );
  }
}
