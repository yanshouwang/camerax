import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'vn_barcode_observation.dart';
import 'vn_image_based_request.dart';
import 'vn_request.dart';

abstract base class VNDetectBarcodesRequest extends VNImageBasedRequest {
  VNDetectBarcodesRequest.impl() : super.impl();

  factory VNDetectBarcodesRequest({
    required VNRequestCompletionHandler completionHandler,
  }) => CameraXPlugin.instance.$VNDetectBarcodesRequest(
    completionHandler: completionHandler,
  );

  Future<List<VNBarcodeSymbology>> getSupportedSymbologies();
  Future<List<VNBarcodeSymbology>> getSymbologies();
  Future<void> setSymbologies(List<VNBarcodeSymbology> value);
  @override
  Future<List<VNBarcodeObservation>?> getResults();
}
