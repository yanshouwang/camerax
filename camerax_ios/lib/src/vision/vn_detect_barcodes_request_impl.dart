import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'vn_barcode_observation_impl.dart';
import 'vn_image_based_request_impl.dart';
import 'vn_request_impl.dart';

final class VNDetectBarcodesRequestImpl extends VNDetectBarcodesRequest
    with VNRequestImpl, VNImageBasedRequestImpl {
  @override
  final VNDetectBarcodesRequestProxyApi api;

  VNDetectBarcodesRequestImpl.internal(this.api) : super.impl();

  factory VNDetectBarcodesRequestImpl({
    required VNRequestCompletionHandler completionHandler,
  }) {
    final api = VNDetectBarcodesRequestProxyApi(
      completionHandler: (request, error) =>
          completionHandler(request.impl, error?.impl),
    );
    return VNDetectBarcodesRequestImpl.internal(api);
  }

  @override
  Future<List<VNBarcodeSymbology>> getSupportedSymbologies() => api
      .getSupportedSymbologies()
      .then((e) => e.map((e1) => e1.impl).toList());

  @override
  Future<List<VNBarcodeSymbology>> getSymbologies() =>
      api.getSymbologies().then((e) => e.map((e1) => e1.impl).toList());

  @override
  Future<void> setSymbologies(List<VNBarcodeSymbology> value) =>
      api.setSymbologies(value.map((e) => e.api).toList());

  @override
  Future<List<VNBarcodeObservation>?> getResults() => api.getResults().then(
    (e) async => e == null ? null : await Future.wait(e.map((e1) => e1.impl())),
  );
}
