import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'detector_impl.dart';

final class ZoomSuggestionOptionsZoomCallbackImpl
    extends ZoomSuggestionOptionsZoomCallback {
  final ZoomSuggestionOptionsZoomCallbackApi api;

  ZoomSuggestionOptionsZoomCallbackImpl.internal(this.api) : super.impl();

  factory ZoomSuggestionOptionsZoomCallbackImpl({
    required bool Function(double zoomRatio) setZoom,
  }) {
    final api = ZoomSuggestionOptionsZoomCallbackApi(
      setZoom: (_, e) => setZoom(e),
    );
    return ZoomSuggestionOptionsZoomCallbackImpl.api(api);
  }
}

final class ZoomSuggestionOptionsImpl extends ZoomSuggestionOptions {
  final ZoomSuggestionOptionsApi api;

  ZoomSuggestionOptionsImpl.internal(this.api) : super.impl();

  factory ZoomSuggestionOptionsImpl({
    required ZoomSuggestionOptionsZoomCallback zoomCallback,
    double? maxSupportedZoomRatio,
  }) {
    final api = ZoomSuggestionOptionsApi.build(
      zoomCallback: zoomCallback.api,
      maxSupportedZoomRatio: maxSupportedZoomRatio,
    );
    return ZoomSuggestionOptionsImpl.api(api);
  }
}

final class BarcodeScannerOptionsImpl extends BarcodeScannerOptions {
  final BarcodeScannerOptionsApi api;

  BarcodeScannerOptionsImpl.internal(this.api) : super.impl();

  factory BarcodeScannerOptionsImpl({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptions? zoomSuggestionOptions,
  }) {
    final api = BarcodeScannerOptionsApi.build(
      enableAllPotentialBarcodes: enableAllPotentialBarcodes,
      formats: formats?.map((e) => e.api).toList(),
      zoomSuggestionOptions: zoomSuggestionOptions?.api,
    );
    return BarcodeScannerOptionsImpl.api(api);
  }
}

final class BarcodeScannerImpl extends BarcodeScanner with DetectorMixin {
  @override
  final BarcodeScannerApi api;

  BarcodeScannerImpl.internal(this.api) : super.impl();

  factory BarcodeScannerImpl({BarcodeScannerOptions? options}) {
    final api = BarcodeScannerApi(options: options?.api);
    return BarcodeScannerImpl.api(api);
  }
}

extension ZoomSuggestionOptionsZoomCallbackX
    on ZoomSuggestionOptionsZoomCallback {
  ZoomSuggestionOptionsZoomCallbackApi get api {
    final impl = this;
    if (impl is! ZoomSuggestionOptionsZoomCallbackImpl) throw TypeError();
    return impl.api;
  }
}

extension ZoomSuggestionOptionsX on ZoomSuggestionOptions {
  ZoomSuggestionOptionsApi get api {
    final impl = this;
    if (impl is! ZoomSuggestionOptionsImpl) throw TypeError();
    return impl.api;
  }
}

extension BarcodeScannerOptionsX on BarcodeScannerOptions {
  BarcodeScannerOptionsApi get api {
    final impl = this;
    if (impl is! BarcodeScannerOptionsImpl) throw TypeError();
    return impl.api;
  }
}

extension BarcodeApiX on BarcodeApi {
  Barcode get impl => Barcode(
    format: format.impl,
    boundingBox: boundingBox?.impl,
    cornerPoints: cornerPoints?.map((e) => e.impl).toList(),
    rawBytes: rawBytes,
    rawValue: rawValue,
    displayValue: displayValue,
    valueType: valueType.impl,
    calendarEvent: calendarEvent?.impl,
    contactInfo: contactInfo?.impl,
    driverLicense: driverLicense?.impl,
    email: email?.impl,
    geoPoint: geoPoint?.impl,
    phone: phone?.impl,
    sms: sms?.impl,
    url: url?.impl,
    wifi: wifi?.impl,
  );
}

extension AddressApiX on AddressApi {
  Address get impl => Address(type: type.impl, addressLines: addressLines);
}

extension CalendarEventApiX on CalendarEventApi {
  CalendarEvent get impl => CalendarEvent(
    start: start?.impl,
    end: end?.impl,
    location: location,
    organizer: organizer,
    summary: summary,
    description: description,
    status: status,
  );
}

extension CalendarDateTimeApiX on CalendarDateTimeApi {
  DateTime get impl => isUtc
      ? DateTime.utc(year, month, day, hours, minutes, seconds)
      : DateTime(year, month, day, hours, minutes, seconds);
}

extension ContactInfoApiX on ContactInfoApi {
  ContactInfo get impl => ContactInfo(
    addresses: addresses.map((address) => address.impl).toList(),
    emails: emails.map((email) => email.impl).toList(),
    name: name?.impl,
    organization: organization,
    phones: phones.map((phone) => phone.impl).toList(),
    title: title,
    urls: urls,
  );
}

extension DriverLicenseApiX on DriverLicenseApi {
  DriverLicense get impl => DriverLicense(
    licenseNumber: licenseNumber,
    documentType: documentType,
    expiryDate: expiryDate,
    firstName: firstName,
    middleName: middleName,
    lastName: lastName,
    gender: gender,
    birthDate: birthDate,
    issueDate: issueDate,
    issuingCountry: issuingCountry,
    addressState: addressState,
    addressCity: addressCity,
    addressStreet: addressStreet,
    addressZip: addressZip,
  );
}

extension EmailApiX on EmailApi {
  Email get impl =>
      Email(type: type.impl, address: address, subject: subject, body: body);
}

extension GeoPointApiX on GeoPointApi {
  GeoPoint get impl => GeoPoint(lat, lng);
}

extension PersonNameApiX on PersonNameApi {
  PersonName get impl => PersonName(
    formattedName: formattedName,
    pronunciation: pronunciation,
    prefix: prefix,
    first: first,
    middle: middle,
    last: last,
    suffix: suffix,
  );
}

extension PhoneApiX on PhoneApi {
  Phone get impl => Phone(type: type.impl, number: number);
}

extension SmsApiX on SmsApi {
  Sms get impl => Sms(phoneNumber: phoneNumber, message: message);
}

extension UrlBookmarkApiX on UrlBookmarkApi {
  UrlBookmark get impl => UrlBookmark(title: title, url: url);
}

extension WiFiApiX on WiFiApi {
  WiFi get impl =>
      WiFi(encryptionType: encryptionType.impl, ssid: ssid, password: password);
}

extension BarcodeFormatX on BarcodeFormat {
  BarcodeFormatApi get api => BarcodeFormatApi.values[index];
}

extension BarcodeFormatApiX on BarcodeFormatApi {
  BarcodeFormat get impl => BarcodeFormat.values[index];
}

extension BarcodeValueTypeApiX on BarcodeValueTypeApi {
  BarcodeValueType get impl => BarcodeValueType.values[index];
}

extension AddressTypeApiX on AddressTypeApi {
  AddressType get impl => AddressType.values[index];
}

extension EmailTypeApiX on EmailTypeApi {
  EmailType get impl => EmailType.values[index];
}

extension PhoneTypeApiX on PhoneTypeApi {
  PhoneType get impl => PhoneType.values[index];
}

extension WiFiEncryptionTypeApiX on WiFiEncryptionTypeApi {
  WiFiEncryptionType get impl => WiFiEncryptionType.values[index];
}
