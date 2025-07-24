import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'barcode_format_impl.dart';

final class BarcodeScannerOptionsImpl extends BarcodeScannerOptions {
  final List<VNBarcodeSymbologyApi>? symbologyApis;

  BarcodeScannerOptionsImpl.internal(this.symbologyApis) : super.impl();

  factory BarcodeScannerOptionsImpl({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptions? zoomSuggestionOptions,
  }) {
    final symbologyApis =
        formats?.map((e) => e.api).expand((e) => e).toSet().toList();
    return BarcodeScannerOptionsImpl.internal(symbologyApis);
  }
}
