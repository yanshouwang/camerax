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

abstract base class BarcodeAddress {
  BarcodeAddress.impl();

  BarcodeAddressType get type;
  List<String> get addressLines;
}

abstract base class BarcodeCalendarDateTime {
  BarcodeCalendarDateTime.impl();

  String? get rawValue;
  int get year;
  int get month;
  int get day;
  int get hours;
  int get minutes;
  int get seconds;
  bool get isUtc;
}

abstract base class BarcodeCalendarEvent {
  BarcodeCalendarEvent.impl();

  BarcodeCalendarDateTime? get start;
  BarcodeCalendarDateTime? get end;
  String? get location;
  String? get organizer;
  String? get summary;
  String? get description;
  String? get status;
}

abstract base class BarcodeContactInfo {
  BarcodeContactInfo.impl();

  BarcodePersonName? get name;
  String? get organization;
  String? get title;
  List<BarcodePhone> get phones;
  List<BarcodeEmail> get emails;
  List<BarcodeAddress> get addresses;
  List<String> get urls;
}

abstract base class BarcodeDriverLicense {
  BarcodeDriverLicense.impl();

  String? get licenseNumber;
  String? get documentType;
  String? get firstName;
  String? get middleName;
  String? get lastName;
  String? get gender;
  String? get birthDate;
  String? get addressState;
  String? get addressCity;
  String? get addressStreet;
  String? get addressZip;
  String? get issuingCountry;
  String? get issueDate;
  String? get expiryDate;
}

abstract base class BarcodeEmail {
  BarcodeEmail.impl();

  BarcodeEmailType get type;
  String? get address;
  String? get subject;
  String? get body;
}

abstract base class BarcodeGeoPoint {
  BarcodeGeoPoint.impl();

  double get lat;
  double get lng;
}

abstract base class BarcodePersonName {
  BarcodePersonName.impl();

  String? get prefix;
  String? get first;
  String? get middle;
  String? get last;
  String? get suffix;
  String? get formattedName;
  String? get pronunciation;
}

abstract base class BarcodePhone {
  BarcodePhone.impl();

  BarcodePhoneType get type;
  String? get number;
}

abstract base class BarcodeSms {
  BarcodeSms.impl();

  String? get phoneNumber;
  String? get message;
}

abstract base class BarcodeUrlBookmark {
  BarcodeUrlBookmark.impl();

  String? get title;
  String? get url;
}

abstract base class BarcodeWiFi {
  BarcodeWiFi.impl();

  BarcodeWiFiType get encryptionType;
  String? get ssid;
  String? get password;
}

abstract base class Barcode {
  Barcode.impl();

  BarcodeFormat get format;
  Rect<int>? get boundingBox;
  List<Point>? get cornerPoints;
  Uint8List? get rawBytes;
  String? get rawValue;
  String? get displayValue;
  BarcodeType get valueType;
  BarcodeCalendarEvent? get calendarEvent;
  BarcodeContactInfo? get contactInfo;
  BarcodeDriverLicense? get driverLicense;
  BarcodeEmail? get email;
  BarcodeGeoPoint? get geoPoint;
  BarcodePhone? get phone;
  BarcodeSms? get sms;
  BarcodeUrlBookmark? get url;
  BarcodeWiFi? get wifi;
}
