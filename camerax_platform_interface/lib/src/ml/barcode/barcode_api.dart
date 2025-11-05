import 'dart:typed_data';

import 'package:camerax_platform_interface/src/common.dart';

enum BarcodeFormat {
  unknown,
  all,
  code128,
  code39,
  code93,
  codabar,
  dataMatrix,
  ean13,
  ean8,
  itf,
  qrCode,
  upcA,
  upcE,
  pdf417,
  aztec,
}

enum BarcodeType {
  unknown,
  contactInfo,
  email,
  isbn,
  phone,
  product,
  sms,
  text,
  url,
  wifi,
  geo,
  calendarEvent,
  driverLicense,
}

enum BarcodeAddressType { unknown, work, home }

enum BarcodeEmailType { unknown, work, home }

enum BarcodePhoneType { unknown, work, home, fax, mobile }

enum BarcodeWiFiType { open, wpa, wep }

abstract base class BarcodeAddressApi {
  BarcodeAddressApi.impl();

  Future<List<String>> getAddressLines();
  Future<BarcodeAddressType> getType();
}

abstract base class BarcodeCalendarDateTimeApi {
  BarcodeCalendarDateTimeApi.impl();

  Future<int> getDay();
  Future<int> getHours();
  Future<int> getMinutes();
  Future<int> getMonth();
  Future<String?> getRawValue();
  Future<int> getSeconds();
  Future<int> getYear();
  Future<bool> isUtc();
}

abstract base class BarcodeCalendarEventApi {
  BarcodeCalendarEventApi.impl();

  Future<String?> getDescription();
  Future<BarcodeCalendarDateTimeApi?> getEnd();
  Future<String?> getLocation();
  Future<String?> getOrganizer();
  Future<BarcodeCalendarDateTimeApi?> getStart();
  Future<String?> getStatus();
  Future<String?> getSummary();
}

abstract base class BarcodeContactInfoApi {
  BarcodeContactInfoApi.impl();

  Future<List<BarcodeAddressApi>> getAddresses();
  Future<List<BarcodeEmailApi>> getEmails();
  Future<BarcodePersonNameApi?> getName();
  Future<String?> getOrganization();
  Future<List<BarcodePhoneApi>> getPhones();
  Future<String?> getTitle();
  Future<List<String>> getUrls();
}

abstract base class BarcodeDriverLicenseApi {
  BarcodeDriverLicenseApi.impl();

  Future<String?> getAddressCity();
  Future<String?> getAddressState();
  Future<String?> getAddressStreet();
  Future<String?> getAddressZip();
  Future<String?> getBirthDate();
  Future<String?> getDocumentType();
  Future<String?> getExpiryDate();
  Future<String?> getFirstName();
  Future<String?> getGender();
  Future<String?> getIssueDate();
  Future<String?> getIssuingCountry();
  Future<String?> getLastName();
  Future<String?> getLicenseNumber();
  Future<String?> getMiddleName();
}

abstract base class BarcodeEmailApi {
  BarcodeEmailApi.impl();

  Future<String?> getAddress();
  Future<String?> getBody();
  Future<String?> getSubject();
  Future<BarcodeEmailType> getType();
}

abstract base class BarcodeGeoPointApi {
  BarcodeGeoPointApi.impl();

  Future<double> getLat();
  Future<double> getLng();
}

abstract base class BarcodePersonNameApi {
  BarcodePersonNameApi.impl();

  Future<String?> getFirst();
  Future<String?> getFormattedName();
  Future<String?> getLast();
  Future<String?> getMiddle();
  Future<String?> getPrefix();
  Future<String?> getPronunciation();
  Future<String?> getSuffix();
}

abstract base class BarcodePhoneApi {
  BarcodePhoneApi.impl();

  Future<String?> getNumber();
  Future<BarcodePhoneApi> getType();
}

abstract base class BarcodeSmsApi {
  BarcodeSmsApi.impl();

  Future<String?> getMessage();
  Future<String?> getPhoneNumber();
}

abstract base class BarcodeUrlBookmarkApi {
  BarcodeUrlBookmarkApi.impl();

  Future<String?> getTitle();
  Future<String?> getUrl();
}

abstract base class BarcodeWiFiApi {
  BarcodeWiFiApi.impl();

  Future<BarcodeWiFiType> getEncryptionType();
  Future<String?> getPassword();
  Future<String?> getSsid();
}

abstract base class BarcodeApi {
  BarcodeApi.impl();

  Future<RectApi?> getBoundingBox();
  Future<BarcodeCalendarEventApi?> getCalendarEvent();
  Future<BarcodeContactInfoApi?> getContactInfo();
  Future<List<Point>?> getCornerPoints();
  Future<String?> getDisplayValue();
  Future<BarcodeDriverLicenseApi?> getDriverLicense();
  Future<BarcodeEmailApi?> getEmail();
  Future<BarcodeFormat> getFormat();
  Future<BarcodeGeoPointApi?> getGeoPoint();
  Future<BarcodePhoneApi?> getPhone();
  Future<Uint8List?> getRawBytes();
  Future<String?> getRawValue();
  Future<BarcodeSmsApi?> getSms();
  Future<BarcodeUrlBookmarkApi?> getUrl();
  Future<BarcodeType> getValueType();
  Future<BarcodeWiFiApi?> getWifi();
}
