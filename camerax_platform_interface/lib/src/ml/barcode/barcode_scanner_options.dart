import 'package:camerax_platform_interface/src/ml.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class BarcodeScannerOptions {
  factory BarcodeScannerOptions({
    bool? enableAllPotentialBarcodes,
    List<Barcode$Format>? formats,
    ZoomSuggestionOptions? zoomSuggestionOptions,
  }) => BarcodeScannerOptionsChannel.instance.create(
    enableAllPotentialBarcodes: enableAllPotentialBarcodes,
    formats: formats,
    zoomSuggestionOptions: zoomSuggestionOptions,
  );
}

abstract base class BarcodeScannerOptionsChannel extends PlatformInterface {
  BarcodeScannerOptionsChannel() : super(token: _token);

  static final _token = Object();

  static BarcodeScannerOptionsChannel? _instance;

  static BarcodeScannerOptionsChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(BarcodeScannerOptionsChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  BarcodeScannerOptions create({
    bool? enableAllPotentialBarcodes,
    List<Barcode$Format>? formats,
    ZoomSuggestionOptions? zoomSuggestionOptions,
  });
}
