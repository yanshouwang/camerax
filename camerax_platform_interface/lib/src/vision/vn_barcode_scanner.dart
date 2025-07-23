import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'vn_barcode_symbology.dart';
import 'vn_detector.dart';

abstract base class VNBarcodeScanner extends VNDetector {
  VNBarcodeScanner.impl() : super.impl();

  factory VNBarcodeScanner({
    List<VNBarcodeSymbology>? symbologies,
  }) => CameraXPlugin.instance.newVNBarcodeScanner(
    symbologies: symbologies,
  );
}
