import 'dart:typed_data';

import 'package:camerax_android/src/visionx.dart';
import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class Barcode$AddressImpl implements Barcode$Address {
  final BarcodeAddressProxyApi api;

  Barcode$AddressImpl.internal(this.api);

  @override
  List<String> get addressLines => api.addressLines;
  @override
  Barcode$Address$Type get type => api.type.impl;
}

final class Barcode$CalendarDateTimeImpl implements Barcode$CalendarDateTime {
  final BarcodeCalendarDateTimeProxyApi api;

  Barcode$CalendarDateTimeImpl.internal(this.api);

  @override
  int get day => throw UnimplementedError();
  @override
  int get hours => api.hours;
  @override
  bool get isUtc => api.isUtc;
  @override
  int get minutes => api.minutes;
  @override
  int get month => api.month;
  @override
  String? get rawValue => api.rawValue;
  @override
  int get seconds => api.seconds;
  @override
  int get year => api.year;
}

final class Barcode$CalendarEventImpl implements Barcode$CalendarEvent {
  final BarcodeCalendarEventProxyApi api;

  Barcode$CalendarEventImpl.internal(this.api);

  @override
  String? get description => api.description;
  @override
  Barcode$CalendarDateTime? get end => api.end?.impl;
  @override
  String? get location => api.location;
  @override
  String? get organizer => api.organizer;
  @override
  Barcode$CalendarDateTime? get start => api.start?.impl;
  @override
  String? get status => api.status;
  @override
  String? get summary => api.summary;
}

final class Barcode$ContactInfoImpl implements Barcode$ContactInfo {
  final BarcodeContactInfoProxyApi api;

  Barcode$ContactInfoImpl.internal(this.api);

  @override
  List<Barcode$Address> get addresses =>
      api.addresses.map((e) => e.impl).toList();
  @override
  List<Barcode$Email> get emails => api.emails.map((e) => e.impl).toList();
  @override
  Barcode$PersonName? get name => api.name?.impl;
  @override
  String? get organization => api.organization;
  @override
  List<Barcode$Phone> get phones => api.phones.map((e) => e.impl).toList();
  @override
  String? get title => api.title;
  @override
  List<String> get urls => api.urls;
}

final class Barcode$DriverLicenseImpl implements Barcode$DriverLicense {
  final BarcodeDriverLicenseProxyApi api;

  Barcode$DriverLicenseImpl.internal(this.api);

  @override
  String? get addressCity => api.addressCity;
  @override
  String? get addressState => api.addressState;
  @override
  String? get addressStreet => api.addressStreet;
  @override
  String? get addressZip => api.addressZip;
  @override
  String? get birthDate => api.birthDate;
  @override
  String? get documentType => api.documentType;
  @override
  String? get expiryDate => api.expiryDate;
  @override
  String? get firstName => api.firstName;
  @override
  String? get gender => api.gender;
  @override
  String? get issueDate => api.issueDate;
  @override
  String? get issuingCountry => api.issuingCountry;
  @override
  String? get lastName => api.lastName;
  @override
  String? get licenseNumber => api.licenseNumber;
  @override
  String? get middleName => api.middleName;
}

final class Barcode$EmailImpl implements Barcode$Email {
  final BarcodeEmailProxyApi api;

  Barcode$EmailImpl.internal(this.api);

  @override
  String? get address => api.address;
  @override
  String? get body => api.body;
  @override
  String? get subject => api.subject;
  @override
  Barcode$Email$Type get type => api.type.impl;
}

final class Barcode$GeoPointImpl implements Barcode$GeoPoint {
  final BarcodeGeoPointProxyApi api;

  Barcode$GeoPointImpl.internal(this.api);

  @override
  double get lat => api.lat;
  @override
  double get lng => api.lng;
}

final class Barcode$PersonNameImpl implements Barcode$PersonName {
  final BarcodePersonNameProxyApi api;

  Barcode$PersonNameImpl.internal(this.api);

  @override
  String? get first => api.first;
  @override
  String? get formattedName => api.formattedName;
  @override
  String? get last => api.last;
  @override
  String? get middle => api.middle;
  @override
  String? get prefix => api.prefix;
  @override
  String? get pronunciation => api.pronunciation;
  @override
  String? get suffix => api.suffix;
}

final class Barcode$PhoneImpl implements Barcode$Phone {
  final BarcodePhoneProxyApi api;

  Barcode$PhoneImpl.internal(this.api);

  @override
  String? get number => api.number;
  @override
  Barcode$Phone$Type get type => api.type.impl;
}

final class Barcode$SmsImpl implements Barcode$Sms {
  final BarcodeSmsProxyApi api;

  Barcode$SmsImpl.internal(this.api);

  @override
  String? get message => api.message;
  @override
  String? get phoneNumber => api.phoneNumber;
}

final class Barcode$UrlBookmarkImpl implements Barcode$UrlBookmark {
  final BarcodeUrlBookmarkProxyApi api;

  Barcode$UrlBookmarkImpl.internal(this.api);

  @override
  String? get title => api.title;
  @override
  String? get url => api.url;
}

final class Barcode$WiFiImpl implements Barcode$WiFi {
  final BarcodeWiFiProxyApi api;

  Barcode$WiFiImpl.internal(this.api);

  @override
  Barcode$WiFi$Type get encryptionType => api.encryptionType.impl;
  @override
  String? get password => api.password;
  @override
  String? get ssid => api.ssid;
}

final class BarcodeImpl implements Barcode {
  final BarcodeProxyApi api;

  BarcodeImpl.internal(this.api);

  @override
  Rect<int>? get boundingBox => api.boundingBox?.impl;
  @override
  Barcode$CalendarEvent? get calendarEvent => api.calendarEvent?.impl;
  @override
  Barcode$ContactInfo? get contactInfo => api.contactInfo?.impl;
  @override
  List<Point<int>>? get cornerPoints =>
      api.cornerPoints?.map((e) => e.impl).toList();
  @override
  String? get displayValue => api.displayValue;
  @override
  Barcode$DriverLicense? get driverLicense => api.driverLicense?.impl;
  @override
  Barcode$Email? get email => api.email?.impl;
  @override
  Barcode$Format get format => api.format.impl;
  @override
  Barcode$GeoPoint? get geoPoint => api.geoPoint?.impl;
  @override
  Barcode$Phone? get phone => api.phone?.impl;
  @override
  Uint8List? get rawBytes => api.rawBytes;
  @override
  String? get rawValue => api.rawValue;
  @override
  Barcode$Sms? get sms => api.sms?.impl;
  @override
  Barcode$UrlBookmark? get url => api.url?.impl;
  @override
  Barcode$Type get valueType => api.valueType.impl;
  @override
  Barcode$WiFi? get wifi => api.wifi?.impl;
}

extension Barcode$FormatX on Barcode$Format {
  BarcodeFormatApi get api => BarcodeFormatApi.values[index];

  VisionObjectType? get visionObjectTypeOrNull {
    switch (this) {
      case Barcode$Format.unknown:
      case Barcode$Format.all:
        return null;
      case Barcode$Format.code128:
        return VisionObjectType.code128;
      case Barcode$Format.code39:
        return VisionObjectType.code39;
      case Barcode$Format.code93:
        return VisionObjectType.code93;
      case Barcode$Format.codabar:
        return VisionObjectType.codabar;
      case Barcode$Format.dataMatrix:
        return VisionObjectType.dataMatrix;
      case Barcode$Format.ean13:
        return VisionObjectType.ean13;
      case Barcode$Format.ean8:
        return VisionObjectType.ean8;
      case Barcode$Format.itf:
        return VisionObjectType.itf14;
      case Barcode$Format.qrCode:
        return VisionObjectType.qr;
      case Barcode$Format.upcA:
        return null;
      case Barcode$Format.upcE:
        return VisionObjectType.upce;
      case Barcode$Format.pdf417:
        return VisionObjectType.pdf417;
      case Barcode$Format.aztec:
        return VisionObjectType.aztec;
    }
  }
}

extension BarcodeFormatApiX on BarcodeFormatApi {
  Barcode$Format get impl => Barcode$Format.values[index];
}

extension BarcodeTypeApiX on BarcodeTypeApi {
  Barcode$Type get impl => Barcode$Type.values[index];
}

extension BarcodeAddressTypeApiX on BarcodeAddressTypeApi {
  Barcode$Address$Type get impl => Barcode$Address$Type.values[index];
}

extension BarcodeEmailTypeApiX on BarcodeEmailTypeApi {
  Barcode$Email$Type get impl => Barcode$Email$Type.values[index];
}

extension BarcodePhoneTypeApiX on BarcodePhoneTypeApi {
  Barcode$Phone$Type get impl => Barcode$Phone$Type.values[index];
}

extension BarcodeWiFiTypeApiX on BarcodeWiFiTypeApi {
  Barcode$WiFi$Type get impl => Barcode$WiFi$Type.values[index];
}

extension BarcodeAddressProxyApiX on BarcodeAddressProxyApi {
  Barcode$Address get impl => Barcode$AddressImpl.internal(this);
}

extension BarcodeCalendarDateTimeProxyApiX on BarcodeCalendarDateTimeProxyApi {
  Barcode$CalendarDateTime get impl =>
      Barcode$CalendarDateTimeImpl.internal(this);
}

extension BarcodeCalendarEventProxyApiX on BarcodeCalendarEventProxyApi {
  Barcode$CalendarEvent get impl => Barcode$CalendarEventImpl.internal(this);
}

extension BarcodeContactInfoProxyApiX on BarcodeContactInfoProxyApi {
  Barcode$ContactInfo get impl => Barcode$ContactInfoImpl.internal(this);
}

extension BarcodeDriverLicenseProxyApiX on BarcodeDriverLicenseProxyApi {
  Barcode$DriverLicense get impl => Barcode$DriverLicenseImpl.internal(this);
}

extension BarcodeEmailProxyApiX on BarcodeEmailProxyApi {
  Barcode$Email get impl => Barcode$EmailImpl.internal(this);
}

extension BarcodeGeoPointProxyApiX on BarcodeGeoPointProxyApi {
  Barcode$GeoPoint get impl => Barcode$GeoPointImpl.internal(this);
}

extension BarcodePersonNameProxyApiX on BarcodePersonNameProxyApi {
  Barcode$PersonName get impl => Barcode$PersonNameImpl.internal(this);
}

extension BarcodePhoneProxyApiX on BarcodePhoneProxyApi {
  Barcode$Phone get impl => Barcode$PhoneImpl.internal(this);
}

extension BarcodeSmsProxyApiX on BarcodeSmsProxyApi {
  Barcode$Sms get impl => Barcode$SmsImpl.internal(this);
}

extension BarcodeUrlBookmarkProxyApiX on BarcodeUrlBookmarkProxyApi {
  Barcode$UrlBookmark get impl => Barcode$UrlBookmarkImpl.internal(this);
}

extension BarcodeWiFiProxyApiX on BarcodeWiFiProxyApi {
  Barcode$WiFi get impl => Barcode$WiFiImpl.internal(this);
}

extension BarcodeX on Barcode {
  VisionMachineReadableCodeObject visionMachineReadableCodeObject({
    required Size<int>? imageSize,
  }) =>
      VisionMachineReadableCodeObjectImpl.internal(this, imageSize: imageSize);
}

extension BarcodeProxyApiX on BarcodeProxyApi {
  Barcode get impl => BarcodeImpl.internal(this);
}
