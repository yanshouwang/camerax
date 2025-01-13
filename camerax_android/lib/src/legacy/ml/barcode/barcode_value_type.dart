import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension BarcodeValueTypeObj on $native.BarcodeValueType {
  $base.BarcodeValueType get args {
    switch (this) {
      case $native.BarcodeValueType.unknown:
        return $base.BarcodeValueType.unknown;
      case $native.BarcodeValueType.contactInfo:
        return $base.BarcodeValueType.contactInfo;
      case $native.BarcodeValueType.email:
        return $base.BarcodeValueType.email;
      case $native.BarcodeValueType.isbn:
        return $base.BarcodeValueType.isbn;
      case $native.BarcodeValueType.phone:
        return $base.BarcodeValueType.phone;
      case $native.BarcodeValueType.product:
        return $base.BarcodeValueType.product;
      case $native.BarcodeValueType.sms:
        return $base.BarcodeValueType.sms;
      case $native.BarcodeValueType.text:
        return $base.BarcodeValueType.text;
      case $native.BarcodeValueType.url:
        return $base.BarcodeValueType.url;
      case $native.BarcodeValueType.wifi:
        return $base.BarcodeValueType.wifi;
      case $native.BarcodeValueType.geo:
        return $base.BarcodeValueType.geo;
      case $native.BarcodeValueType.calendarEvent:
        return $base.BarcodeValueType.calendarEvent;
      case $native.BarcodeValueType.driverLicense:
        return $base.BarcodeValueType.driverLicense;
    }
  }
}
