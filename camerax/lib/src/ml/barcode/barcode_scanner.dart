import 'package:camerax/src/ml/detector.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;
import 'package:meta/meta.dart';

import 'barcode_scanner_options.dart';

final class BarcodeScanner extends Detector<List<$base.Barcode>> {
  final $base.BarcodeScanner _obj;

  BarcodeScanner({
    BarcodeScannerOptions? options,
  }) : _obj = $base.BarcodeScanner(
          options: options?.obj,
        );

  @internal
  @override
  $base.BarcodeScanner get obj => _obj;
}
