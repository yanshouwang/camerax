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
        throw UnsupportedError('$this is not supported on iOS.');
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

extension FFIFlashModeX on ffi.FlashMode {
  FlashMode get dartValue {
    switch (this) {
      case ffi.FlashMode.FlashModeAuto:
        return FlashMode.auto;
      case ffi.FlashMode.FlashModeOn:
        return FlashMode.on;
      case ffi.FlashMode.FlashModeOff:
        return FlashMode.off;
    }
  }
}

extension FFIVideoRecordEventX on ffi.VideoRecordEvent {
  VideoRecordEvent get dartValue {
    final ffiEvent = this;
    if (ffiEvent is ffi.VideoRecordStartEvent) {
      return VideoRecordStartEvent();
    }
    if (ffiEvent is ffi.VideoRecordFinalizeEvent) {
      final uri = Uri.file('${ffiEvent.uri}');
      final ffiError = ffiEvent.error;
      final error = ffiError == null
          ? null
          : VideoRecordError('${ffiError.localizedDescription}');
      return VideoRecordFinalizeEvent(
        uri: uri,
        error: error,
      );
    }
    throw ArgumentError.value(this);
  }
}
