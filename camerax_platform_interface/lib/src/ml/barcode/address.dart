import 'address_type.dart';

final class Address {
  final AddressType type;
  final List<String> addressLines;

  Address({
    required this.type,
    required this.addressLines,
  });
}
