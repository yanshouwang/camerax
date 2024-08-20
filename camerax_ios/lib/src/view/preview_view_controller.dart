import 'package:camerax_ios/src/ffi.dart' as ffi;
import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'camera_controller.dart';

class PreviewViewControllerImpl implements PreviewViewController {
  int? _id;

  @override
  Widget build(
    BuildContext context, {
    required PlatformViewCreatedCallback onCreated,
  }) {
    return UiKitView(
      viewType: 'hebei.dev/PreviewView',
      layoutDirection: TextDirection.ltr,
      onPlatformViewCreated: (id) {
        _id = id;
        onCreated(id);
      },
    );
  }

  @override
  Future<void> setController(CameraController controller) async {
    if (controller is! MyCameraController) {
      throw TypeError();
    }
    final id = _id;
    if (id == null) {
      return;
    }
    final view = ffi.PreviewViewFactory.getShared().retrieveView_(id);
    if (view == null) {
      throw ArgumentError.notNull();
    }
    await view.setControllerOnMainThread(controller.ffiValue);
  }

  @override
  Future<void> setScaleType(ScaleType scaleType) async {
    final id = _id;
    if (id == null) {
      return;
    }
    final view = ffi.PreviewViewFactory.getShared().retrieveView_(id);
    if (view == null) {
      throw ArgumentError.notNull();
    }
    await view.setScaleTypeOnMainThread(scaleType.ffiValue);
  }
}
