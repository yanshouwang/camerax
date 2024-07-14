import 'dart:ui';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'ffi.g.dart' as ffi;

extension ScaleTypeX on ScaleType {
  int get ffiValue {
    switch (this) {
      case ScaleType.fillCenter:
        return ffi.ScaleType.ScaleTypeFillCenter;
      case ScaleType.fitCenter:
        return ffi.ScaleType.ScaleTypeFitCenter;
      default:
        throw ArgumentError.value(this);
    }
  }
}

extension LensFacingX on LensFacing {
  int get ffiValue {
    switch (this) {
      case LensFacing.back:
        return ffi.LensFacing.LensFacingBack;
      case LensFacing.front:
        return ffi.LensFacing.LensFacingFront;
      case LensFacing.external:
        return ffi.LensFacing.LensFacingExternal;
    }
  }
}

extension CameraSelectorX on CameraSelector {
  ffi.CameraSelector get ffiValue {
    if (this == CameraSelector.back) {
      return ffi.CameraSelector.getBack();
    } else if (this == CameraSelector.front) {
      return ffi.CameraSelector.getFront();
    } else {
      return ffi.CameraSelector.alloc()
          .initWithLensFacing_(lensFacing.ffiValue);
    }
  }
}

extension FlashModeX on FlashMode {
  int get ffiValue {
    switch (this) {
      case FlashMode.auto:
        return ffi.FlashMode.FlashModeAuto;
      case FlashMode.on:
        return ffi.FlashMode.FlashModeOn;
      case FlashMode.off:
        return ffi.FlashMode.FlashModeOff;
    }
  }
}

extension FFIZoomStateX on ffi.ZoomState {
  ZoomState get dartValue {
    return ZoomState(
      minZoomRatio: minZoomRatio,
      maxZoomRatio: maxZoomRatio.clamp(minZoomRatio, 15.0),
      zoomRatio: zoomRatio,
      linearZoom: linearZoom,
    );
  }
}

extension FFIPreviewViewX on ffi.PreviewView {
  Future<void> setControllerOnMainThread(
    ffi.CameraController? controller,
  ) async {
    final viewPtr = pointer;
    final controllerPtr = controller?.pointer;
    await runOnPlatformThread(() {
      final view = ffi.PreviewView.castFromPointer(viewPtr);
      if (controllerPtr == null) {
        view.controller = null;
      } else {
        view.controller = ffi.CameraController.castFromPointer(controllerPtr);
      }
    });
  }

  Future<void> setScaleTypeOnMainThread(int scaleType) async {
    final viewPtr = pointer;
    await runOnPlatformThread(() {
      final view = ffi.PreviewView.castFromPointer(viewPtr);
      view.scaleType = scaleType;
    });
  }
}
