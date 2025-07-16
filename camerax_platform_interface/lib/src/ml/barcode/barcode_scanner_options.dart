import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'barcode_format.dart';
import 'zoom_suggestion_options.dart';

abstract base class BarcodeScannerOptions {
  BarcodeScannerOptions.impl();

  factory BarcodeScannerOptions({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptions? zoomSuggestionOptions,
  }) =>
      CameraXPlugin.instance.newBarcodeScannerOptions(
        enableAllPotentialBarcodes: enableAllPotentialBarcodes,
        formats: formats,
        zoomSuggestionOptions: zoomSuggestionOptions,
      );
}
