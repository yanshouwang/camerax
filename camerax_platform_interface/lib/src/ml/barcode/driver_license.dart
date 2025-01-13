final class DriverLicense {
  final String? licenseNumber;
  final String? documentType;
  final String? expiryDate;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? gender;
  final String? birthDate;
  final String? issueDate;
  final String? issuingCountry;
  final String? addressState;
  final String? addressCity;
  final String? addressStreet;
  final String? addressZip;

  DriverLicense({
    required this.licenseNumber,
    required this.documentType,
    required this.expiryDate,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.gender,
    required this.birthDate,
    required this.issueDate,
    required this.issuingCountry,
    required this.addressState,
    required this.addressCity,
    required this.addressStreet,
    required this.addressZip,
  });
}
