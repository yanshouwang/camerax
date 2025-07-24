import 'dart:typed_data';

import 'vn_barcode_composite_type.dart';
import 'vn_barcode_symbology.dart';
import 'vn_rectangle_observation.dart';

final class VNBarcodeObservation extends VNRectangleObservation {
  final String? payloadStringValue;
  final Uint8List? payloadData;
  final String? supplementalPayloadString;
  final Uint8List? supplementalPayloadData;
  final VNBarcodeCompositeType supplementalCompositeType;
  final bool isGS1DataCarrier;
  final VNBarcodeSymbology symbology;
  final bool isColorInverted;

  VNBarcodeObservation({
    required super.uuid,
    required super.confidence,
    required super.boundingBox,
    required super.bottomLeft,
    required super.bottomRight,
    required super.topLeft,
    required super.topRight,
    required this.payloadStringValue,
    required this.payloadData,
    required this.supplementalPayloadString,
    required this.supplementalPayloadData,
    required this.supplementalCompositeType,
    required this.isGS1DataCarrier,
    required this.symbology,
    required this.isColorInverted,
  }) : super.impl();
}
