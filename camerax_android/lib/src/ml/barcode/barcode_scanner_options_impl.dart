import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'barcode_format_impl.dart';
import 'zoom_suggestion_options_impl.dart';

final class BarcodeScannerOptionsImpl extends BarcodeScannerOptions {
  final BarcodeScannerOptionsApi api;

  BarcodeScannerOptionsImpl.internal(this.api) : super.impl();

  factory BarcodeScannerOptionsImpl({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptions? zoomSuggestionOptions,
  }) {
    if (zoomSuggestionOptions is! ZoomSuggestionOptionsImpl) {
      throw TypeError();
    }
    final api = BarcodeScannerOptionsApi.build(
      enableAllPotentialBarcodes: enableAllPotentialBarcodes,
      formats: formats?.map((e) => e.api).toList(),
      zoomSuggestionOptions: zoomSuggestionOptions.api,
    );
    return BarcodeScannerOptionsImpl.internal(api);
  }
}
