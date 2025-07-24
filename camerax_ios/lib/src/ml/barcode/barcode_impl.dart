import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'barcode_format_impl.dart';

extension VNBarcodeObservationApiX on VNBarcodeObservationApi {
  Barcode implOfSize(SizeApi sizeApi) {
    return Barcode(
      format: symbology.impl,
      boundingBox: boundingBox.implOfSize(sizeApi),
      cornerPoints: [
        topLeft.implOfSize(sizeApi),
        topRight.implOfSize(sizeApi),
        bottomRight.implOfSize(sizeApi),
        bottomLeft.implOfSize(sizeApi),
      ],
      rawBytes: payloadData,
      rawValue: payloadStringValue,
      displayValue: payloadStringValue,
      valueType: BarcodeValueType.unknown,
      calendarEvent: null,
      contactInfo: null,
      driverLicense: null,
      email: null,
      geoPoint: null,
      phone: null,
      sms: null,
      url: null,
      wifi: null,
    );
  }
}

extension on PointFApi {
  Point<int> implOfSize(SizeApi sizeApi) {
    final x = (this.x * sizeApi.width).round();
    final y = (this.y * sizeApi.height).round();
    return Point(x, y);
  }
}

extension on RectFApi {
  Rect<int> implOfSize(SizeApi sizeApi) {
    final left = (this.left * sizeApi.width).round();
    final top = (this.top * sizeApi.height).round();
    final right = (this.right * sizeApi.width).round();
    final bottom = (this.bottom * sizeApi.height).round();
    return Rect(left, top, right, bottom);
  }
}
