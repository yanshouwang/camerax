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

final class Barcode {
  final BarcodeFormat format;
  final Rect<int>? boundingBox;
  final List<Point<int>>? cornerPoints;
  final Uint8List? rawBytes;
  final String? rawValue;
  final String? displayValue;
  final BarcodeType valueType;
  final BarcodeCalendarEvent? calendarEvent;
  final BarcodeContactInfo? contactInfo;
  final BarcodeDriverLicense? driverLicense;
  final BarcodeEmail? email;
  final BarcodeGeoPoint? geoPoint;
  final BarcodePhone? phone;
  final BarcodeSms? sms;
  final BarcodeUrlBookmark? url;
  final BarcodeWiFi? wifi;

  Barcode({
    required this.format,
    required this.boundingBox,
    required this.cornerPoints,
    required this.rawBytes,
    required this.rawValue,
    required this.displayValue,
    required this.valueType,
    required this.calendarEvent,
    required this.contactInfo,
    required this.driverLicense,
    required this.email,
    required this.geoPoint,
    required this.phone,
    required this.sms,
    required this.url,
    required this.wifi,
  });
}

final class BarcodeAddress {
  final BarcodeAddressType type;
  final List<String> addressLines;

  BarcodeAddress({required this.type, required this.addressLines});
}

final class BarcodeCalendarEvent {
  final DateTime? start;
  final DateTime? end;
  final String? location;
  final String? organizer;
  final String? summary;
  final String? description;
  final String? status;

  BarcodeCalendarEvent({
    required this.start,
    required this.end,
    required this.location,
    required this.organizer,
    required this.summary,
    required this.description,
    required this.status,
  });
}

final class BarcodeContactInfo {
  final List<BarcodeAddress> addresses;
  final List<BarcodeEmail> emails;
  final BarcodePersonName? name;
  final String? organization;
  final List<BarcodePhone> phones;
  final String? title;
  final List<String> urls;

  BarcodeContactInfo({
    required this.addresses,
    required this.emails,
    required this.name,
    required this.organization,
    required this.phones,
    required this.title,
    required this.urls,
  });
}

final class BarcodeDriverLicense {
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

  BarcodeDriverLicense({
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

final class BarcodeEmail {
  final BarcodeEmailType type;
  final String? address;
  final String? subject;
  final String? body;

  BarcodeEmail({
    required this.type,
    required this.address,
    required this.subject,
    required this.body,
  });
}

final class BarcodeGeoPoint {
  final double lat;
  final double lng;

  BarcodeGeoPoint(this.lat, this.lng);
}

final class BarcodePersonName {
  final String? formattedName;
  final String? pronunciation;
  final String? prefix;
  final String? first;
  final String? middle;
  final String? last;
  final String? suffix;

  BarcodePersonName({
    required this.formattedName,
    required this.pronunciation,
    required this.prefix,
    required this.first,
    required this.middle,
    required this.last,
    required this.suffix,
  });
}

final class BarcodePhone {
  final BarcodePhoneType type;
  final String? number;

  BarcodePhone({required this.type, required this.number});
}

final class BarcodeSms {
  final String? phoneNumber;
  final String? message;

  BarcodeSms({required this.phoneNumber, required this.message});
}

final class BarcodeUrlBookmark {
  final String? title;
  final String? url;

  BarcodeUrlBookmark({required this.title, required this.url});
}

final class BarcodeWiFi {
  final BarcodeWiFiType encryptionType;
  final String? ssid;
  final String? password;

  BarcodeWiFi({
    required this.encryptionType,
    required this.ssid,
    required this.password,
  });
}
