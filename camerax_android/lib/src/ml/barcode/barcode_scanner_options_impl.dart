import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/ml.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class BarcodeScannerOptions$BuilderImpl
    implements BarcodeScannerOptions$Builder {
  final BarcodeScannerOptionsBuilderProxyApi api;

  BarcodeScannerOptions$BuilderImpl.internal(this.api);

  @override
  Future<BarcodeScannerOptions$Builder> enableAllPotentialBarcodes() =>
      api.enableAllPotentialBarcodes().then((e) => e.impl);

  @override
  Future<BarcodeScannerOptions$Builder> setBarcodeFormats(
    List<Barcode$Format> formats,
  ) => api
      .setBarcodeFormats(formats.map((e) => e.api).toList())
      .then((e) => e.impl);

  @override
  Future<BarcodeScannerOptions$Builder> setZoomSuggestionOptions(
    ZoomSuggestionOptions zoomSuggestionOptions,
  ) => api
      .setZoomSuggestionOptions(zoomSuggestionOptions.api)
      .then((e) => e.impl);

  @override
  Future<BarcodeScannerOptions> build() => api.build().then((e) => e.impl);
}

final class BarcodeScannerOptionsImpl implements BarcodeScannerOptions {
  final BarcodeScannerOptionsProxyApi api;

  BarcodeScannerOptionsImpl.internal(this.api);
}

final class BarcodeScannerOptionsChannelImpl
    extends BarcodeScannerOptionsChannel {
  @override
  BarcodeScannerOptions$Builder createBuilder() {
    final api = BarcodeScannerOptionsBuilderProxyApi();
    return BarcodeScannerOptions$BuilderImpl.internal(api);
  }
}

extension BarcodeScannerOptionsBuilderProxyApiX
    on BarcodeScannerOptionsBuilderProxyApi {
  BarcodeScannerOptions$Builder get impl =>
      BarcodeScannerOptions$BuilderImpl.internal(this);
}

extension BarcodeScannerOptionsX on BarcodeScannerOptions {
  BarcodeScannerOptionsProxyApi get api {
    final impl = this;
    if (impl is! BarcodeScannerOptionsImpl) throw TypeError();
    return impl.api;
  }
}

extension BarcodeScannerOptionsProxyApiX on BarcodeScannerOptionsProxyApi {
  BarcodeScannerOptions get impl => BarcodeScannerOptionsImpl.internal(this);
}
