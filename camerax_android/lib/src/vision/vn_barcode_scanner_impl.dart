import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'vn_barcode_symbology_impl.dart';
import 'vn_detector_impl.dart';

final class VNBarcodeScannerImpl extends VNBarcodeScanner with VNDetectorImpl {
  @override
  final BarcodeScannerApi api;

  VNBarcodeScannerImpl.internal(this.api) : super.impl();

  factory VNBarcodeScannerImpl({List<VNBarcodeSymbology>? symbologies}) {
    final api = BarcodeScannerApi(
      options: BarcodeScannerOptionsApi.build(
        formats:
            symbologies
                ?.map((e) => e.api)
                .where((e) => e != BarcodeFormatApi.unknown)
                .toSet()
                .toList(),
      ),
    );
    return VNBarcodeScannerImpl.internal(api);
  }
}
