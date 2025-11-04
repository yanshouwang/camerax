import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension BarcodeFormatX on BarcodeFormat {
  BarcodeFormatApi get api => BarcodeFormatApi.values[index];
}

extension BarcodeFormatApiX on BarcodeFormatApi {
  BarcodeFormat get impl => BarcodeFormat.values[index];
}

extension BarcodeTypeApiX on BarcodeTypeApi {
  BarcodeType get impl => BarcodeType.values[index];
}

extension BarcodeAddressTypeApiX on BarcodeAddressTypeApi {
  BarcodeAddressType get impl => BarcodeAddressType.values[index];
}

extension BarcodeEmailTypeApiX on BarcodeEmailTypeApi {
  BarcodeEmailType get impl => BarcodeEmailType.values[index];
}

extension BarcodePhoneTypeApiX on BarcodePhoneTypeApi {
  BarcodePhoneType get impl => BarcodePhoneType.values[index];
}

extension BarcodeWiFiTypeApiX on BarcodeWiFiTypeApi {
  BarcodeWiFiType get impl => BarcodeWiFiType.values[index];
}

extension BarcodeApiX on BarcodeApi {
  BarcodeApi get impl => BarcodeApi(
    format: format.impl,
    boundingBox: boundingBox?.impl,
    cornerPoints: cornerPoints?.map((e) => e.impl).toList(),
    rawBytes: rawBytes,
    rawValue: rawValue,
    displayValue: displayValue,
    valueType: valueType.impl,
    calendarEvent: calendarEvent?.impl,
    contactInfo: contactInfo?.impl,
    driverLicense: driverLicense?.impl,
    email: email?.impl,
    geoPoint: geoPoint?.impl,
    phone: phone?.impl,
    sms: sms?.impl,
    url: url?.impl,
    wifi: wifi?.impl,
  );
}

extension BarcodeAddressApiX on BarcodeAddressApi {
  BarcodeAddressApi get impl =>
      BarcodeAddressApi(type: type.impl, addressLines: addressLines);
}

extension BarcodeCalendarEventApiX on BarcodeCalendarEventApi {
  BarcodeCalendarEventApi get impl => BarcodeCalendarEventApi(
    start: start?.impl,
    end: end?.impl,
    location: location,
    organizer: organizer,
    summary: summary,
    description: description,
    status: status,
  );
}

extension BarcodeCalendarDateTimeApiX on BarcodeCalendarDateTimeApi {
  DateTime get impl => isUtc
      ? DateTime.utc(year, month, day, hours, minutes, seconds)
      : DateTime(year, month, day, hours, minutes, seconds);
}

extension BarcodeContactInfoApiX on BarcodeContactInfoApi {
  BarcodeContactInfoApi get impl => BarcodeContactInfoApi(
    addresses: addresses.map((address) => address.impl).toList(),
    emails: emails.map((email) => email.impl).toList(),
    name: name?.impl,
    organization: organization,
    phones: phones.map((phone) => phone.impl).toList(),
    title: title,
    urls: urls,
  );
}

extension BarcodeDriverLicenseApiX on BarcodeDriverLicenseApi {
  BarcodeDriverLicenseApi get impl => BarcodeDriverLicenseApi(
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

extension BarcodeEmailApiX on BarcodeEmailApi {
  BarcodeEmailApi get impl => BarcodeEmailApi(
    type: type.impl,
    address: address,
    subject: subject,
    body: body,
  );
}

extension BarcodeGeoPointApiX on BarcodeGeoPointApi {
  BarcodeGeoPointApi get impl => BarcodeGeoPointApi(lat, lng);
}

extension BarcodePersonNameApiX on BarcodePersonNameApi {
  BarcodePersonNameApi get impl => BarcodePersonNameApi(
    formattedName: formattedName,
    pronunciation: pronunciation,
    prefix: prefix,
    first: first,
    middle: middle,
    last: last,
    suffix: suffix,
  );
}

extension BarcodePhoneApiX on BarcodePhoneApi {
  BarcodePhoneApi get impl => BarcodePhoneApi(type: type.impl, number: number);
}

extension BarcodeSmsApiX on BarcodeSmsApi {
  BarcodeSmsApi get impl => BarcodeSmsApi(phoneNumber: phoneNumber, message: message);
}

extension BarcodeUrlBookmarkApiX on BarcodeUrlBookmarkApi {
  BarcodeUrlBookmarkApi get impl => BarcodeUrlBookmarkApi(title: title, url: url);
}

extension BarcodeWiFiApiX on BarcodeWiFiApi {
  BarcodeWiFiApi get impl => BarcodeWiFiApi(
    encryptionType: encryptionType.impl,
    ssid: ssid,
    password: password,
  );
}
