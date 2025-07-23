import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension VNBarcodeSymbologyX on VNBarcodeSymbology {
  VNBarcodeSymbologyApi get api {
    return VNBarcodeSymbologyApi.values[index];
  }
}

extension VnBarcodeSymbologyApiX on VNBarcodeSymbologyApi {
  VNBarcodeSymbology get impl {
    return VNBarcodeSymbology.values[index];
  }
}
