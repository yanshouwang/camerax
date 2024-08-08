import 'dart:async';
import 'dart:typed_data';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:hybrid_logging/hybrid_logging.dart';
import 'package:jni/jni.dart';

import 'jni.dart';
import 'jni.g.dart' as jni;
import 'ml_analyzer.dart';

final class JCameraController
    with TypeLogger, LoggerController
    implements CameraController {
  final jni.LifecycleCameraController jniValue;
  late final StreamController<ZoomState?> _zoomStateChagnedController;
  late final StreamController<bool?> _torchStateChagnedController;
  late jni.Observer<jni.ZoomState> _zoomStateObserver;
  late jni.Observer<JInteger> _torchStateObserver;

  @override
  Stream<ZoomState?> get zoomStateChanged => _zoomStateChagnedController.stream;
  @override
  Stream<bool?> get torchStateChanged => _torchStateChagnedController.stream;

  JCameraController()
      : jniValue = jni.LifecycleCameraController(JNI.context)
          // ..setImageAnalysisOutputImageFormatOnMainThread(
          //     jni.MyImageAnalysis.OUTPUT_IMAGE_FORMAT_RGBA_8888)
          ..setImageAnalysisBackpressureStrategyOnMainThread(
              jni.MyImageAnalysis.STRATEGY_KEEP_ONLY_LATEST)
          ..setImageCaptureModeOnMainThread(
              jni.MyImageCapture.CAPTURE_MODE_MAXIMIZE_QUALITY) {
    _zoomStateChagnedController = StreamController.broadcast(
      onListen: _observeZoomState,
      onCancel: _removeZoomStateObserver,
    );
    _torchStateChagnedController = StreamController.broadcast(
      onListen: _observeTorchState,
      onCancel: _removeTorchStateObserver,
    );
  }

  @override
  Future<bool> checkAuthorization({
    required AuthorizationType type,
  }) async {
    final permissions = type.jniValue;
    if (permissions.length == 0) {
      return true;
    }
    final granted =
        jni.MyPermissionsManager.INSTANCE.checkPermissions(permissions);
    return granted;
  }

  @override
  Future<bool> requestAuthorization({
    required AuthorizationType type,
  }) async {
    final permissions = type.jniValue;
    if (permissions.length == 0) {
      return true;
    }
    final completer = Completer<bool>();
    final callback =
        jni.MyPermissionsManager_MyPermissionsResultCallback.implement(
      jni.$MyPermissionsManager_MyPermissionsResultCallbackImpl(
        onPermissionsResult: (granted) => completer.complete(granted),
      ),
    );
    jni.MyPermissionsManager.INSTANCE.requestPermissions(
      permissions,
      callback,
    );
    final granted = await completer.future;
    return granted;
  }

  @override
  Future<void> bind() async {
    final lifecycleOwner = JNI.activity.castTo(jni.LifecycleOwner.type);
    await jniValue.bindToLifecycleOnMainThread(lifecycleOwner);
  }

  @override
  Future<void> unbind() async {
    await jniValue.unbindOnMainThread();
  }

  @override
  Future<bool> hasCamera(CameraSelector cameraSelector) async {
    final hasCamera =
        await jniValue.hasCameraOnMainThread(cameraSelector.jniValue);
    return hasCamera;
  }

  @override
  Future<void> setCameraSelector(CameraSelector cameraSelector) async {
    await jniValue.setCameraSelectorOnMainThread(cameraSelector.jniValue);
  }

  @override
  Future<bool> isTapToFocusEnabled() async {
    final isTapToFocusEnabled =
        await jniValue.isTapToFocusEnabledOnMainThread();
    return isTapToFocusEnabled;
  }

  @override
  Future<void> setTapToFocusEnabled(bool enabled) async {
    await jniValue.setTapToFocusEnabledOnMainThread(enabled);
  }

  @override
  Future<bool> isPinchToZoomEnabled() async {
    final isPinchToZoomEnabled =
        await jniValue.isPinchToZoomEnabledOnMainThread();
    return isPinchToZoomEnabled;
  }

  @override
  Future<void> setPinchToZoomEnabled(bool enabled) async {
    await jniValue.setPinchToZoomEnabledOnMainThread(enabled);
  }

  @override
  Future<ZoomState?> getZoomState() async {
    final zoomStateData = await jniValue.getZoomStateOnMainThread();
    final zoomState = zoomStateData.getValue();
    return zoomState.dartValue;
  }

  @override
  Future<void> setZoomRatio(double zoomRatio) async {
    final lisentalbeFuture = await jniValue.setZoomRatioOnMainThread(zoomRatio);
    final completer = Completer<void>();
    final executor = jni.ContextCompat.getMainExecutor(JNI.context);
    lisentalbeFuture.addListener(
      jni.Runnable.implement(jni.$RunnableImpl(
        run: () {
          try {
            final futureType = jni.Future.type(JObject.type);
            final future = lisentalbeFuture.castTo(futureType);
            future.get0();
            completer.complete();
          } catch (e) {
            completer.completeError(e);
          }
        },
      )),
      executor,
    );
    await completer.future;
  }

  @override
  Future<void> setLinearZoom(double linearZoom) async {
    final lisentalbeFuture =
        await jniValue.setLinearZoomOnMainThread(linearZoom);
    final completer = Completer<void>();
    final executor = jni.ContextCompat.getMainExecutor(JNI.context);
    lisentalbeFuture.addListener(
      jni.Runnable.implement(jni.$RunnableImpl(
        run: () {
          try {
            final futureType = jni.Future.type(JObject.type);
            final future = lisentalbeFuture.castTo(futureType);
            future.get0();
            completer.complete();
          } catch (e) {
            completer.completeError(e);
          }
        },
      )),
      executor,
    );
    await completer.future;
  }

  @override
  Future<bool?> getTorchState() async {
    final torchStateData = await jniValue.getTorchStateOnMainThread();
    final torchStateValue = torchStateData.getValue();
    final torchState = torchStateValue.isNull
        ? null
        : torchStateValue.intValue() == jni.TorchState.ON;
    return torchState;
  }

  @override
  Future<void> enableTorch(bool torchEnabled) async {
    final lisentalbeFuture =
        await jniValue.enableTorchOnMainThread(torchEnabled);
    final completer = Completer<void>();
    final executor = jni.ContextCompat.getMainExecutor(JNI.context);
    lisentalbeFuture.addListener(
      jni.Runnable.implement(jni.$RunnableImpl(
        run: () {
          try {
            final futureType = jni.Future.type(JObject.type);
            final future = lisentalbeFuture.castTo(futureType);
            future.get0();
            completer.complete();
          } catch (e) {
            completer.completeError(e);
          }
        },
      )),
      executor,
    );
    await completer.future;
  }

  @override
  Future<void> setImageAnalysisAnalyzer(ImageAnalyzer analyzer) async {
    final executor =
        jni.Executors.newSingleThreadExecutor().castTo(jni.Executor.type);
    final jniAanlyzer = analyzer is JMLAnalyzer
        ? analyzer.jniValue
        : jni.MyImageAnalysis_MyAnalyzer.implement(
            jni.$MyImageAnalysis_MyAnalyzerImpl(
              analyze: (imageProxy) {
                analyzer.analyze(imageProxy.dartValue);
              },
            ),
          );
    await jniValue.setImageAnalysisAnalyzerOnMainThread(
      executor,
      jniAanlyzer,
    );
  }

  @override
  Future<void> clearImageAnalysisAnalyzer() async {
    await jniValue.clearImageAnalysisAnalyzerOnMainThread();
  }

  @override
  Future<FlashMode> getImageCaptureFlashMode() async {
    final flashMode = await jniValue.getImageCaptureFlashModeOnMainThread();
    return flashMode.flashMode;
  }

  @override
  Future<void> setImageCaptureFlashMode(FlashMode flashMode) async {
    await jniValue.setImageCaptureFlashModeOnMainThread(flashMode.jniValue);
  }

  @override
  Future<Uint8List> takePictureToMemory() async {
    final completer = Completer<Uint8List>();
    final executor =
        jni.Executors.newSingleThreadExecutor().castTo(jni.Executor.type);
    final callback = jni.MyImageCapture_MyOnImageCapturedCallbackImpl(
        jni.MyImageCapture_MyOnImageCapturedCallback.implement(
            jni.$MyImageCapture_MyOnImageCapturedCallbackImpl(
      onCaptureStarted: () {},
      onCaptureProcessProgressed: (progress) {
        logger.info('onCaptureProcessProgressed $progress.');
      },
      onCaptureSuccess: (image) {
        final memory = image.getPlanes()[0].getBuffer().asUint8List();
        image.close();
        completer.complete(memory);
      },
      onError: (exception) {
        completer.completeError(exception);
      },
      onPostviewBitmapAvailable: (bitmap) {},
    )));
    await jniValue.takePictureToMemoryOnMainThread(
      executor,
      callback.reference,
    );
    final memory = await completer.future;
    return memory;
  }

  @override
  Future<Uri> takePictureToAlbum({
    String? name,
  }) async {
    final contentResolver = JNI.context.getContentResolver();
    final savedCollection = jni.MediaStore_Images_Media.EXTERNAL_CONTENT_URI;
    final displayName = JString.fromString(
        name ?? '${DateTime.timestamp().millisecondsSinceEpoch}');
    final mimeType = JString.fromString('image/jpeg');
    final contentValues = jni.ContentValues()
      ..put(jni.MediaStore_MediaColumns.DISPLAY_NAME, displayName)
      ..put(jni.MediaStore_MediaColumns.MIME_TYPE, mimeType);
    final outputFileOptions = jni.MyImageCapture_MyOutputFileOptions_MyBuilder(
      contentResolver,
      savedCollection,
      contentValues,
    ).build();
    final executor =
        jni.Executors.newSingleThreadExecutor().castTo(jni.Executor.type);
    final completer = Completer<Uri>();
    final imageSavedCallback =
        jni.MyImageCapture_MyOnImageSavedCallback.implement(
            jni.$MyImageCapture_MyOnImageSavedCallbackImpl(
      onCaptureStarted: () {},
      onCaptureProcessProgressed: (progress) {
        logger.info('onCaptureProcessProgressed $progress.');
      },
      onImageSaved: (outputFileResults) {
        final savedUri = outputFileResults.getSavedUri().dartValue;
        completer.complete(savedUri);
      },
      onError: (exception) {
        completer.completeError(exception);
      },
      onPostviewBitmapAvailable: (bitmap) {},
    ));
    await jniValue.takePictureToAlbumOnMainThread(
      outputFileOptions,
      executor,
      imageSavedCallback.reference,
    );
    final savedUri = await completer.future;
    return savedUri;
  }

  void _observeZoomState() async {
    final zoomStateData = await jniValue.getZoomStateOnMainThread();
    final lifecycleOwner = JNI.activity.castTo(jni.LifecycleOwner.type);
    final observer = jni.Observer.implement(jni.$ObserverImpl(
      T: jni.ZoomState.type,
      onChanged: (zoomState) {
        _zoomStateChagnedController.add(zoomState.dartValue);
      },
    ));
    zoomStateData.observeOnMainThread(
      lifecycleOwner,
      observer.T,
      observer.reference,
    );
    _zoomStateObserver = observer;
  }

  void _removeZoomStateObserver() async {
    final zoomStateData = await jniValue.getZoomStateOnMainThread();
    final observer = _zoomStateObserver;
    zoomStateData.removeObserverOnMainThread(
      observer.T,
      observer.reference,
    );
  }

  void _observeTorchState() async {
    final trochStateData = await jniValue.getTorchStateOnMainThread();
    final lifecycleOwner = JNI.activity.castTo(jni.LifecycleOwner.type);
    final observer = jni.Observer.implement(jni.$ObserverImpl(
      T: JInteger.type,
      onChanged: (torchStateValue) {
        final torchState = torchStateValue.isNull
            ? null
            : torchStateValue.intValue() == jni.TorchState.ON;
        _torchStateChagnedController.add(torchState);
      },
    ));
    trochStateData.observeOnMainThread(
      lifecycleOwner,
      observer.T,
      observer.reference,
    );
    _torchStateObserver = observer;
  }

  void _removeTorchStateObserver() async {
    final torchStateData = await jniValue.getTorchStateOnMainThread();
    final observer = _torchStateObserver;
    torchStateData.removeObserverOnMainThread(
      observer.T,
      observer.reference,
    );
  }
}
