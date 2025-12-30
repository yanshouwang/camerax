import 'package:camerax_platform_interface/src/vision.dart';

enum VNBarcodeSymbology {
  aztec,
  codabar,
  code39,
  code39Checksum,
  code39FullASCII,
  code39FullASCIIChecksum,
  code93,
  code93i,
  code128,
  dataMatrix,
  ean8,
  ean13,
  gs1DataBar,
  gs1DataBarExpanded,
  gs1DataBarLimited,
  i2of5,
  i2of5Checksum,
  itf14,
  microPDF417,
  microQR,
  msiPlessey,
  pdf417,
  qr,
  upce,
}

abstract interface class VNBarcodeObservation
    implements VNRectangleObservation {
  String? get payloadStringValue;
  VNBarcodeSymbology get symbology;
}
