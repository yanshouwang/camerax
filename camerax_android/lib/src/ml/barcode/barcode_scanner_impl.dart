import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class BarcodeScannerImpl extends BarcodeScannerApi
    with AutoCloseableImpl, CloseableImpl {
  @override
  final BarcodeScannerProxyApi api;

  BarcodeScannerImpl.internal(this.api) : super.impl();
}

extension BarcodeScannerX on BarcodeScannerApi {
  BarcodeScannerProxyApi get api {
    final impl = this;
    if (impl is! BarcodeScannerImpl) throw TypeError();
    return impl.api;
  }
}
