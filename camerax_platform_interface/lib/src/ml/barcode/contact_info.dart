import 'address.dart';
import 'email.dart';
import 'person_name.dart';
import 'phone.dart';

final class ContactInfo {
  final List<Address> addresses;
  final List<Email> emails;
  final PersonName? name;
  final String? organization;
  final List<Phone> phones;
  final String? title;
  final List<String> urls;

  ContactInfo({
    required this.addresses,
    required this.emails,
    required this.name,
    required this.organization,
    required this.phones,
    required this.title,
    required this.urls,
  });
}
