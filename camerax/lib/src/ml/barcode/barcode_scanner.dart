import 'package:camerax/src/ml/detector.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;
import 'package:meta/meta.dart';

import 'barcode_scanner_options.dart';

final class BarcodeScanner extends Detector<List<$interface.Barcode>> {
  final $interface.BarcodeScanner _obj;

  BarcodeScanner({
    BarcodeScannerOptions? options,
  }) : _obj = $interface.BarcodeScanner(
          options: options?.obj,
        );

  @internal
  @override
  $interface.BarcodeScanner get obj => _obj;
}
