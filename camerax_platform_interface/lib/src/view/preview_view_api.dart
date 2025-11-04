import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';

import 'camera_controller_api.dart';

enum PreviewViewScaleType {
  fillCenter,
  fillEnd,
  fillStart,
  fitCenter,
  fitEnd,
  fitStart,
}

abstract base class PreviewViewApi extends ViewApi {
  PreviewViewApi.impl() : super.impl();

  factory PreviewViewApi() => CameraXPlugin.instance.$PreviewViewApi();

  Future<void> setController(CameraControllerApi controller);
}
