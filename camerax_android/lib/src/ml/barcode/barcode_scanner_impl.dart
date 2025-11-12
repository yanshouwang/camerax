import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/ml/interfaces.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'barcode_scanner_options_impl.dart';

final class BarcodeScannerImpl extends BarcodeScanner
    with AutoCloseableImpl, CloseableImpl, DetectorImpl {
  @override
  final BarcodeScannerProxyApi api;

  BarcodeScannerImpl.internal(this.api) : super.impl();

  factory BarcodeScannerImpl() {
    final api = BarcodeScannerProxyApi();
    return BarcodeScannerImpl.internal(api);
  }

  factory BarcodeScannerImpl.options(BarcodeScannerOptions options) {
    final api = BarcodeScannerProxyApi.options(options: options.api);
    return BarcodeScannerImpl.internal(api);
  }
}

extension BarcodeScannerX on BarcodeScanner {
  BarcodeScannerProxyApi get api {
    final impl = this;
    if (impl is! BarcodeScannerImpl) throw TypeError();
    return impl.api;
  }
}
