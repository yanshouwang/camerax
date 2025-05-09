import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'barcode_format_impl.dart';
import 'barcode_value_type_impl.dart';
import 'calendar_event_impl.dart';
import 'contact_info_impl.dart';
import 'driver_license_impl.dart';
import 'email_impl.dart';
import 'geo_point_impl.dart';
import 'phone_impl.dart';
import 'sms_impl.dart';
import 'url_bookmark_impl.dart';
import 'wifi_impl.dart';

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
