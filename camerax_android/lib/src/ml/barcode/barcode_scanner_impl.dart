import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/ml/detector_impl.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'barcode_scanner_options_impl.dart';

final class BarcodeScannerImpl extends BarcodeScanner with DetectorImpl {
  @override
  final BarcodeScannerApi api;

  BarcodeScannerImpl.internal(this.api) : super.impl();

  factory BarcodeScannerImpl({
    BarcodeScannerOptions? options,
  }) {
    if (options is! BarcodeScannerOptionsImpl?) {
      throw TypeError();
    }
    final api = BarcodeScannerApi(
      options: options?.api,
    );
    return BarcodeScannerImpl.internal(api);
  }
}
