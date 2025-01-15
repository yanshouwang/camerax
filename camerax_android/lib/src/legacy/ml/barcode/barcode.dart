import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

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

extension BarcodeObj on $native.Barcode {
  $interface.Barcode get args {
    return $interface.Barcode(
      format: format.args,
      boundingBox: boundingBox?.args,
      cornerPoints: cornerPoints?.map((obj) => obj.args).toList(),
      rawBytes: rawBytes,
      rawValue: rawValue,
      displayValue: displayValue,
      valueType: valueType.args,
      calendarEvent: calendarEvent?.args,
      contactInfo: contactInfo?.args,
      driverLicense: driverLicense?.args,
      email: email?.args,
      geoPoint: geoPoint?.args,
      phone: phone?.args,
      sms: sms?.args,
      url: url?.args,
      wifi: wifi?.args,
    );
  }
}
