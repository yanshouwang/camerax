import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'barcode_scanner_options_impl.dart';

final class BarcodeScannerImpl extends BarcodeScannerApi
    with AutoCloseableImpl, CloseableImpl {
  @override
  final BarcodeScannerProxyApi api;

  BarcodeScannerImpl.internal(this.api) : super.impl();

  factory BarcodeScannerImpl() {
    final api = BarcodeScannerProxyApi();
    return BarcodeScannerImpl.internal(api);
  }

  factory BarcodeScannerImpl.options(BarcodeScannerOptionsApi options) {
    final api = BarcodeScannerProxyApi.options(options: options.api);
    return BarcodeScannerImpl.internal(api);
  }
}

extension BarcodeScannerApiX on BarcodeScannerApi {
  BarcodeScannerProxyApi get api {
    final impl = this;
    if (impl is! BarcodeScannerImpl) throw TypeError();
    return impl.api;
  }
}
