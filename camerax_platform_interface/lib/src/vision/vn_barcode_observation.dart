import 'dart:typed_data';

import 'vn_barcode_composite_type.dart';
import 'vn_barcode_symbology.dart';
import 'vn_rectangle_observation.dart';

abstract base class VNBarcodeObservation extends VNRectangleObservation {
  Future<String?> getPayloadStringValue();
  Future<Uint8List?> getPayloadData();
  Future<String?> getSupplementalPayloadString();
  Future<Uint8List?> getSupplementalPayloadData();
  Future<VNBarcodeCompositeType> getSupplementalCompositeType();
  Future<bool> isGS1DataCarrier();
  Future<VNBarcodeSymbology> getSymbology();
  Future<bool> isColorInverted();

  VNBarcodeObservation.impl() : super.impl();
}
