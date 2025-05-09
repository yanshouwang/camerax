import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension AddressTypeApiX on AddressTypeApi {
  AddressType get impl {
    switch (this) {
      case AddressTypeApi.unknown:
        return AddressType.unknown;
      case AddressTypeApi.work:
        return AddressType.work;
      case AddressTypeApi.home:
        return AddressType.home;
    }
  }
}
