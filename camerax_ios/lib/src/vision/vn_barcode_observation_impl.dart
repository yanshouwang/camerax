import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'vn_detected_object_observation_impl.dart';
import 'vn_observation_impl.dart';
import 'vn_rectangle_observation_impl.dart';

final class VNBarcodeObservationImpl extends VNBarcodeObservation
    with
        VNObservationImpl,
        VNDetectedObjectObservationImpl,
        VNRectangleObservationImpl {
  @override
  final VNBarcodeObservationProxyApi api;
  @override
  final double confidence;
  @override
  final Rect<double> boundingBox;
  @override
  final Point<double> bottomLeft;
  @override
  final Point<double> bottomRight;
  @override
  final Point<double> topLeft;
  @override
  final Point<double> topRight;
  @override
  final String? payloadStringValue;
  @override
  final VNBarcodeSymbology symbology;

  VNBarcodeObservationImpl.internal(
    this.api, {
    required this.confidence,
    required this.boundingBox,
    required this.bottomLeft,
    required this.bottomRight,
    required this.topLeft,
    required this.topRight,
    required this.payloadStringValue,
    required this.symbology,
  }) : super.impl();
}

extension VNBarcodeSymbologyX on VNBarcodeSymbology {
  VNBarcodeSymbologyApi get api => VNBarcodeSymbologyApi.values[index];

  VisionObjectType? get visionObjectTypeOrNull {
    switch (this) {
      case VNBarcodeSymbology.aztec:
        return VisionObjectType.aztec;
      case VNBarcodeSymbology.codabar:
        return VisionObjectType.codabar;
      case VNBarcodeSymbology.code39:
        return VisionObjectType.code39;
      // case VNBarcodeSymbology.code39Checksum:
      //   return VisionObjectType.code39Checksum;
      // case VNBarcodeSymbology.code39FullASCII:
      //   return VisionObjectType.code39FullASCII;
      // case VNBarcodeSymbology.code39FullASCIIChecksum:
      //   return VisionObjectType.code39FullASCIIChecksum;
      case VNBarcodeSymbology.code93:
        return VisionObjectType.code93;
      // case VNBarcodeSymbology.code93i:
      //   return VisionObjectType.code93i;
      case VNBarcodeSymbology.code128:
        return VisionObjectType.code128;
      case VNBarcodeSymbology.dataMatrix:
        return VisionObjectType.dataMatrix;
      case VNBarcodeSymbology.ean8:
        return VisionObjectType.ean8;
      case VNBarcodeSymbology.ean13:
        return VisionObjectType.ean13;
      // case VNBarcodeSymbology.gs1DataBar:
      //   return VisionObjectType.gs1DataBar;
      // case VNBarcodeSymbology.gs1DataBarExpanded:
      //   return VisionObjectType.gs1DataBarExpanded;
      // case VNBarcodeSymbology.gs1DataBarLimited:
      //   return VisionObjectType.gs1DataBarLimited;
      // case VNBarcodeSymbology.i2of5:
      //   return VisionObjectType.i2of5;
      // case VNBarcodeSymbology.i2of5Checksum:
      //   return VisionObjectType.i2of5Checksum;
      case VNBarcodeSymbology.itf14:
        return VisionObjectType.itf14;
      // case VNBarcodeSymbology.microPDF417:
      //   return VisionObjectType.microPDF417;
      // case VNBarcodeSymbology.microQR:
      //   return VisionObjectType.microQR;
      // case VNBarcodeSymbology.msiPlessey:
      //   return VisionObjectType.msiPlessey;
      case VNBarcodeSymbology.pdf417:
        return VisionObjectType.pdf417;
      case VNBarcodeSymbology.qr:
        return VisionObjectType.qr;
      case VNBarcodeSymbology.upce:
        return VisionObjectType.upce;
      default:
        return null;
    }
  }
}

extension VNBarcodeSymbologyApiX on VNBarcodeSymbologyApi {
  VNBarcodeSymbology get impl => VNBarcodeSymbology.values[index];
}

extension VNBarcodeObservationProxyApiX on VNBarcodeObservationProxyApi {
  Future<VNBarcodeObservation> impl() async {
    final api = this;
    final confidence = await api.getConfidence();
    final boundingBox = await api.getBoundingBox().then((e) => e.impl);
    final bottomLeft = await api.getBottomLeft().then((e) => e.impl);
    final bottomRight = await api.getBottomRight().then((e) => e.impl);
    final topLeft = await api.getTopLeft().then((e) => e.impl);
    final topRight = await api.getTopRight().then((e) => e.impl);
    final payloadStringValue = await api.getPayloadStringValue();
    final symbology = await api.getSymbology().then((e) => e.impl);
    return VNBarcodeObservationImpl.internal(
      api,
      confidence: confidence,
      boundingBox: boundingBox,
      bottomLeft: bottomLeft,
      bottomRight: bottomRight,
      topLeft: topLeft,
      topRight: topRight,
      payloadStringValue: payloadStringValue,
      symbology: symbology,
    );
  }
}
