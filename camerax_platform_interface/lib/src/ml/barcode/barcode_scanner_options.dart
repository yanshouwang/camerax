import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'barcode.dart';
import 'zoom_suggestion_options.dart';

abstract base class BarcodeScannerOptions {
  BarcodeScannerOptions.impl();

  factory BarcodeScannerOptions({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptions? zoomSuggestionOptions,
  }) => CameraXPlugin.instance.$BarcodeScannerOptions(
    enableAllPotentialBarcodes: enableAllPotentialBarcodes,
    formats: formats,
    zoomSuggestionOptions: zoomSuggestionOptions,
  );
}
