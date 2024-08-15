import 'dart:ui' as ui;

import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'ffi.g.dart' as ffi;

extension AuthorizationTypeX on AuthorizationType {
  ffi.AuthorizationType get ffiValue {
    switch (this) {
      case AuthorizationType.video:
        return ffi.AuthorizationType.AuthorizationTypeVideo;
      case AuthorizationType.audio:
        return ffi.AuthorizationType.AuthorizationTypeAudio;
      case AuthorizationType.album:
        return ffi.AuthorizationType.AuthorizationTypeAlbum;
    }
  }
}

extension ScaleTypeX on ScaleType {
  ffi.ScaleType get ffiValue {
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
  ffi.LensFacing get ffiValue {
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

extension FlashModeX on FlashMode {
  ffi.FlashMode get ffiValue {
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
      maxZoomRatio: maxZoomRatio,
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
    await ui.runOnPlatformThread(() {
      final view = ffi.PreviewView.castFromPointer(viewPtr);
      if (controllerPtr == null) {
        view.controller = null;
      } else {
        view.controller = ffi.CameraController.castFromPointer(controllerPtr);
      }
    });
  }

  Future<void> setScaleTypeOnMainThread(ffi.ScaleType scaleType) async {
    final viewPtr = pointer;
    await ui.runOnPlatformThread(() {
      final view = ffi.PreviewView.castFromPointer(viewPtr);
      view.scaleType = scaleType;
    });
  }
}
