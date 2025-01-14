import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;
import 'package:meta/meta.dart';

import 'zoom_suggestion_options.dart';

final class BarcodeScannerOptions {
  final $base.BarcodeScannerOptions _obj;

  BarcodeScannerOptions({
    bool? enableAllPotentialBarcodes,
    List<$base.BarcodeFormat>? formats,
    ZoomSuggestionOptions? zoomSuggestionOptions,
  }) : _obj = $base.BarcodeScannerOptions(
          enableAllPotentialBarcodes: enableAllPotentialBarcodes,
          formats: formats,
          zoomSuggestionOptions: zoomSuggestionOptions?.obj,
        );

  @internal
  $base.BarcodeScannerOptions get obj => _obj;
}
