import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'barcode_api.dart';
import 'zoom_suggestion_options_api.dart';

abstract base class BarcodeScannerOptionsApi {
  BarcodeScannerOptionsApi.impl();

  factory BarcodeScannerOptionsApi({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptionsApi? zoomSuggestionOptions,
  }) => CameraXPlugin.instance.$BarcodeScannerOptionsApi(
    enableAllPotentialBarcodes: enableAllPotentialBarcodes,
    formats: formats,
    zoomSuggestionOptions: zoomSuggestionOptions,
  );
}
