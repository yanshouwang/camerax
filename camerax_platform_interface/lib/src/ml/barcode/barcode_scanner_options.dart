import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'barcode_format.dart';
import 'zoom_suggestion_options.dart';

final _token = Object();

abstract interface class BarcodeScannerOptions {
  factory BarcodeScannerOptions({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptions? zoomSuggestionOptions,
  }) {
    final instance = CameraXPlugin.instance.newBarcodeScannerOptions(
      enableAllPotentialBarcodes: enableAllPotentialBarcodes,
      formats: formats,
      zoomSuggestionOptions: zoomSuggestionOptions,
    );
    PlatformInterface.verify(instance as PlatformInterface, _token);
    return instance;
  }
}

abstract base class BarcodeScannerOptionsChannel extends PlatformInterface
    implements BarcodeScannerOptions {
  BarcodeScannerOptionsChannel.impl() : super(token: _token);
}
