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

abstract base class BarcodeApi {
  BarcodeApi.impl();

  BarcodeFormat get format;
  RectApi? get boundingBox;
  List<PointApi>? get cornerPoints;
  Uint8List? get rawBytes;
  String? get rawValue;
  String? get displayValue;
  BarcodeType get valueType;
  BarcodeCalendarEventApi? get calendarEvent;
  BarcodeContactInfoApi? get contactInfo;
  BarcodeDriverLicenseApi? get driverLicense;
  BarcodeEmailApi? get email;
  BarcodeGeoPointApi? get geoPoint;
  BarcodePhoneApi? get phone;
  BarcodeSmsApi? get sms;
  BarcodeUrlBookmarkApi? get url;
  BarcodeWiFiApi? get wifi;
}

abstract base class BarcodeAddressApi {
  BarcodeAddressApi.impl();

  BarcodeAddressType get type;
  List<String> get addressLines;
}

abstract base class BarcodeCalendarEventApi {
  BarcodeCalendarEventApi.impl();

  BarcodeCalendarDateTimeApi? get start;
  BarcodeCalendarDateTimeApi? get end;
  String? get location;
  String? get organizer;
  String? get summary;
  String? get description;
  String? get status;
}

abstract base class BarcodeCalendarDateTimeApi {
  String? get rawValue;
  int get year;
  int get month;
  int get day;
  int get hours;
  int get minutes;
  int get seconds;
  bool get isUtc;
}

abstract base class BarcodeContactInfoApi {
  BarcodeContactInfoApi.impl();

  List<BarcodeAddressApi> get addresses;
  List<BarcodeEmailApi> get emails;
  BarcodePersonNameApi? get name;
  String? get organization;
  List<BarcodePhoneApi> get phones;
  String? get title;
  List<String> get urls;
}

abstract base class BarcodeDriverLicenseApi {
  BarcodeDriverLicenseApi.impl();

  String? get licenseNumber;
  String? get documentType;
  String? get expiryDate;
  String? get firstName;
  String? get middleName;
  String? get lastName;
  String? get gender;
  String? get birthDate;
  String? get issueDate;
  String? get issuingCountry;
  String? get addressState;
  String? get addressCity;
  String? get addressStreet;
  String? get addressZip;
}

abstract base class BarcodeEmailApi {
  BarcodeEmailApi.impl();

  BarcodeEmailType get type;
  String? get address;
  String? get subject;
  String? get body;
}

abstract base class BarcodeGeoPointApi {
  BarcodeGeoPointApi.impl();

  double get lat;
  double get lng;
}

abstract base class BarcodePersonNameApi {
  BarcodePersonNameApi.impl();

  String? get formattedName;
  String? get pronunciation;
  String? get prefix;
  String? get first;
  String? get middle;
  String? get last;
  String? get suffix;
}

abstract base class BarcodePhoneApi {
  BarcodePhoneApi.impl();

  BarcodePhoneType get type;
  String? get number;
}

abstract base class BarcodeSmsApi {
  BarcodeSmsApi.impl();

  String? get phoneNumber;
  String? get message;
}

abstract base class BarcodeUrlBookmarkApi {
  BarcodeUrlBookmarkApi.impl();

  String? get title;
  String? get url;
}

abstract base class BarcodeWiFiApi {
  BarcodeWiFiApi.impl();

  BarcodeWiFiType get encryptionType;
  String? get ssid;
  String? get password;
}
