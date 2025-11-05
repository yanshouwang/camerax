import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';

import 'barcode_scanner_options_api.dart';

abstract base class BarcodeScannerApi extends CloseableApi {
  BarcodeScannerApi.impl() : super.impl();

  factory BarcodeScannerApi() => CameraXPlugin.instance.$BarcodeScannerApi();

  factory BarcodeScannerApi.options(BarcodeScannerOptionsApi options) =>
      CameraXPlugin.instance.$BarcodeScannerApiOptions(options);
}
