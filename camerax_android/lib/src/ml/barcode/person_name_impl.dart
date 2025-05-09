import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension PersonNameApiX on PersonNameApi {
  PersonName get impl {
    return PersonName(
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
