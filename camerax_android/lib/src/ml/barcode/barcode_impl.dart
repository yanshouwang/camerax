import 'dart:typed_data';

import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class BarcodeAddressImpl extends BarcodeAddressApi {
  final BarcodeAddressProxyApi api;

  BarcodeAddressImpl.internal(this.api) : super.impl();

  @override
  List<String> get addressLines => api.addressLines;
  @override
  BarcodeAddressType get type => api.type.impl;
}

final class BarcodeCalendarDateTimeImpl extends BarcodeCalendarDateTimeApi {
  final BarcodeCalendarDateTimeProxyApi api;

  BarcodeCalendarDateTimeImpl.internal(this.api) : super.impl();

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

final class BarcodeCalendarEventImpl extends BarcodeCalendarEventApi {
  final BarcodeCalendarEventProxyApi api;

  BarcodeCalendarEventImpl.internal(this.api) : super.impl();

  @override
  String? get description => api.description;
  @override
  BarcodeCalendarDateTimeApi? get end => api.end?.impl;
  @override
  String? get location => api.location;
  @override
  String? get organizer => api.organizer;
  @override
  BarcodeCalendarDateTimeApi? get start => api.start?.impl;
  @override
  String? get status => api.status;
  @override
  String? get summary => api.summary;
}

final class BarcodeContactInfoImpl extends BarcodeContactInfoApi {
  final BarcodeContactInfoProxyApi api;

  BarcodeContactInfoImpl.internal(this.api) : super.impl();

  @override
  List<BarcodeAddressApi> get addresses =>
      api.addresses.map((e) => e.impl).toList();
  @override
  List<BarcodeEmailApi> get emails => api.emails.map((e) => e.impl).toList();
  @override
  BarcodePersonNameApi? get name => api.name?.impl;
  @override
  String? get organization => api.organization;
  @override
  List<BarcodePhoneApi> get phones => api.phones.map((e) => e.impl).toList();
  @override
  String? get title => api.title;
  @override
  List<String> get urls => api.urls;
}

final class BarcodeDriverLicenseImpl extends BarcodeDriverLicenseApi {
  final BarcodeDriverLicenseProxyApi api;

  BarcodeDriverLicenseImpl.internal(this.api) : super.impl();

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

final class BarcodeEmailImpl extends BarcodeEmailApi {
  final BarcodeEmailProxyApi api;

  BarcodeEmailImpl.internal(this.api) : super.impl();

  @override
  String? get address => api.address;

  @override
  String? get body => api.body;

  @override
  String? get subject => api.subject;

  @override
  BarcodeEmailType get type => api.type.impl;
}

final class BarcodeGeoPointImpl extends BarcodeGeoPointApi {
  final BarcodeGeoPointProxyApi api;

  BarcodeGeoPointImpl.internal(this.api) : super.impl();

  @override
  double get lat => api.lat;
  @override
  double get lng => api.lng;
}

final class BarcodePersonNameImpl extends BarcodePersonNameApi {
  final BarcodePersonNameProxyApi api;

  BarcodePersonNameImpl.internal(this.api) : super.impl();

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

final class BarcodePhoneImpl extends BarcodePhoneApi {
  final BarcodePhoneProxyApi api;

  BarcodePhoneImpl.internal(this.api) : super.impl();

  @override
  String? get number => api.number;
  @override
  BarcodePhoneType get type => api.type.impl;
}

final class BarcodeSmsImpl extends BarcodeSmsApi {
  final BarcodeSmsProxyApi api;

  BarcodeSmsImpl.internal(this.api) : super.impl();

  @override
  String? get message => api.message;
  @override
  String? get phoneNumber => api.phoneNumber;
}

final class BarcodeUrlBookmarkImpl extends BarcodeUrlBookmarkApi {
  final BarcodeUrlBookmarkProxyApi api;

  BarcodeUrlBookmarkImpl.internal(this.api) : super.impl();

  @override
  String? get title => api.title;
  @override
  String? get url => api.url;
}

final class BarcodeWiFiImpl extends BarcodeWiFiApi {
  final BarcodeWiFiProxyApi api;

  BarcodeWiFiImpl.internal(this.api) : super.impl();

  @override
  BarcodeWiFiType get encryptionType => api.encryptionType.impl;
  @override
  String? get password => api.password;
  @override
  String? get ssid => api.ssid;
}

final class BarcodeImpl extends BarcodeApi {
  final BarcodeProxyApi api;

  BarcodeImpl.internal(this.api) : super.impl();

  @override
  RectApi? get boundingBox => api.boundingBox?.impl;
  @override
  BarcodeCalendarEventApi? get calendarEvent => api.calendarEvent?.impl;
  @override
  BarcodeContactInfoApi? get contactInfo => api.contactInfo?.impl;
  @override
  List<PointApi>? get cornerPoints =>
      api.cornerPoints?.map((e) => e.impl).toList();
  @override
  String? get displayValue => api.displayValue;
  @override
  BarcodeDriverLicenseApi? get driverLicense => api.driverLicense?.impl;
  @override
  BarcodeEmailApi? get email => api.email?.impl;
  @override
  BarcodeFormat get format => api.format.impl;
  @override
  BarcodeGeoPointApi? get geoPoint => api.geoPoint?.impl;
  @override
  BarcodePhoneApi? get phone => api.phone?.impl;
  @override
  Uint8List? get rawBytes => api.rawBytes;
  @override
  String? get rawValue => api.rawValue;
  @override
  BarcodeSmsApi? get sms => api.sms?.impl;
  @override
  BarcodeUrlBookmarkApi? get url => api.url?.impl;
  @override
  BarcodeType get valueType => api.valueType.impl;
  @override
  BarcodeWiFiApi? get wifi => api.wifi?.impl;
}

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

extension BarcodeAddressProxyApiX on BarcodeAddressProxyApi {
  BarcodeAddressApi get impl => BarcodeAddressImpl.internal(this);
}

extension BarcodeCalendarEventProxyApiX on BarcodeCalendarEventProxyApi {
  BarcodeCalendarEventApi get impl => BarcodeCalendarEventImpl.internal(this);
}

extension BarcodeCalendarDateTimeProxyApiX on BarcodeCalendarDateTimeProxyApi {
  BarcodeCalendarDateTimeApi get impl =>
      BarcodeCalendarDateTimeImpl.internal(this);
}

extension BarcodeContactInfoProxyApiX on BarcodeContactInfoProxyApi {
  BarcodeContactInfoApi get impl => BarcodeContactInfoImpl.internal(this);
}

extension BarcodeDriverLicenseProxyApiX on BarcodeDriverLicenseProxyApi {
  BarcodeDriverLicenseApi get impl => BarcodeDriverLicenseImpl.internal(this);
}

extension BarcodeEmailProxyApiX on BarcodeEmailProxyApi {
  BarcodeEmailApi get impl => BarcodeEmailImpl.internal(this);
}

extension BarcodeGeoPointProxyApiX on BarcodeGeoPointProxyApi {
  BarcodeGeoPointApi get impl => BarcodeGeoPointImpl.internal(this);
}

extension BarcodePersonNameProxyApiX on BarcodePersonNameProxyApi {
  BarcodePersonNameApi get impl => BarcodePersonNameImpl.internal(this);
}

extension BarcodePhoneProxyApiX on BarcodePhoneProxyApi {
  BarcodePhoneApi get impl => BarcodePhoneImpl.internal(this);
}

extension BarcodeSmsProxyApiX on BarcodeSmsProxyApi {
  BarcodeSmsApi get impl => BarcodeSmsImpl.internal(this);
}

extension BarcodeUrlBookmarkProxyApiX on BarcodeUrlBookmarkProxyApi {
  BarcodeUrlBookmarkApi get impl => BarcodeUrlBookmarkImpl.internal(this);
}

extension BarcodeWiFiProxyApiX on BarcodeWiFiProxyApi {
  BarcodeWiFiApi get impl => BarcodeWiFiImpl.internal(this);
}

extension BarcodeProxyApiX on BarcodeProxyApi {
  BarcodeApi get impl => BarcodeImpl.internal(this);
}
