import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension EmailTypeApiX on EmailTypeApi {
  EmailType get impl {
    switch (this) {
      case EmailTypeApi.unknown:
        return EmailType.unknown;
      case EmailTypeApi.work:
        return EmailType.work;
      case EmailTypeApi.home:
        return EmailType.home;
    }
  }
}
