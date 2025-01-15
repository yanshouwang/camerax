import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;
import 'package:meta/meta.dart';

import 'zoom_suggestion_options.dart';

final class BarcodeScannerOptions {
  final $interface.BarcodeScannerOptions _obj;

  BarcodeScannerOptions({
    bool? enableAllPotentialBarcodes,
    List<$interface.BarcodeFormat>? formats,
    ZoomSuggestionOptions? zoomSuggestionOptions,
  }) : _obj = $interface.BarcodeScannerOptions(
          enableAllPotentialBarcodes: enableAllPotentialBarcodes,
          formats: formats,
          zoomSuggestionOptions: zoomSuggestionOptions?.obj,
        );

  @internal
  $interface.BarcodeScannerOptions get obj => _obj;
}
