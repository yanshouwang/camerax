import 'dart:ui';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:jni/jni.dart';

import 'jni.g.dart' as jni;

abstract class JNI {
  static JObject get activity {
    final reference = Jni.getCurrentActivity();
    return JObject.fromReference(reference);
  }
}

extension LensFacingX on LensFacing {
  int get jniValue {
    switch (this) {
      case LensFacing.front:
        return jni.CameraSelector.LENS_FACING_FRONT;
      case LensFacing.back:
        return jni.CameraSelector.LENS_FACING_BACK;
      case LensFacing.external:
        return jni.CameraSelector.LENS_FACING_EXTERNAL;
    }
  }
}

extension CameraSelectorX on CameraSelector {
  jni.CameraSelector get jniValue {
    if (this == CameraSelector.back) {
      return jni.CameraSelector.DEFAULT_BACK_CAMERA;
    } else if (this == CameraSelector.front) {
      return jni.CameraSelector.DEFAULT_FRONT_CAMERA;
    } else {
      return jni.CameraSelector_Builder()
          .requireLensFacing(lensFacing.jniValue)
          .build();
    }
  }
}

extension ScaleTypeX on ScaleType {
  jni.PreviewView_ScaleType get jniValue {
    switch (this) {
      case ScaleType.fillCenter:
        return jni.PreviewView_ScaleType.FILL_CENTER;
      case ScaleType.fillStart:
        return jni.PreviewView_ScaleType.FILL_START;
      case ScaleType.fillEnd:
        return jni.PreviewView_ScaleType.FILL_END;
      case ScaleType.fitCenter:
        return jni.PreviewView_ScaleType.FIT_CENTER;
      case ScaleType.fitStart:
        return jni.PreviewView_ScaleType.FIT_START;
      case ScaleType.fitEnd:
        return jni.PreviewView_ScaleType.FIT_END;
    }
  }
}

extension JNIZoomStateX on jni.ZoomState {
  ZoomState? get dartValue {
    if (isNull) {
      return null;
    } else {
      final minZoomRatio = getMinZoomRatio();
      final maxZoomRatio = getMaxZoomRatio();
      final linearZoom = getLinearZoom();
      final zoomRatio = getZoomRatio();
      return ZoomState(
        minZoomRatio: minZoomRatio,
        maxZoomRatio: maxZoomRatio,
        linearZoom: linearZoom,
        zoomRatio: zoomRatio,
      );
    }
  }
}

extension JNILifecycleCameraControllerX on jni.LifecycleCameraController {
  Future<void> bindToLifecycleOnMainThread(jni.LifecycleOwner lifecycleOwner) {
    return runOnPlatformThread(() => bindToLifecycle(lifecycleOwner));
  }

  Future<void> unbindOnMainThread() {
    return runOnPlatformThread(() => unbind());
  }

  Future<bool> hasCameraOnMainThread(jni.CameraSelector cameraSelector) {
    return runOnPlatformThread(() => hasCamera(cameraSelector));
  }

  Future<void> setCameraSelectorOnMainThread(
      jni.CameraSelector cameraSelector) {
    return runOnPlatformThread(() => setCameraSelector(cameraSelector));
  }

  Future<bool> isTapToFocusEnabledOnMainThread() {
    return runOnPlatformThread(() => isTapToFocusEnabled());
  }

  Future<void> setTapToFocusEnabledOnMainThread(bool enabled) {
    return runOnPlatformThread(() => setTapToFocusEnabled(enabled));
  }

  Future<bool> isPinchToZoomEnabledOnMainThread() {
    return runOnPlatformThread(() => isPinchToZoomEnabled());
  }

  Future<void> setPinchToZoomEnabledOnMainThread(bool enabled) {
    return runOnPlatformThread(() => setPinchToZoomEnabled(enabled));
  }

  Future<jni.LiveData<jni.ZoomState>> getZoomStateOnMainThread() {
    return runOnPlatformThread(() => getZoomState());
  }

  Future<jni.ListenableFuture<JObject>> setLinearZoomOnMainThread(
    double linearZoom,
  ) {
    return runOnPlatformThread(() => setLinearZoom(linearZoom));
  }

  Future<jni.ListenableFuture<JObject>> setZoomRatioOnMainThread(
    double zoomRatio,
  ) {
    return runOnPlatformThread(() => setZoomRatio(zoomRatio));
  }
}

extension JNILiveDataX<T extends JObject> on jni.LiveData<T> {
  Future<void> observeOnMainThread(
    jni.LifecycleOwner lifecycleOwner,
    JObjType<T> observerT,
    JReference observerReference,
  ) {
    return runOnPlatformThread(() {
      final observer = jni.Observer.fromReference(observerT, observerReference);
      observe(lifecycleOwner, observer);
    });
  }

  Future<void> removeObserverOnMainThread(
    JObjType<T> observerT,
    JReference observerReference,
  ) {
    return runOnPlatformThread(() {
      final observer = jni.Observer.fromReference(observerT, observerReference);
      removeObserver(observer);
    });
  }
}

extension JNIPreviewViewX on jni.PreviewView {
  Future<void> setControllerOnMainThread(
    jni.CameraController cameraController,
  ) {
    return runOnPlatformThread(() => setController(cameraController));
  }

  Future<void> setScaleTypeOnMainThread(jni.PreviewView_ScaleType scaleType) {
    return runOnPlatformThread(() => setScaleType(scaleType));
  }
}
