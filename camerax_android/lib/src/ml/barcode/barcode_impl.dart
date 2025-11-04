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

extension BarcodeProxyApiX on BarcodeProxyApi {
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

extension BarcodeAddressProxyApiX on BarcodeAddressProxyApi {
  BarcodeAddressApi get impl =>
      BarcodeAddressApi(type: type.impl, addressLines: addressLines);
}

extension BarcodeCalendarEventProxyApiX on BarcodeCalendarEventProxyApi {
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

extension BarcodeCalendarDateTimeProxyApiX on BarcodeCalendarDateTimeProxyApi {
  BarcodeCalendarDateTimeApi get impl => isUtc
      ? DateTime.utc(year, month, day, hours, minutes, seconds)
      : DateTime(year, month, day, hours, minutes, seconds);
}

extension BarcodeContactInfoProxyApiX on BarcodeContactInfoProxyApi {
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

extension BarcodeDriverLicenseProxyApiX on BarcodeDriverLicenseProxyApi {
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

extension BarcodeEmailProxyApiX on BarcodeEmailProxyApi {
  BarcodeEmailApi get impl => BarcodeEmailApi(
    type: type.impl,
    address: address,
    subject: subject,
    body: body,
  );
}

extension BarcodeGeoPointProxyApiX on BarcodeGeoPointProxyApi {
  BarcodeGeoPointApi get impl => BarcodeGeoPointApi(lat, lng);
}

extension BarcodePersonNameProxyApiX on BarcodePersonNameProxyApi {
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

extension BarcodePhoneProxyApiX on BarcodePhoneProxyApi {
  BarcodePhoneApi get impl => BarcodePhoneApi(type: type.impl, number: number);
}

extension BarcodeSmsProxyApiX on BarcodeSmsProxyApi {
  BarcodeSmsApi get impl =>
      BarcodeSmsApi(phoneNumber: phoneNumber, message: message);
}

extension BarcodeUrlBookmarkProxyApiX on BarcodeUrlBookmarkProxyApi {
  BarcodeUrlBookmarkApi get impl =>
      BarcodeUrlBookmarkApi(title: title, url: url);
}

extension BarcodeWiFiProxyApiX on BarcodeWiFiProxyApi {
  BarcodeWiFiApi get impl => BarcodeWiFiApi(
    encryptionType: encryptionType.impl,
    ssid: ssid,
    password: password,
  );
}
