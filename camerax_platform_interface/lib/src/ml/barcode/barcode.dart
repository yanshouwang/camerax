import 'dart:typed_data';

import 'package:camerax_platform_interface/src/common.dart';

import 'barcode_format.dart';
import 'barcode_value_type.dart';
import 'calendar_event.dart';
import 'contact_info.dart';
import 'driver_license.dart';
import 'email.dart';
import 'geo_point.dart';
import 'phone.dart';
import 'sms.dart';
import 'url_bookmark.dart';
import 'wifi.dart';

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
