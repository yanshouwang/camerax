import 'package:camerax_platform_interface/src/ml.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class BarcodeScannerOptions$Builder {
  factory BarcodeScannerOptions$Builder() =>
      BarcodeScannerOptionsChannel.instance.createBuilder();

  Future<BarcodeScannerOptions$Builder> enableAllPotentialBarcodes();
  Future<BarcodeScannerOptions$Builder> setBarcodeFormats(
    List<Barcode$Format> formats,
  );
  // Future<BarcodeScannerOptions$Builder> setExecutor(Executor executor);
  Future<BarcodeScannerOptions$Builder> setZoomSuggestionOptions(
    ZoomSuggestionOptions zoomSuggestionOptions,
  );
  Future<BarcodeScannerOptions> build();
}

abstract interface class BarcodeScannerOptions {}

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

  BarcodeScannerOptions$Builder createBuilder();
}
