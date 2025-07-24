import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'vn_barcode_symbology_impl.dart';

extension VNBarcodeObservationApiX on BarcodeApi {
  VNBarcodeObservation? implOfSize(SizeApi sizeApi) {
    final boundingBox = this.boundingBox;
    final cornerPoints = this.cornerPoints;
    final format = this.format;
    final symbology = format.impl;
    if (boundingBox == null ||
        cornerPoints == null ||
        cornerPoints.length != 4 ||
        symbology == null) {
      return null;
    }
    return VNBarcodeObservation(
      uuid: '',
      confidence: 1.0,
      boundingBox: boundingBox.implOfSize(sizeApi),
      bottomLeft: cornerPoints[0].implOfSize(sizeApi),
      bottomRight: cornerPoints[1].implOfSize(sizeApi),
      topLeft: cornerPoints[2].implOfSize(sizeApi),
      topRight: cornerPoints[3].implOfSize(sizeApi),
      payloadStringValue: rawValue,
      payloadData: rawBytes,
      supplementalPayloadString: null,
      supplementalPayloadData: null,
      supplementalCompositeType: VNBarcodeCompositeType.none,
      isGS1DataCarrier: false,
      symbology: symbology,
      isColorInverted: false,
    );
  }
}

extension on PointApi {
  Point<double> implOfSize(SizeApi sizeApi) {
    final x = this.x / sizeApi.width;
    final y = this.y / sizeApi.height;
    return Point(x, y);
  }
}

extension on RectApi {
  Rect<double> implOfSize(SizeApi sizeApi) {
    final left = this.left / sizeApi.width;
    final top = this.top / sizeApi.height;
    final right = this.right / sizeApi.width;
    final bottom = this.bottom / sizeApi.height;
    return Rect(left, top, right, bottom);
  }
}
