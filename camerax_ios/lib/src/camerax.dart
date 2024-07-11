import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:flutter/widgets.dart';

import 'camera_controller.dart';
import 'ffi.dart' as ffi;
import 'ffi.g.dart';

final class CameraXiOSPlugin extends CameraXPlugin {
  static void registerWith() {
    CameraXPlugin.instance = CameraXiOSPlugin();
  }

  @override
  CameraController createCameraController() {
    return CameraControllerImpl();
  }

  @override
  Widget buildPreviewView(
    BuildContext context, {
    required CameraController controller,
    required ScaleType scaleType,
  }) {
    if (controller is! CameraControllerImpl) {
      throw TypeError();
    }
    return UiKitView(
      viewType: 'hebei.dev/PreviewView',
      layoutDirection: TextDirection.ltr,
      onPlatformViewCreated: (id) {
        final view = PreviewViewFactory.getShared().retrieveView_(id);
        if (view == null) {
          throw ArgumentError.notNull();
        }
        view.setSessionOnMainThread(controller.session);
        view.setVideoGravityOnMainThread(scaleType.ffiValue);
      },
    );
  }
}
