import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension PhoneTypeApiX on PhoneTypeApi {
  PhoneType get impl {
    switch (this) {
      case PhoneTypeApi.unknown:
        return PhoneType.unknown;
      case PhoneTypeApi.work:
        return PhoneType.work;
      case PhoneTypeApi.home:
        return PhoneType.home;
      case PhoneTypeApi.fax:
        return PhoneType.fax;
      case PhoneTypeApi.mobile:
        return PhoneType.mobile;
    }
  }
}
