import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/ml/detector.dart';

import 'barcode.dart';
import 'barcode_scanner_options.dart';

abstract base class BarcodeScanner extends Detector<List<Barcode>> {
  BarcodeScanner.impl() : super.impl();

  factory BarcodeScanner({
    BarcodeScannerOptions? options,
  }) =>
      CameraXPlugin.instance.newBarcodeScanner(
        options: options,
      );
}
