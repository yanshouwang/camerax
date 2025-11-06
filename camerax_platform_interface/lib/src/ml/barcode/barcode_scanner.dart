import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/ml/interfaces.dart';

import 'barcode.dart';
import 'barcode_scanner_options.dart';

abstract base class BarcodeScanner extends Detector<List<Barcode>> {
  BarcodeScanner.impl() : super.impl();

  factory BarcodeScanner() => CameraXPlugin.instance.$BarcodeScanner();

  factory BarcodeScanner.options(BarcodeScannerOptions options) =>
      CameraXPlugin.instance.$BarcodeScanner$Options(options);
}
