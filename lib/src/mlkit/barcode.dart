import 'dart:typed_data';
import 'dart:ui';

import 'util.dart';

class Barcode {
  final List<Offset> corners;
  final BarcodeFormat format;
  final Uint8List rawBytes;
  final String rawValue;
  final BarcodeType type;
  final CalendarEvent calendarEvent;
  final ContactInfo contactInfo;
  final DriverLicense driverLicense;
  final Email email;
  final GeoPoint geoPoint;
  final Phone phone;
  final SMS sms;
  final UrlBookmark url;
  final WiFi wifi;

  Barcode.fromNative(Map<dynamic, dynamic> data)
      : corners = toCorners(data['corners']),
        format = toFormat(data['format']),
        rawBytes = data['rawBytes'],
        rawValue = data['rawValue'],
        type = BarcodeType.values[data['type']],
        calendarEvent = toCalendarEvent(data['calendarEvent']),
        contactInfo = toContactInfo(data['contactInfo']),
        driverLicense = toDriverLicense(data['driverLicense']),
        email = toEmail(data['email']),
        geoPoint = toGeoPoint(data['geoPoint']),
        phone = toPhone(data['phone']),
        sms = toSMS(data['sms']),
        url = toUrl(data['url']),
        wifi = toWiFi(data['wifi']);
}

class CalendarEvent {
  final String description;
  final DateTime start;
  final DateTime end;
  final String location;
  final String organizer;
  final String status;
  final String summary;

  CalendarEvent.fromNative(Map<dynamic, dynamic> data)
      : description = data['description'],
        start = DateTime.tryParse(data['start']),
        end = DateTime.tryParse(data['end']),
        location = data['location'],
        organizer = data['organizer'],
        status = data['status'],
        summary = data['summary'];
}

class ContactInfo {
  final List<Address> addresses;
  final List<Email> emails;
  final PersonName name;
  final String organization;
  final List<Phone> phones;
  final String title;
  final List<String> urls;

  ContactInfo.fromNative(Map<dynamic, dynamic> data)
      : addresses = List.unmodifiable(
            data['addresses'].map((e) => Address.fromNative(e))),
        emails =
            List.unmodifiable(data['emails'].map((e) => Email.fromNative(e))),
        name = toName(data['name']),
        organization = data['organization'],
        phones =
            List.unmodifiable(data['phones'].map((e) => Phone.fromNative(e))),
        title = data['title'],
        urls = List.unmodifiable(data['urls']);
}

class Address {
  final List<String> addressLines;
  final int type;

  Address.fromNative(Map<dynamic, dynamic> data)
      : addressLines = List.unmodifiable(data['addressLines']),
        type = data['type'];
}

class PersonName {
  final String first;
  final String middle;
  final String last;
  final String prefix;
  final String suffix;
  final String formattedName;
  final String pronunciation;

  PersonName.fromNative(Map<dynamic, dynamic> data)
      : first = data['first'],
        middle = data['middle'],
        last = data['last'],
        prefix = data['prefix'],
        suffix = data['suffix'],
        formattedName = data['formattedName'],
        pronunciation = data['pronunciation'];
}

class DriverLicense {
  final String addressCity;
  final String addressState;
  final String addressStreet;
  final String addressZip;
  final String birthDate;
  final String documentType;
  final String expiryDate;
  final String firstName;
  final String gender;
  final String issueDate;
  final String issuingCountry;
  final String lastName;
  final String licenseNumber;
  final String middleName;

  DriverLicense.fromNative(Map<dynamic, dynamic> data)
      : addressCity = data['addressCity'],
        addressState = data['addressState'],
        addressStreet = data['addressStreet'],
        addressZip = data['addressZip'],
        birthDate = data['birthDate'],
        documentType = data['documentType'],
        expiryDate = data['expiryDate'],
        firstName = data['firstName'],
        gender = data['gender'],
        issueDate = data['issueDate'],
        issuingCountry = data['issuingCountry'],
        lastName = data['lastName'],
        licenseNumber = data['licenseNumber'],
        middleName = data['middleName'];
}

class Email {
  final String address;
  final String body;
  final String subject;
  final EmailType type;

  Email.fromNative(Map<dynamic, dynamic> data)
      : address = data['address'],
        body = data['body'],
        subject = data['subject'],
        type = EmailType.values[data['type']];
}

class GeoPoint {
  final double latitude;
  final double longitude;

  GeoPoint.fromNative(Map<dynamic, dynamic> data)
      : latitude = data['latitude'],
        longitude = data['longitude'];
}

class Phone {
  final String number;
  final PhoneType type;

  Phone.fromNative(Map<dynamic, dynamic> data)
      : number = data['number'],
        type = PhoneType.values[data['type']];
}

class SMS {
  final String message;
  final String phoneNumber;

  SMS.fromNative(Map<dynamic, dynamic> data)
      : message = data['message'],
        phoneNumber = data['phoneNumber'];
}

class UrlBookmark {
  final String title;
  final String url;

  UrlBookmark.fromNative(Map<dynamic, dynamic> data)
      : title = data['title'],
        url = data['url'];
}

class WiFi {
  final EncryptionType encryptionType;
  final String ssid;
  final String password;

  WiFi.fromNative(Map<dynamic, dynamic> data)
      : encryptionType = EncryptionType.values[data['encryptionType']],
        ssid = data['ssid'],
        password = data['password'];
}

enum BarcodeFormat {
  unknown,
  all,
  code128,
  code39,
  code93,
  codebar,
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

enum EmailType {
  unknown,
  work,
  home,
}

enum PhoneType {
  unknown,
  work,
  home,
  fax,
  mobile,
}

enum EncryptionType {
  none,
  open,
  wpa,
  wep,
}
