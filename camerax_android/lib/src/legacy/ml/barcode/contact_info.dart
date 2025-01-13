import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'address.dart';
import 'email.dart';
import 'person_name.dart';
import 'phone.dart';

extension ContactInfoObj on $native.ContactInfo {
  $base.ContactInfo get args {
    return $base.ContactInfo(
      addresses: addresses.map((address) => address.args).toList(),
      emails: emails.map((email) => email.args).toList(),
      name: name?.args,
      organization: organization,
      phones: phones.map((phone) => phone.args).toList(),
      title: title,
      urls: urls,
    );
  }
}
