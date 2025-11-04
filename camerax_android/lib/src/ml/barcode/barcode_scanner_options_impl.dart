import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'barcode_impl.dart';
import 'zoom_suggestion_options_impl.dart';

final class BarcodeScannerOptionsImpl extends BarcodeScannerOptionsApi {
  final BarcodeScannerOptionsApi api;

  BarcodeScannerOptionsImpl.internal(this.api) : super.impl();

  factory BarcodeScannerOptionsImpl({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptionsApi? zoomSuggestionOptions,
  }) {
    final api = BarcodeScannerOptionsApi.build(
      enableAllPotentialBarcodes: enableAllPotentialBarcodes,
      formats: formats?.map((e) => e.api).toList(),
      zoomSuggestionOptions: zoomSuggestionOptions?.api,
    );
    return BarcodeScannerOptionsImpl.internal(api);
  }
}

extension BarcodeScannerOptionsX on BarcodeScannerOptionsApi {
  BarcodeScannerOptionsApi get api {
    final impl = this;
    if (impl is! BarcodeScannerOptionsImpl) throw TypeError();
    return impl.api;
  }
}
