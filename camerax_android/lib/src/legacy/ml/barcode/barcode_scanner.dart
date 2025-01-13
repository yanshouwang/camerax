import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/ml/detector.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'barcode_scanner_options.dart';

final class BarcodeScanner extends $base.BarcodeScanner with Detector {
  @override
  final $native.BarcodeScanner obj;

  BarcodeScanner.$native(this.obj) : super.impl();

  factory BarcodeScanner({
    $base.BarcodeScannerOptions? options,
  }) {
    if (options is! BarcodeScannerOptions?) {
      throw TypeError();
    }
    final obj = $native.BarcodeScanner(
      options: options?.obj,
    );
    return BarcodeScanner.$native(obj);
  }
}
