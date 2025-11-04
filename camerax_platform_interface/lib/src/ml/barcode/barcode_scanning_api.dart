import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'barcode_scanner_api.dart';
import 'barcode_scanner_options_api.dart';

abstract base class BarcodeScanningApi {
  static Future<BarcodeScannerApi> getClient([
    BarcodeScannerOptionsApi? options,
  ]) => CameraXPlugin.instance.$BarcodeScanningApiGetClient(options);

  BarcodeScanningApi.impl();
}
