// ignore_for_file: camel_case_extensions

import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:hybrid_os/hybrid_os.dart';
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

extension AuthorizationTypeX on AuthorizationType {
  JArray<JString> get jniValue {
    switch (this) {
      case AuthorizationType.video:
        final permissions = JArray(JString.type, 1);
        permissions[0] = jni.Manifest_permission.CAMERA;
        return permissions;
      case AuthorizationType.audio:
        final permissions = JArray(JString.type, 1);
        permissions[0] = jni.Manifest_permission.RECORD_AUDIO;
        return permissions;
      case AuthorizationType.album:
        final os = OS();
        if (os is Android && os.sdkVersion < AndroidSDKVersions.q) {
          final permissions = JArray(JString.type, 2);
          permissions[0] = jni.Manifest_permission.READ_EXTERNAL_STORAGE;
          permissions[0] = jni.Manifest_permission.WRITE_EXTERNAL_STORAGE;
          return permissions;
        } else {
          return JArray(JString.type, 0);
        }
    }
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

extension MLObjectTypeX on MLObjectType {
  int get jniValue {
    switch (this) {
      case MLObjectType.codabar:
        return jni.Barcode.FORMAT_CODABAR;
      case MLObjectType.code39:
        return jni.Barcode.FORMAT_CODE_39;
      case MLObjectType.code93:
        return jni.Barcode.FORMAT_CODE_93;
      case MLObjectType.code128:
        return jni.Barcode.FORMAT_CODE_128;
      case MLObjectType.ean8:
        return jni.Barcode.FORMAT_EAN_8;
      case MLObjectType.ean13:
        return jni.Barcode.FORMAT_EAN_13;
      case MLObjectType.itf14:
        return jni.Barcode.FORMAT_ITF;
      case MLObjectType.upcE:
        return jni.Barcode.FORMAT_UPC_E;
      case MLObjectType.aztec:
        return jni.Barcode.FORMAT_AZTEC;
      case MLObjectType.dataMatrix:
        return jni.Barcode.FORMAT_DATA_MATRIX;
      case MLObjectType.pdf417:
        return jni.Barcode.FORMAT_PDF417;
      case MLObjectType.qr:
        return jni.Barcode.FORMAT_QR_CODE;
      default:
        return jni.Barcode.FORMAT_UNKNOWN;
    }
  }
}

extension MLObjectTypeListX on List<MLObjectType> {
  JList<jni.Detector> get jniValue {
    final detectors = <jni.Detector>[];
    final formats = map((type) => type.jniValue)
        .where((format) => format != jni.Barcode.FORMAT_UNKNOWN)
        .toList();
    if (formats.isNotEmpty) {
      final format = formats.first;
      final moreFormats = JArray(jint.type, formats.length - 1);
      moreFormats.setRange(0, formats.length - 1, formats, 1);
      final options = jni.BarcodeScannerOptions_Builder()
          .setBarcodeFormats(format, moreFormats)
          .build();
      final detector = jni.BarcodeScanning.getClient1(options).castTo(
        jni.Detector.type(
          JList.type(jni.Barcode.type),
        ),
      );
      detectors.add(detector);
    }
    for (var type in this) {
      switch (type) {
        case MLObjectType.face:
          final options = jni.FaceDetectorOptions_Builder()
              .setPerformanceMode(
                  jni.FaceDetectorOptions.PERFORMANCE_MODE_ACCURATE)
              .enableTracking()
              .build();
          final detector = jni.FaceDetection.getClient1(options).castTo(
            jni.Detector.type(
              JList.type(jni.Face.type),
            ),
          );
          detectors.add(detector);
        default:
          break;
      }
    }
    return detectors.toJList(jni.Detector.type(JObject.type));
  }
}

extension intX on int {
  FlashMode get flashMode {
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

  MLObjectType get mlObjectType {
    switch (this) {
      case jni.Barcode.FORMAT_CODABAR:
        return MLObjectType.codabar;
      case jni.Barcode.FORMAT_CODE_39:
        return MLObjectType.code39;
      case jni.Barcode.FORMAT_CODE_93:
        return MLObjectType.code93;
      case jni.Barcode.FORMAT_CODE_128:
        return MLObjectType.code128;
      case jni.Barcode.FORMAT_EAN_8:
        return MLObjectType.ean8;
      case jni.Barcode.FORMAT_EAN_13:
        return MLObjectType.ean13;
      case jni.Barcode.FORMAT_ITF:
        return MLObjectType.itf14;
      case jni.Barcode.FORMAT_UPC_A:
        return MLObjectType.upcA;
      case jni.Barcode.FORMAT_UPC_E:
        return MLObjectType.upcE;
      case jni.Barcode.FORMAT_AZTEC:
        return MLObjectType.aztec;
      case jni.Barcode.FORMAT_DATA_MATRIX:
        return MLObjectType.dataMatrix;
      case jni.Barcode.FORMAT_PDF417:
        return MLObjectType.pdf417;
      case jni.Barcode.FORMAT_QR_CODE:
        return MLObjectType.qr;
      default:
        throw ArgumentError.value(this);
    }
  }
}

extension JZoomStateX on jni.ZoomState {
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
        zoomRatio: zoomRatio,
        linearZoom: linearZoom,
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

extension JImageProxyX on jni.ImageProxy {
  ImageProxy get dartValue {
    return JImageProxy(
      jniValue: this,
    );
  }
}

extension JUriX on jni.Uri {
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

extension JLifecycleCameraControllerX on jni.LifecycleCameraController {
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

  // Future<void> setImageAnalysisOutputImageFormatOnMainThread(
  //   int imageAnalysisOutputImageFormat,
  // ) {
  //   return runOnPlatformThread(() =>
  //       setImageAnalysisOutputImageFormat(imageAnalysisOutputImageFormat));
  // }

  Future<void> setImageAnalysisBackpressureStrategyOnMainThread(int strategy) {
    return runOnPlatformThread(() => setImageAnalysisBackpressureStrategy(
          strategy,
        ));
  }

  Future<void> setImageAnalysisAnalyzerOnMainThread(
    jni.Executor executor,
    JReference analyzerReference,
  ) {
    return runOnPlatformThread(() {
      final analyzer = jni.ImageAnalysis_Analyzer.fromReference(
        analyzerReference,
      );
      setImageAnalysisAnalyzer(
        executor,
        analyzer,
      );
    });
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

extension JLiveDataX<T extends JObject> on jni.LiveData<T> {
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

extension JPreviewViewX on jni.PreviewView {
  Future<void> setControllerOnMainThread(
    jni.CameraController cameraController,
  ) {
    return runOnPlatformThread(() => setController(cameraController));
  }

  Future<void> setScaleTypeOnMainThread(jni.PreviewView_ScaleType scaleType) {
    return runOnPlatformThread(() => setScaleType(scaleType));
  }
}

extension JBarcodeX on jni.Barcode {
  MLCodeObject toDartValue({
    required DateTime time,
    required Duration duration,
  }) {
    final type = getFormat().mlObjectType;
    final bounds = getBoundingBox().dartValue;
    final corners = <Point<int>>[];
    final cornerPoints = getCornerPoints();
    for (var i = 0; i < cornerPoints.length; i++) {
      final cornerPoint = cornerPoints[i];
      final corner = cornerPoint.dartValue;
      corners.add(corner);
    }
    final rawBytes = getRawBytes();
    final value = rawBytes.isNull ? null : rawBytes.dartValue;
    final stringValue = getDisplayValue().toDartString();
    return MLCodeObject(
      type: type,
      time: time,
      duration: duration,
      bounds: bounds,
      corners: corners,
      value: value,
      stringValue: stringValue,
    );
  }
}

extension JFaceX on jni.Face {
  MLFaceObject toDartValue({
    required DateTime time,
    required Duration duration,
  }) {
    final bounds = getBoundingBox().dartValue;
    final id = getTrackingId().intValue();
    final rollAngle = getHeadEulerAngleZ();
    final yawAngle = getHeadEulerAngleY();
    final pitchAngle = getHeadEulerAngleX();
    return MLFaceObject(
      time: time,
      duration: duration,
      bounds: bounds,
      id: id,
      rollAngle: rollAngle,
      yawAngle: yawAngle,
      pitchAngle: pitchAngle,
    );
  }
}

extension JByteArrayX on JArray<jbyte> {
  Uint8List get dartValue {
    final elements = getRange(0, length);
    return Uint8List.fromList(elements);
  }
}

extension JRectX on jni.Rect {
  Rectangle<int> get dartValue {
    return Rectangle(
      left,
      top,
      width(),
      height(),
    );
  }
}

extension JPointX on jni.Point {
  Point<int> get dartValue {
    return Point(x, y);
  }
}
