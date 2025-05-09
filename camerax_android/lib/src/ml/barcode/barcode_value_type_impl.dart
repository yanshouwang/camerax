import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension BarcodeValueTypeApiX on BarcodeValueTypeApi {
  BarcodeValueType get impl {
    switch (this) {
      case BarcodeValueTypeApi.unknown:
        return BarcodeValueType.unknown;
      case BarcodeValueTypeApi.contactInfo:
        return BarcodeValueType.contactInfo;
      case BarcodeValueTypeApi.email:
        return BarcodeValueType.email;
      case BarcodeValueTypeApi.isbn:
        return BarcodeValueType.isbn;
      case BarcodeValueTypeApi.phone:
        return BarcodeValueType.phone;
      case BarcodeValueTypeApi.product:
        return BarcodeValueType.product;
      case BarcodeValueTypeApi.sms:
        return BarcodeValueType.sms;
      case BarcodeValueTypeApi.text:
        return BarcodeValueType.text;
      case BarcodeValueTypeApi.url:
        return BarcodeValueType.url;
      case BarcodeValueTypeApi.wifi:
        return BarcodeValueType.wifi;
      case BarcodeValueTypeApi.geo:
        return BarcodeValueType.geo;
      case BarcodeValueTypeApi.calendarEvent:
        return BarcodeValueType.calendarEvent;
      case BarcodeValueTypeApi.driverLicense:
        return BarcodeValueType.driverLicense;
    }
  }
}
