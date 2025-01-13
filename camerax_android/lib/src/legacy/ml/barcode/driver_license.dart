import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension DriverLicenseObj on $native.DriverLicense {
  $base.DriverLicense get args {
    return $base.DriverLicense(
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
