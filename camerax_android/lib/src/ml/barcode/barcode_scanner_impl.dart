import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/ml.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class BarcodeScannerImpl extends DetectorImpl<List<Barcode>>
    implements BarcodeScanner {
  @override
  final BarcodeScannerProxyApi api;

  BarcodeScannerImpl.internal(this.api);

  @override
  Future<List<Barcode>> process(InputImage image) =>
      api.process(image.api).then((e) => e.map((e1) => e1.impl).toList());
}

final class BarcodeScannerChannelImpl extends BarcodeScannerChannel {
  @override
  BarcodeScanner create() {
    final api = BarcodeScannerProxyApi();
    return BarcodeScannerImpl.internal(api);
  }

  @override
  BarcodeScanner createWithOptions(BarcodeScannerOptions options) {
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
