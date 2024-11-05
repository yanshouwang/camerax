import 'package:camerax_ios/src/ffi.dart' as ffi;
import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:flutter/widgets.dart';

import 'camera_controller.dart';

class PreviewViewBuilderImpl implements PreviewViewBuilder {
  @override
  Widget build(CameraController controller) {
    return UiKitView(
      viewType: 'hebei.dev/PreviewView',
      layoutDirection: TextDirection.ltr,
      onPlatformViewCreated: (id) async {
        if (controller is! MyCameraController) {
          throw TypeError();
        }
        final view = ffi.PreviewViewFactory.getShared().retrieveView_(id);
        if (view == null) {
          throw ArgumentError.notNull();
        }
        await view.setControllerOnMainThread(controller.ffiValue);
      },
    );
  }
}
