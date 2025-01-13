import 'email_type.dart';

final class Email {
  final EmailType type;
  final String? address;
  final String? subject;
  final String? body;

  Email({
    required this.type,
    required this.address,
    required this.subject,
    required this.body,
  });
}
