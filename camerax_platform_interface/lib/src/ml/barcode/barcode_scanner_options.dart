import 'package:camerax_platform_interface/src/camerax.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'barcode_format.dart';
import 'zoom_suggestion_options.dart';

abstract base class BarcodeScannerOptions extends PlatformInterface {
  static final _token = Object();

  BarcodeScannerOptions.impl() : super(token: _token);

  factory BarcodeScannerOptions({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptions? zoomSuggestionOptions,
  }) =>
      CameraX.instance.createBarcodeScannerOptions(
        enableAllPotentialBarcodes: enableAllPotentialBarcodes,
        formats: formats,
        zoomSuggestionOptions: zoomSuggestionOptions,
      );
}
