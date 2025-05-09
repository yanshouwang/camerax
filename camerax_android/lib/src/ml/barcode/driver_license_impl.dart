import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension DriverLicenseApiX on DriverLicenseApi {
  DriverLicense get impl {
    return DriverLicense(
      licenseNumber: licenseNumber,
      documentType: documentType,
      expiryDate: expiryDate,
      firstName: firstName,
      middleName: middleName,
      lastName: lastName,
      gender: gender,
      birthDate: birthDate,
      issueDate: issueDate,
      issuingCountry: issuingCountry,
      addressState: addressState,
      addressCity: addressCity,
      addressStreet: addressStreet,
      addressZip: addressZip,
    );
  }
}
