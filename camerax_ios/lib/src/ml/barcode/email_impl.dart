import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'email_type_impl.dart';

extension EmailApiX on EmailApi {
  Email get impl {
    return Email(
      type: type.impl,
      address: address,
      subject: subject,
      body: body,
    );
  }
}
