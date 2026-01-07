import 'package:camerax_platform_interface/src/vision.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class VNDetectBarcodesRequest
    implements VNImageBasedRequest {
  factory VNDetectBarcodesRequest({
    required VNRequestCompletionHandler completionHandler,
  }) => VNDetectBarcodesRequestChannel.instance.create(
    completionHandler: completionHandler,
  );

  Future<List<VNBarcodeSymbology>> getSupportedSymbologies();
  Future<List<VNBarcodeSymbology>> getSymbologies();
  Future<void> setSymbologies(List<VNBarcodeSymbology> value);
  @override
  Future<List<VNBarcodeObservation>?> getResults();
}

abstract base class VNDetectBarcodesRequestChannel extends PlatformInterface {
  VNDetectBarcodesRequestChannel() : super(token: _token);

  static final _token = Object();

  static VNDetectBarcodesRequestChannel? _instance;

  static VNDetectBarcodesRequestChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(VNDetectBarcodesRequestChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  VNDetectBarcodesRequest create({
    required VNRequestCompletionHandler completionHandler,
  });
}
