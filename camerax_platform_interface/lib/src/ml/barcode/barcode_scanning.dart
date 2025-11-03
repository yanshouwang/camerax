import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'barcode_scanner.dart';
import 'barcode_scanner_options.dart';

abstract base class BarcodeScanning {
  static Future<BarcodeScanner> getClient([BarcodeScannerOptions? options]) =>
      CameraXPlugin.instance.$BarcodeScanningGetClient(options);

  BarcodeScanning.impl();
}
