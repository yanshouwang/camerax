import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'detector_impl.dart';

final class BarcodeScannerImpl extends BarcodeScanner with DetectorImpl {
  @override
  final BarcodeScannerApi api;

  BarcodeScannerImpl.internal(this.api) : super.impl();

  factory BarcodeScannerImpl({BarcodeScannerOptions? options}) {
    if (options is! BarcodeScannerOptionsImpl?) {
      throw TypeError();
    }
    final api = BarcodeScannerApi(options: options?.api);
    return BarcodeScannerImpl.internal(api);
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
    if (zoomSuggestionOptions is! ZoomSuggestionOptionsImpl) {
      throw TypeError();
    }
    final api = BarcodeScannerOptionsApi.build(
      enableAllPotentialBarcodes: enableAllPotentialBarcodes,
      formats: formats?.map((e) => e.api).toList(),
      zoomSuggestionOptions: zoomSuggestionOptions.api,
    );
    return BarcodeScannerOptionsImpl.internal(api);
  }
}

final class ZoomSuggestionOptionsImpl extends ZoomSuggestionOptions {
  final ZoomSuggestionOptionsApi api;

  ZoomSuggestionOptionsImpl.internal(this.api) : super.impl();

  factory ZoomSuggestionOptionsImpl({
    required ZoomCallback zoomCallback,
    double? maxSupportedZoomRatio,
  }) {
    final api = ZoomSuggestionOptionsApi.build(
      zoomCallback: ZoomCallbackApi(
        setZoom: (_, zoomRatio) => zoomCallback(zoomRatio),
      ),
      maxSupportedZoomRatio: maxSupportedZoomRatio,
    );
    return ZoomSuggestionOptionsImpl.internal(api);
  }
}

extension BarcodeApiX on BarcodeApi {
  Barcode get impl {
    return Barcode(
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
}

extension AddressApiX on AddressApi {
  Address get impl {
    return Address(type: type.impl, addressLines: addressLines);
  }
}

extension CalendarEventApiX on CalendarEventApi {
  CalendarEvent get impl {
    return CalendarEvent(
      start: start?.impl,
      end: end?.impl,
      location: location,
      organizer: organizer,
      summary: summary,
      description: description,
      status: status,
    );
  }
}

extension CalendarDateTimeApiX on CalendarDateTimeApi {
  DateTime get impl {
    return isUtc
        ? DateTime.utc(year, month, day, hours, minutes, seconds)
        : DateTime(year, month, day, hours, minutes, seconds);
  }
}

extension ContactInfoApiX on ContactInfoApi {
  ContactInfo get impl {
    return ContactInfo(
      addresses: addresses.map((address) => address.impl).toList(),
      emails: emails.map((email) => email.impl).toList(),
      name: name?.impl,
      organization: organization,
      phones: phones.map((phone) => phone.impl).toList(),
      title: title,
      urls: urls,
    );
  }
}

extension DriverLicenseApiX on DriverLicenseApi {
  DriverLicense get impl {
    return DriverLicense(
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
}

extension EmailApiX on EmailApi {
  Email get impl {
    return Email(
      type: type.impl,
      address: address,
      subject: subject,
      body: body,
    );
  }
}

extension GeoPointApiX on GeoPointApi {
  GeoPoint get impl {
    return GeoPoint(lat, lng);
  }
}

extension PersonNameApiX on PersonNameApi {
  PersonName get impl {
    return PersonName(
      formattedName: formattedName,
      pronunciation: pronunciation,
      prefix: prefix,
      first: first,
      middle: middle,
      last: last,
      suffix: suffix,
    );
  }
}

extension PhoneApiX on PhoneApi {
  Phone get impl {
    return Phone(type: type.impl, number: number);
  }
}

extension SmsApiX on SmsApi {
  Sms get impl {
    return Sms(phoneNumber: phoneNumber, message: message);
  }
}

extension UrlBookmarkApiX on UrlBookmarkApi {
  UrlBookmark get impl {
    return UrlBookmark(title: title, url: url);
  }
}

extension WiFiApiX on WiFiApi {
  WiFi get impl {
    return WiFi(
      encryptionType: encryptionType.impl,
      ssid: ssid,
      password: password,
    );
  }
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
