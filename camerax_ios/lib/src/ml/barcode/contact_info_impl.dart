import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'address_impl.dart';
import 'email_impl.dart';
import 'person_name_impl.dart';
import 'phone_impl.dart';

extension ContactInfoApiX on ContactInfoApi {
  ContactInfo get impl {
    return ContactInfo(
      addresses: addresses.map((address) => address.impl).toList(),
      emails: emails.map((email) => email.impl).toList(),
      name: name?.impl,
      organization: organization,
      phones: phones.map((phone) => phone.impl).toList(),
      title: title,
      urls: urls,
    );
  }
}
