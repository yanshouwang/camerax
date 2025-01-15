import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

import 'email_type.dart';

extension EmailObj on $native.Email {
  $interface.Email get args {
    return $interface.Email(
      type: type.args,
      address: address,
      subject: subject,
      body: body,
    );
  }
}
