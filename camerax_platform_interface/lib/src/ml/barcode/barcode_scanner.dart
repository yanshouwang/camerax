import 'package:camerax_platform_interface/src/ml/interfaces.dart';

import 'barcode.dart';

abstract base class BarcodeScanner extends Detector<List<Barcode>> {
  BarcodeScanner.impl() : super.impl();
}
