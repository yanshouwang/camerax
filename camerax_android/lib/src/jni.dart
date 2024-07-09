// ignore_for_file: camel_case_extensions

import 'dart:ui';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:jni/jni.dart';

import 'image_proxy.dart';
import 'jni.g.dart' as jni;

abstract class JNI {
  static jni.Activity get activity {
    final reference = Jni.getCurrentActivity();
    return jni.Activity.fromReference(reference);
  }

  static jni.Context get context {
    return activity.castTo(jni.Context.type);
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

extension FlashModeX on FlashMode {
  int get jniValue {
    switch (this) {
      case FlashMode.auto:
        return jni.ImageCapture.FLASH_MODE_AUTO;
      case FlashMode.on:
        return jni.ImageCapture.FLASH_MODE_ON;
      case FlashMode.off:
        return jni.ImageCapture.FLASH_MODE_OFF;
    }
  }
}

extension intX on int {
  FlashMode get dartFlashMode {
    switch (this) {
      case jni.ImageCapture.FLASH_MODE_AUTO:
        return FlashMode.auto;
      case jni.ImageCapture.FLASH_MODE_ON:
        return FlashMode.on;
      case jni.ImageCapture.FLASH_MODE_OFF:
        return FlashMode.off;
      default:
        throw ArgumentError.value(this);
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

extension JIntegerX on JInteger {
  int? get dartValue {
    if (isNull) {
      return null;
    } else {
      return intValue();
    }
  }
}

extension JNIImageProxyX on jni.ImageProxy {
  ImageProxy get dartValue {
    return ImageProxyImpl(
      jniValue: this,
    );
  }
}

extension JNIUriX on jni.Uri {
  Uri get dartValue {
    final contentResolver = JNI.context.getContentResolver();
    final projection = JArray(JString.type, 1);
    projection[0] = jni.MediaStore_MediaColumns.DATA;
    final selection = JString.fromReference(jNullReference);
    final selectionArgs = JArray.fromReference(JString.type, jNullReference);
    final sortOrder = JString.fromReference(jNullReference);
    final cursor = contentResolver.query(
      this,
      projection,
      selection,
      selectionArgs,
      sortOrder,
    );
    cursor.moveToFirst();
    final columnIndex = cursor.getColumnIndex(jni.MediaStore_MediaColumns.DATA);
    final path = cursor.getString(columnIndex).toDartString();
    cursor.close();
    return Uri.file(path);
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

  Future<jni.LiveData<JInteger>> getTorchStateOnMainThread() {
    return runOnPlatformThread(() => getTorchState());
  }

  Future<jni.ListenableFuture<JObject>> enableTorchOnMainThread(
    bool torchEnabled,
  ) {
    return runOnPlatformThread(() => enableTorch(torchEnabled));
  }

  Future<void> setImageAnalysisBackpressureStrategyOnMainThread(int strategy) {
    return runOnPlatformThread(() => setImageAnalysisBackpressureStrategy(
          strategy,
        ));
  }

  Future<void> setImageAnalysisAnalyzerOnMainThread(
    jni.Executor executor,
    jni.ImageAnalysis_Analyzer analyzer,
  ) {
    return runOnPlatformThread(() => setImageAnalysisAnalyzer(
          executor,
          analyzer,
        ));
  }

  Future<void> clearImageAnalysisAnalyzerOnMainThread() {
    return runOnPlatformThread(() => clearImageAnalysisAnalyzer());
  }

  Future<int> getImageCaptureFlashModeOnMainThread() {
    return runOnPlatformThread(() => getImageCaptureFlashMode());
  }

  Future<void> setImageCaptureFlashModeOnMainThread(int flashMode) {
    return runOnPlatformThread(() => setImageCaptureFlashMode(flashMode));
  }

  Future<void> setImageCaptureModeOnMainThread(int captureMode) {
    return runOnPlatformThread(() => setImageCaptureMode(captureMode));
  }

  Future<void> takePictureToMemoryOnMainThread(
    jni.Executor executor,
    JReference callbackReference,
  ) {
    return runOnPlatformThread(() {
      final callback = jni.ImageCapture_OnImageCapturedCallback.fromReference(
        callbackReference,
      );
      takePicture1(executor, callback);
    });
  }

  Future<void> takePictureToAlbumOnMainThread(
    jni.ImageCapture_OutputFileOptions outputFileOptions,
    jni.Executor executor,
    JReference imageSavedCallbackReference,
  ) {
    return runOnPlatformThread(() {
      final imageSavedCallback =
          jni.ImageCapture_OnImageSavedCallback.fromReference(
        imageSavedCallbackReference,
      );
      takePicture(
        outputFileOptions,
        executor,
        imageSavedCallback,
      );
    });
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
