import 'dart:typed_data';

import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'vn_barcode_composite_type_impl.dart';
import 'vn_barcode_symbology_impl.dart';
import 'vn_detected_object_observation_impl.dart';
import 'vn_observation_impl.dart';
import 'vn_rectangle_observation_impl.dart';

final class VNBarcodeObservationImpl extends VNBarcodeObservation
    with
        VNObservationMixin,
        VNDetectedObjectObservationMixin,
        VNRectangleObservationMixin,
        VNBarcodeObservationMixin {
  @override
  final VNBarcodeObservationApi api;

  VNBarcodeObservationImpl.internal(this.api) : super.impl();
}

base mixin VNBarcodeObservationMixin on VNBarcodeObservation {
  VNBarcodeObservationApi get api;

  @override
  Future<String?> getPayloadStringValue() => api.getPayloadStringValue();
  @override
  Future<Uint8List?> getPayloadData() => api.getPayloadData();
  @override
  Future<String?> getSupplementalPayloadString() =>
      api.getSupplementalPayloadString();
  @override
  Future<Uint8List?> getSupplementalPayloadData() =>
      api.getSupplementalPayloadData();
  @override
  Future<VNBarcodeCompositeType> getSupplementalCompositeType() =>
      api.getSupplementalCompositeType().then((e) => e.impl);
  @override
  Future<bool> isGS1DataCarrier() => api.isGS1DataCarrier();
  @override
  Future<VNBarcodeSymbology> getSymbology() =>
      api.getSymbology().then((e) => e.impl);
  @override
  Future<bool> isColorInverted() => api.isColorInverted();
}

extension VNBarcodeObservationApiX on VNBarcodeObservationApi {
  VNBarcodeObservation get impl => VNBarcodeObservationImpl.internal(this);
}
