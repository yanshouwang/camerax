import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/ml/detector.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'barcode.dart';
import 'barcode_scanner_options.dart';

final _token = Object();

abstract interface class BarcodeScanner implements Detector<List<Barcode>> {
  factory BarcodeScanner({
    BarcodeScannerOptions? options,
  }) {
    final instance = CameraXPlugin.instance.newBarcodeScanner(
      options: options,
    );
    PlatformInterface.verify(instance as PlatformInterface, _token);
    return instance;
  }
}

abstract base class BarcodeScannerChannel extends PlatformInterface
    implements BarcodeScanner {
  BarcodeScannerChannel.impl() : super(token: _token);
}
