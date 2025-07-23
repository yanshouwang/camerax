import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'vn_barcode_symbology_impl.dart';
import 'vn_detector_impl.dart';

final class VNBarcodeScannerImpl extends VNBarcodeScanner with VNDetectorImpl {
  @override
  final VNBarcodeScannerApi api;

  VNBarcodeScannerImpl.internal(this.api) : super.impl();

  factory VNBarcodeScannerImpl({
    List<VNBarcodeSymbology>? symbologies,
  }) {
    final api = VNBarcodeScannerApi(
      symbologies: symbologies?.map((e) => e.api).toList(),
    );
    return VNBarcodeScannerImpl.internal(api);
  }
}
