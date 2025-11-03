import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'barcode_scanner_impl.dart';
import 'barcode_scanner_options_impl.dart';

final class BarcodeScanningImpl extends BarcodeScanning {
  static Future<BarcodeScanner> getClient([
    BarcodeScannerOptions? options,
  ]) async {
    final api = options == null
        ? await BarcodeScanningApi.getClient1()
        : await BarcodeScanningApi.getClient2(options.api);
    return BarcodeScannerImpl.internal(api);
  }

  final BarcodeScanningApi api;

  BarcodeScanningImpl.internal(this.api) : super.impl();
}
