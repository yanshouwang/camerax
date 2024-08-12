// ignore_for_file: camel_case_extensions

import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:hybrid_os/hybrid_os.dart';
import 'package:jni/jni.dart';

import 'image_proxy.dart';
import 'jni.g.dart' as jni;
import 'ml_analyzer.dart';

abstract class MyJNI {
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
  jni.MyPreviewView_MyScaleType get jniValue {
    switch (this) {
      case ScaleType.fillCenter:
        return jni.MyPreviewView_MyScaleType.FILL_CENTER;
      case ScaleType.fillStart:
        return jni.MyPreviewView_MyScaleType.FILL_START;
      case ScaleType.fillEnd:
        return jni.MyPreviewView_MyScaleType.FILL_END;
      case ScaleType.fitCenter:
        return jni.MyPreviewView_MyScaleType.FIT_CENTER;
      case ScaleType.fitStart:
        return jni.MyPreviewView_MyScaleType.FIT_START;
      case ScaleType.fitEnd:
        return jni.MyPreviewView_MyScaleType.FIT_END;
    }
  }
}

extension FlashModeX on FlashMode {
  int get jniValue {
    switch (this) {
      case FlashMode.auto:
        return jni.MyImageCapture.FLASH_MODE_AUTO;
      case FlashMode.on:
        return jni.MyImageCapture.FLASH_MODE_ON;
      case FlashMode.off:
        return jni.MyImageCapture.FLASH_MODE_OFF;
    }
  }
}

extension ImageAnalyzerX on ImageAnalyzer {
  JObject get jniValue {
    final analyzer = this;
    if (analyzer is MyMLAnalyzer) {
      return analyzer.jniValue;
    } else {
      return jni.MyImageAnalysis_MyAnalyzerImpl(
        jni.MyImageAnalysis_MyAnalyzer.implement(
          jni.$MyImageAnalysis_MyAnalyzerImpl(
            analyze: (imageProxy) {
              analyzer.analyze(imageProxy.dartValue);
            },
          ),
        ),
      );
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
  FlashMode get dartFlashMode {
    switch (this) {
      case jni.MyImageCapture.FLASH_MODE_AUTO:
        return FlashMode.auto;
      case jni.MyImageCapture.FLASH_MODE_ON:
        return FlashMode.on;
      case jni.MyImageCapture.FLASH_MODE_OFF:
        return FlashMode.off;
      default:
        throw ArgumentError.value(this);
    }
  }

  VideoRecordError? get dartVideoRecordError {
    switch (this) {
      case jni.VideoRecordEvent_Finalize.ERROR_NONE:
        return null;
      case jni.VideoRecordEvent_Finalize.ERROR_UNKNOWN:
        return VideoRecordError.unknown;
      case jni.VideoRecordEvent_Finalize.ERROR_FILE_SIZE_LIMIT_REACHED:
        return VideoRecordError.fileSizeLimitReached;
      case jni.VideoRecordEvent_Finalize.ERROR_INSUFFICIENT_STORAGE:
        return VideoRecordError.insufficientStorage;
      case jni.VideoRecordEvent_Finalize.ERROR_SOURCE_INACTIVE:
        return VideoRecordError.sourceInactive;
      case jni.VideoRecordEvent_Finalize.ERROR_INVALID_OUTPUT_OPTIONS:
        return VideoRecordError.invalidOutputOptions;
      case jni.VideoRecordEvent_Finalize.ERROR_ENCODING_FAILED:
        return VideoRecordError.encodingFailed;
      case jni.VideoRecordEvent_Finalize.ERROR_RECORDER_ERROR:
        return VideoRecordError.recorderError;
      case jni.VideoRecordEvent_Finalize.ERROR_NO_VALID_DATA:
        return VideoRecordError.noValidData;
      case jni.VideoRecordEvent_Finalize.ERROR_DURATION_LIMIT_REACHED:
        return VideoRecordError.durationLimitReached;
      case jni.VideoRecordEvent_Finalize.ERROR_RECORDING_GARBAGE_COLLECTED:
        return VideoRecordError.recordingGarbageCollected;
      default:
        throw ArgumentError.value(this);
    }
  }

  MLObjectType get jniMLCodeType {
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

extension JNICameraSelectorX on jni.CameraSelector {
  CameraSelector get dartValue {
    return CameraSelector(
      lensFacing: getLensFacing().dartLensFacing,
    );
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
        zoomRatio: zoomRatio,
        linearZoom: linearZoom,
      );
    }
  }
}

extension JNIIntegerX on JInteger {
  int? get dartValue {
    if (isNull) {
      return null;
    } else {
      return intValue();
    }
  }

  LensFacing get dartLensFacing {
    final dartValue = this.dartValue;
    switch (dartValue) {
      case jni.CameraSelector.LENS_FACING_BACK:
        return LensFacing.back;
      case jni.CameraSelector.LENS_FACING_FRONT:
        return LensFacing.front;
      case jni.CameraSelector.LENS_FACING_EXTERNAL:
        return LensFacing.external;
      default:
        throw ArgumentError.value(dartValue);
    }
  }
}

extension JNIImageProxyX on jni.ImageProxy {
  ImageProxy get dartValue {
    return MyImageProxy(
      jniValue: this,
    );
  }
}

extension JNIUriX on jni.Uri {
  Uri get dartValue {
    final contentResolver = MyJNI.context.getContentResolver();
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
  Future<void> setEnabledUseCasesOnMainThread(int enabledUseCases) {
    return runOnPlatformThread(() => setEnabledUseCases(enabledUseCases));
  }

  Future<void> bindToLifecycleOnMainThread(jni.LifecycleOwner lifecycleOwner) {
    return runOnPlatformThread(() => bindToLifecycle(lifecycleOwner));
  }

  Future<void> unbindOnMainThread() {
    return runOnPlatformThread(() => unbind());
  }

  Future<bool> hasCameraOnMainThread(jni.CameraSelector cameraSelector) {
    return runOnPlatformThread(() => hasCamera(cameraSelector));
  }

  Future<jni.CameraSelector> getCameraSelectorOnMainThread() {
    return runOnPlatformThread(() => getCameraSelector());
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

  Future<void> setImageAnalysisOutputImageFormatOnMainThread(
    int imageAnalysisOutputImageFormat,
  ) {
    return runOnPlatformThread(() =>
        setImageAnalysisOutputImageFormat(imageAnalysisOutputImageFormat));
  }

  Future<void> setImageAnalysisBackpressureStrategyOnMainThread(int strategy) {
    return runOnPlatformThread(
        () => setImageAnalysisBackpressureStrategy(strategy));
  }

  Future<void> setImageAnalysisAnalyzerOnMainThread(
    jni.Executor executor,
    JObject analyzer,
  ) {
    final analyzerReference = analyzer.reference;
    return runOnPlatformThread(() {
      final analyzer = JObject.fromReference(
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
    JObject callback,
  ) {
    final callbackReference = callback.reference;
    return runOnPlatformThread(() {
      final callback = JObject.fromReference(
        callbackReference,
      );
      takePicture1(executor, callback);
    });
  }

  Future<void> takePictureToAlbumOnMainThread(
    JObject outputFileOptions,
    jni.Executor executor,
    JObject imageSavedCallback,
  ) {
    final imageSavedCallbackReference = imageSavedCallback.reference;
    return runOnPlatformThread(() {
      final imageSavedCallback = JObject.fromReference(
        imageSavedCallbackReference,
      );
      takePicture(
        outputFileOptions,
        executor,
        imageSavedCallback,
      );
    });
  }

  Future<jni.Recording> startRecordingOnMainThread(
    JObject outputOptions,
    jni.AudioConfig audioConfig,
    jni.Executor executor,
    jni.Consumer<jni.VideoRecordEvent> listener,
  ) {
    final listenerT = listener.T;
    final listenerReference = listener.reference;
    return runOnPlatformThread(() {
      final listener = jni.Consumer<jni.VideoRecordEvent>.fromReference(
        listenerT,
        listenerReference,
      );
      return startRecording2(
        outputOptions,
        audioConfig,
        executor,
        listener,
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

extension JNIPreviewViewX on jni.MyPreviewView {
  Future<void> setControllerOnMainThread(
    jni.CameraController cameraController,
  ) {
    return runOnPlatformThread(() => setController(cameraController));
  }

  Future<void> setScaleTypeOnMainThread(
      jni.MyPreviewView_MyScaleType scaleType) {
    return runOnPlatformThread(() => setScaleType(scaleType));
  }
}

extension JNIBarcodeX on jni.Barcode {
  MLCodeObject toDartValue({
    required DateTime time,
    required Duration duration,
  }) {
    final type = getFormat().jniMLCodeType;
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

extension JNIFaceX on jni.Face {
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

extension JNIByteArrayX on JArray<jbyte> {
  Uint8List get dartValue {
    final elements = getRange(0, length);
    return Uint8List.fromList(elements);
  }
}

extension JNIRectX on jni.Rect {
  Rectangle<int> get dartValue {
    return Rectangle(
      left,
      top,
      width(),
      height(),
    );
  }
}

extension JNIPointX on jni.Point {
  Point<int> get dartValue {
    return Point(x, y);
  }
}

extension JNIVideoRecordEventX on jni.VideoRecordEvent {
  VideoRecordEvent get dartValue {
    final isInstanceOfStart = Jni.env.IsInstanceOf(
      reference.pointer,
      jni.VideoRecordEvent_Start.type.jClass.reference.pointer,
    );
    if (isInstanceOfStart) {
      return VideoRecordStartEvent();
    }
    final isInstanceOfPause = Jni.env.IsInstanceOf(
      reference.pointer,
      jni.VideoRecordEvent_Pause.type.jClass.reference.pointer,
    );
    if (isInstanceOfPause) {
      return VideoRecordPauseEvent();
    }
    final isInstanceOfResume = Jni.env.IsInstanceOf(
      reference.pointer,
      jni.VideoRecordEvent_Resume.type.jClass.reference.pointer,
    );
    if (isInstanceOfResume) {
      return VideoRecordResumeEvent();
    }
    final isInstanceOfFinalize = Jni.env.IsInstanceOf(
      reference.pointer,
      jni.VideoRecordEvent_Finalize.type.jClass.reference.pointer,
    );
    if (isInstanceOfFinalize) {
      final event = castTo(jni.VideoRecordEvent_Finalize.type);
      return VideoRecordFinalizeEvent(
        error: event.getError().dartVideoRecordError,
        uri: event.getOutputResults().getOutputUri().dartValue,
      );
    }
    throw ArgumentError.value(this);
  }
}
