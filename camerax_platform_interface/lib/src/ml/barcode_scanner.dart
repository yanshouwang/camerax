import 'dart:typed_data';

import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';

import 'detector.dart';

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

enum BarcodeValueType {
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

enum AddressType { unknown, work, home }

enum EmailType { unknown, work, home }

enum PhoneType { unknown, work, home, fax, mobile }

enum WiFiEncryptionType { open, wpa, wep }

final class Barcode {
  final BarcodeFormat format;
  final Rect<int>? boundingBox;
  final List<Point<int>>? cornerPoints;
  final Uint8List? rawBytes;
  final String? rawValue;
  final String? displayValue;
  final BarcodeValueType valueType;
  final CalendarEvent? calendarEvent;
  final ContactInfo? contactInfo;
  final DriverLicense? driverLicense;
  final Email? email;
  final GeoPoint? geoPoint;
  final Phone? phone;
  final Sms? sms;
  final UrlBookmark? url;
  final WiFi? wifi;

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

final class Address {
  final AddressType type;
  final List<String> addressLines;

  Address({required this.type, required this.addressLines});
}

final class CalendarEvent {
  final DateTime? start;
  final DateTime? end;
  final String? location;
  final String? organizer;
  final String? summary;
  final String? description;
  final String? status;

  CalendarEvent({
    required this.start,
    required this.end,
    required this.location,
    required this.organizer,
    required this.summary,
    required this.description,
    required this.status,
  });
}

final class ContactInfo {
  final List<Address> addresses;
  final List<Email> emails;
  final PersonName? name;
  final String? organization;
  final List<Phone> phones;
  final String? title;
  final List<String> urls;

  ContactInfo({
    required this.addresses,
    required this.emails,
    required this.name,
    required this.organization,
    required this.phones,
    required this.title,
    required this.urls,
  });
}

final class DriverLicense {
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

  DriverLicense({
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

final class Email {
  final EmailType type;
  final String? address;
  final String? subject;
  final String? body;

  Email({
    required this.type,
    required this.address,
    required this.subject,
    required this.body,
  });
}

final class GeoPoint {
  final double lat;
  final double lng;

  GeoPoint(this.lat, this.lng);
}

final class PersonName {
  final String? formattedName;
  final String? pronunciation;
  final String? prefix;
  final String? first;
  final String? middle;
  final String? last;
  final String? suffix;

  PersonName({
    required this.formattedName,
    required this.pronunciation,
    required this.prefix,
    required this.first,
    required this.middle,
    required this.last,
    required this.suffix,
  });
}

final class Phone {
  final PhoneType type;
  final String? number;

  Phone({required this.type, required this.number});
}

final class Sms {
  final String? phoneNumber;
  final String? message;

  Sms({required this.phoneNumber, required this.message});
}

final class UrlBookmark {
  final String? title;
  final String? url;

  UrlBookmark({required this.title, required this.url});
}

final class WiFi {
  final WiFiEncryptionType encryptionType;
  final String? ssid;
  final String? password;

  WiFi({
    required this.encryptionType,
    required this.ssid,
    required this.password,
  });
}

abstract base class ZoomSuggestionOptionsZoomCallback {
  ZoomSuggestionOptionsZoomCallback.impl();

  factory ZoomSuggestionOptionsZoomCallback({
    required bool Function(double zoomRatio) setZoom,
  }) => CameraXPlugin.instance.newZoomSuggestionOptionsZoomCallback(
    setZoom: setZoom,
  );
}

abstract base class ZoomSuggestionOptions {
  ZoomSuggestionOptions.impl();

  factory ZoomSuggestionOptions({
    required ZoomSuggestionOptionsZoomCallback zoomCallback,
    double? maxSupportedZoomRatio,
  }) => CameraXPlugin.instance.newZoomSuggestionOptions(
    zoomCallback: zoomCallback,
    maxSupportedZoomRatio: maxSupportedZoomRatio,
  );
}

abstract base class BarcodeScannerOptions {
  BarcodeScannerOptions.impl();

  factory BarcodeScannerOptions({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptions? zoomSuggestionOptions,
  }) => CameraXPlugin.instance.newBarcodeScannerOptions(
    enableAllPotentialBarcodes: enableAllPotentialBarcodes,
    formats: formats,
    zoomSuggestionOptions: zoomSuggestionOptions,
  );
}

abstract base class BarcodeScanner extends Detector<List<Barcode>> {
  BarcodeScanner.impl() : super.impl();

  factory BarcodeScanner({BarcodeScannerOptions? options}) =>
      CameraXPlugin.instance.newBarcodeScanner(options: options);
}
