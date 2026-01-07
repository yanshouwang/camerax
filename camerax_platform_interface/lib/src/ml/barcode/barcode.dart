import 'dart:typed_data';

import 'package:camerax_platform_interface/src/common.dart';

enum Barcode$Format {
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

enum Barcode$Type {
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

enum Barcode$Address$Type { unknown, work, home }

enum Barcode$Email$Type { unknown, work, home }

enum Barcode$Phone$Type { unknown, work, home, fax, mobile }

enum Barcode$WiFi$Type { open, wpa, wep }

abstract interface class Barcode$Address {
  Barcode$Address$Type get type;
  List<String> get addressLines;
}

abstract interface class Barcode$CalendarDateTime {
  String? get rawValue;
  int get year;
  int get month;
  int get day;
  int get hours;
  int get minutes;
  int get seconds;
  bool get isUtc;
}

abstract interface class Barcode$CalendarEvent {
  Barcode$CalendarDateTime? get start;
  Barcode$CalendarDateTime? get end;
  String? get location;
  String? get organizer;
  String? get summary;
  String? get description;
  String? get status;
}

abstract interface class Barcode$ContactInfo {
  Barcode$PersonName? get name;
  String? get organization;
  String? get title;
  List<Barcode$Phone> get phones;
  List<Barcode$Email> get emails;
  List<Barcode$Address> get addresses;
  List<String> get urls;
}

abstract interface class Barcode$DriverLicense {
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

abstract interface class Barcode$Email {
  Barcode$Email$Type get type;
  String? get address;
  String? get subject;
  String? get body;
}

abstract interface class Barcode$GeoPoint {
  double get lat;
  double get lng;
}

abstract interface class Barcode$PersonName {
  String? get prefix;
  String? get first;
  String? get middle;
  String? get last;
  String? get suffix;
  String? get formattedName;
  String? get pronunciation;
}

abstract interface class Barcode$Phone {
  Barcode$Phone$Type get type;
  String? get number;
}

abstract interface class Barcode$Sms {
  String? get phoneNumber;
  String? get message;
}

abstract interface class Barcode$UrlBookmark {
  String? get title;
  String? get url;
}

abstract interface class Barcode$WiFi {
  Barcode$WiFi$Type get encryptionType;
  String? get ssid;
  String? get password;
}

abstract interface class Barcode {
  Barcode$Format get format;
  Rect<int>? get boundingBox;
  List<Point<int>>? get cornerPoints;
  Uint8List? get rawBytes;
  String? get rawValue;
  String? get displayValue;
  Barcode$Type get valueType;
  Barcode$CalendarEvent? get calendarEvent;
  Barcode$ContactInfo? get contactInfo;
  Barcode$DriverLicense? get driverLicense;
  Barcode$Email? get email;
  Barcode$GeoPoint? get geoPoint;
  Barcode$Phone? get phone;
  Barcode$Sms? get sms;
  Barcode$UrlBookmark? get url;
  Barcode$WiFi? get wifi;
}
