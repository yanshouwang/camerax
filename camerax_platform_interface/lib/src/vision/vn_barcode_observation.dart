import 'vn_rectangle_observation.dart';

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

abstract base class VNBarcodeObservation extends VNRectangleObservation {
  VNBarcodeObservation.impl() : super.impl();

  String? get payloadStringValue;
  VNBarcodeSymbology get symbology;
}
