import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_ios/src/ml/detector_impl.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'barcode_scanner_options_impl.dart';

final class BarcodeScannerImpl extends BarcodeScanner with DetectorImpl {
  @override
  final VNBarcodeScannerApi api;

  BarcodeScannerImpl.internal(this.api) : super.impl();

  factory BarcodeScannerImpl({
    BarcodeScannerOptions? options,
  }) {
    if (options is! BarcodeScannerOptionsImpl?) {
      throw TypeError();
    }
    final api = VNBarcodeScannerApi(
      symbologies: options?.symbologyApis,
    );
    return BarcodeScannerImpl.internal(api);
  }
}
