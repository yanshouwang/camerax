import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension BarcodeValueTypeObj on $native.BarcodeValueType {
  $interface.BarcodeValueType get args {
    switch (this) {
      case $native.BarcodeValueType.unknown:
        return $interface.BarcodeValueType.unknown;
      case $native.BarcodeValueType.contactInfo:
        return $interface.BarcodeValueType.contactInfo;
      case $native.BarcodeValueType.email:
        return $interface.BarcodeValueType.email;
      case $native.BarcodeValueType.isbn:
        return $interface.BarcodeValueType.isbn;
      case $native.BarcodeValueType.phone:
        return $interface.BarcodeValueType.phone;
      case $native.BarcodeValueType.product:
        return $interface.BarcodeValueType.product;
      case $native.BarcodeValueType.sms:
        return $interface.BarcodeValueType.sms;
      case $native.BarcodeValueType.text:
        return $interface.BarcodeValueType.text;
      case $native.BarcodeValueType.url:
        return $interface.BarcodeValueType.url;
      case $native.BarcodeValueType.wifi:
        return $interface.BarcodeValueType.wifi;
      case $native.BarcodeValueType.geo:
        return $interface.BarcodeValueType.geo;
      case $native.BarcodeValueType.calendarEvent:
        return $interface.BarcodeValueType.calendarEvent;
      case $native.BarcodeValueType.driverLicense:
        return $interface.BarcodeValueType.driverLicense;
    }
  }
}
