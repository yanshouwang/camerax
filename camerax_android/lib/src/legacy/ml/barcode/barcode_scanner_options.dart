import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'barcode_format.dart';
import 'zoom_suggestion_options.dart';

final class BarcodeScannerOptions extends $base.BarcodeScannerOptions {
  final $native.BarcodeScannerOptions obj;

  BarcodeScannerOptions.$native(this.obj) : super.impl();

  factory BarcodeScannerOptions({
    bool? enableAllPotentialBarcodes,
    List<$base.BarcodeFormat>? formats,
    $base.ZoomSuggestionOptions? zoomSuggestionOptions,
  }) {
    if (zoomSuggestionOptions is! ZoomSuggestionOptions) {
      throw TypeError();
    }
    final obj = $native.BarcodeScannerOptions.build(
      enableAllPotentialBarcodes: enableAllPotentialBarcodes,
      formats: formats?.map((format) => format.obj).toList(),
      zoomSuggestionOptions: zoomSuggestionOptions.obj,
    );
    return BarcodeScannerOptions.$native(obj);
  }
}
