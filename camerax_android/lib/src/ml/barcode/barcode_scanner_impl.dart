import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/ml/interfaces.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class BarcodeScannerImpl extends BarcodeScanner
    with AutoCloseableImpl, CloseableImpl, DetectorImpl {
  @override
  final BarcodeScannerApi api;

  BarcodeScannerImpl.internal(this.api) : super.impl();
}

extension BarcodeScannerX on BarcodeScanner {
  BarcodeScannerApi get api {
    final impl = this;
    if (impl is! BarcodeScannerImpl) throw TypeError();
    return impl.api;
  }
}
