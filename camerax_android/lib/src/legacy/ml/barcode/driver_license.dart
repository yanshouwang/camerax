import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension DriverLicenseObj on $native.DriverLicense {
  $interface.DriverLicense get args {
    return $interface.DriverLicense(
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
