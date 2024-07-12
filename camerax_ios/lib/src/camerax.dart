import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:flutter/services.dart';
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
    required PlatformViewCreatedCallback onPreviewViewCreated,
  }) {
    return UiKitView(
      viewType: 'hebei.dev/PreviewView',
      layoutDirection: TextDirection.ltr,
      onPlatformViewCreated: (id) {
        onPreviewViewCreated(id);
      },
    );
  }

  @override
  Future<void> setPreviewViewController(
    int id,
    CameraController controller,
  ) async {
    if (controller is! CameraControllerImpl) {
      throw TypeError();
    }
    final view = PreviewViewFactory.getShared().retrieveView_(id);
    if (view == null) {
      throw ArgumentError.notNull();
    }
    await view.setSessionOnMainThread(controller.session);
  }

  @override
  Future<void> setPreviewViewScaleType(int id, ScaleType scaleType) async {
    final view = PreviewViewFactory.getShared().retrieveView_(id);
    if (view == null) {
      throw ArgumentError.notNull();
    }
    await view.setVideoGravityOnMainThread(scaleType.ffiValue);
  }
}
