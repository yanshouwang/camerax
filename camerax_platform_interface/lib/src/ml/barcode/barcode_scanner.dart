import 'package:camerax_platform_interface/src/ml/interfaces.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'barcode.dart';
import 'barcode_scanner_options.dart';

abstract interface class BarcodeScanner implements Detector<List<Barcode>> {
  factory BarcodeScanner() => BarcodeScannerChannel.instance.create();

  factory BarcodeScanner.options(BarcodeScannerOptions options) =>
      BarcodeScannerChannel.instance.createWithOptions(options);
}

abstract base class BarcodeScannerChannel extends PlatformInterface {
  BarcodeScannerChannel() : super(token: _token);

  static final _token = Object();

  static BarcodeScannerChannel? _instance;

  static BarcodeScannerChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(BarcodeScannerChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  BarcodeScanner create();

  BarcodeScanner createWithOptions(BarcodeScannerOptions options);
}
