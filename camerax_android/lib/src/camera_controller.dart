import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:collection/collection.dart';
import 'package:hybrid_logging/hybrid_logging.dart';
import 'package:jni/jni.dart';

import 'jni.dart';
import 'jni.g.dart' as jni;
import 'ml_analyzer.dart';
import 'recording.dart';

final class MyCameraController
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

  MyCameraController() : jniValue = _createLifecycleCameraController() {
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
    final lifecycleOwner = MyJNI.activity.castTo(jni.LifecycleOwner.type);
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
  Future<CameraSelector> getCameraSelector() async {
    final cameraSelector = await jniValue.getCameraSelectorOnMainThread();
    return cameraSelector.dartValue;
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
    final listenableFuture = await jniValue.setZoomRatioOnMainThread(zoomRatio);
    final completer = Completer<void>();
    final executor = jni.ContextCompat.getMainExecutor(MyJNI.context);
    listenableFuture.addListener(
      jni.Runnable.implement(
        jni.$RunnableImpl(
          run: () {
            try {
              final futureType = jni.Future.type(listenableFuture.V);
              final future = listenableFuture.castTo(futureType);
              future.get0();
              completer.complete();
            } catch (e) {
              completer.completeError(e);
            }
          },
        ),
      ),
      executor,
    );
    await completer.future;
  }

  @override
  Future<void> setLinearZoom(double linearZoom) async {
    final listenableFuture =
        await jniValue.setLinearZoomOnMainThread(linearZoom);
    final completer = Completer<void>();
    final executor = jni.ContextCompat.getMainExecutor(MyJNI.context);
    listenableFuture.addListener(
      jni.Runnable.implement(
        jni.$RunnableImpl(
          run: () {
            try {
              final futureType = jni.Future.type(listenableFuture.V);
              final future = listenableFuture.castTo(futureType);
              future.get0();
              completer.complete();
            } catch (e) {
              completer.completeError(e);
            }
          },
        ),
      ),
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
    final listenableFuture =
        await jniValue.enableTorchOnMainThread(torchEnabled);
    final completer = Completer<void>();
    final executor = jni.ContextCompat.getMainExecutor(MyJNI.context);
    listenableFuture.addListener(
      jni.Runnable.implement(
        jni.$RunnableImpl(
          run: () {
            try {
              final futureType = jni.Future.type(listenableFuture.V);
              final future = listenableFuture.castTo(futureType);
              future.get0();
              completer.complete();
            } catch (e) {
              completer.completeError(e);
            }
          },
        ),
      ),
      executor,
    );
    await completer.future;
  }

  @override
  Future<void> setImageAnalysisAnalyzer(ImageAnalyzer analyzer) async {
    if (analyzer is MyMLAnalyzer) {
      // The MLKit only support YUV_420_888
      await jniValue.setImageAnalysisOutputImageFormatOnMainThread(
          jni.MyImageAnalysis.OUTPUT_IMAGE_FORMAT_YUV_420_888);
    } else {
      await jniValue.setImageAnalysisOutputImageFormatOnMainThread(
          jni.MyImageAnalysis.OUTPUT_IMAGE_FORMAT_RGBA_8888);
    }
    final resolutionSelector = jni.ResolutionSelector_Builder()
        .setAspectRatioStrategy(
            jni.AspectRatioStrategy.RATIO_16_9_FALLBACK_AUTO_STRATEGY)
        .setResolutionStrategy(
            jni.ResolutionStrategy.HIGHEST_AVAILABLE_STRATEGY)
        .build();
    await jniValue
        .setImageAnalysisResolutionSelectorOnMainThread(resolutionSelector);
    final executor =
        jni.Executors.newSingleThreadExecutor().castTo(jni.Executor.type);
    await jniValue.setImageAnalysisAnalyzerOnMainThread(
      executor,
      analyzer.jniValue,
    );
  }

  @override
  Future<void> clearImageAnalysisAnalyzer() async {
    await jniValue.clearImageAnalysisAnalyzerOnMainThread();
  }

  @override
  Future<FlashMode> getImageCaptureFlashMode() async {
    final flashMode = await jniValue.getImageCaptureFlashModeOnMainThread();
    return flashMode.dartFlashMode;
  }

  @override
  Future<void> setImageCaptureFlashMode(FlashMode flashMode) async {
    await jniValue.setImageCaptureFlashModeOnMainThread(flashMode.jniValue);
  }

  @override
  Future<ImageProxy> takePictureToMemory() async {
    final completer = Completer<ImageProxy>();
    final executor = jni.ContextCompat.getMainExecutor(MyJNI.context);
    final callback = jni.MyImageCapture_MyOnImageCapturedCallbackImpl(
      jni.MyImageCapture_MyOnImageCapturedCallback.implement(
        jni.$MyImageCapture_MyOnImageCapturedCallbackImpl(
          onCaptureStarted: () {
            logger.info('onCaptureStarted.');
          },
          onCaptureProcessProgressed: (progress) {
            logger.info('onCaptureProcessProgressed $progress.');
          },
          onCaptureSuccess: (imageProxy) {
            logger.info('onCaptureSuccess.');
            completer.complete(imageProxy.dartValue);
          },
          onError: (exception) {
            logger.info('onError $exception.');
            completer.completeError(exception);
          },
          onPostviewBitmapAvailable: (bitmap) {
            logger.info('onPostviewBitmapAvailable.');
          },
        ),
      ),
    );
    await jniValue.takePictureToMemoryOnMainThread(
      executor,
      callback,
    );
    final imageProxy = await completer.future;
    return imageProxy;
  }

  @override
  Future<Uri> takePictureToAlbum({
    String? name,
  }) async {
    final completer = Completer<Uri>();
    final contentResolver = MyJNI.context.getContentResolver();
    final savedCollection = jni.MediaStore_Images_Media.EXTERNAL_CONTENT_URI;
    final relativePath = JString.fromString(
        '${jni.Environment.DIRECTORY_DCIM}/${MyJNI.context.getPackageName()}');
    final displayName = JString.fromString(
        name ?? '${DateTime.timestamp().millisecondsSinceEpoch}');
    final mimeType = JString.fromString('image/jpeg');
    final contentValues = jni.ContentValues()
      ..put(jni.MediaStore_MediaColumns.RELATIVE_PATH, relativePath)
      ..put(jni.MediaStore_MediaColumns.DISPLAY_NAME, displayName)
      ..put(jni.MediaStore_MediaColumns.MIME_TYPE, mimeType);
    final outputFileOptions = jni.MyImageCapture_MyOutputFileOptions_MyBuilder(
      contentResolver,
      savedCollection,
      contentValues,
    ).build();
    final executor = jni.ContextCompat.getMainExecutor(MyJNI.context);
    final imageSavedCallback = jni.MyImageCapture_MyOnImageSavedCallbackImpl(
      jni.MyImageCapture_MyOnImageSavedCallback.implement(
        jni.$MyImageCapture_MyOnImageSavedCallbackImpl(
          onCaptureStarted: () {
            logger.info('onCaptureStarted.');
          },
          onCaptureProcessProgressed: (progress) {
            logger.info('onCaptureProcessProgressed $progress.');
          },
          onImageSaved: (outputFileResults) {
            logger.info('onImageSaved.');
            final savedUri = outputFileResults.getSavedUri().dartValue;
            completer.complete(savedUri);
          },
          onError: (exception) {
            logger.info('onError $exception.');
            completer.completeError(exception);
          },
          onPostviewBitmapAvailable: (bitmap) {
            logger.info('onPostviewBitmapAvailable.');
          },
        ),
      ),
    );
    await jniValue.takePictureToAlbumOnMainThread(
      outputFileOptions,
      executor,
      imageSavedCallback,
    );
    final savedUri = await completer.future;
    return savedUri;
  }

  @override
  Future<Recording> startRecording({
    String? name,
    required bool enableAudio,
    required VideoRecordEventCallback listener,
  }) async {
    await jniValue
        .setEnabledUseCasesOnMainThread(jni.CameraController.VIDEO_CAPTURE);
    final contentResolver = MyJNI.context.getContentResolver();
    final collectionUri = jni.MediaStore_Video_Media.EXTERNAL_CONTENT_URI;
    final relativePath = JString.fromString(
        '${jni.Environment.DIRECTORY_DCIM}/${MyJNI.context.getPackageName()}');
    final displayName = JString.fromString(
        name ?? '${DateTime.timestamp().millisecondsSinceEpoch}');
    final mimeType = JString.fromString('video/mp4');
    final contentValues = jni.ContentValues()
      ..put(jni.MediaStore_MediaColumns.RELATIVE_PATH, relativePath)
      ..put(jni.MediaStore_MediaColumns.DISPLAY_NAME, displayName)
      ..put(jni.MediaStore_MediaColumns.MIME_TYPE, mimeType);
    final outputOptions =
        jni.MyMediaStoreOutputOptions_MyBuilder(contentResolver, collectionUri)
            .setContentValues(contentValues)
            .build();
    final audioConfig = jni.AudioConfig.create(enableAudio);
    final executor = jni.ContextCompat.getMainExecutor(MyJNI.context);
    final recording = await jniValue.startRecordingOnMainThread(
      outputOptions,
      audioConfig,
      executor,
      jni.Consumer.implement(
        jni.$ConsumerImpl(
          T: jni.VideoRecordEvent.type,
          accept: (event) {
            final isInstanceOfStatus = Jni.env.IsInstanceOf(
              event.reference.pointer,
              jni.VideoRecordEvent_Status.type.jClass.reference.pointer,
            );
            if (isInstanceOfStatus) {
              return;
            }
            final isInstanceOfFinalize = Jni.env.IsInstanceOf(
              event.reference.pointer,
              jni.VideoRecordEvent_Finalize.type.jClass.reference.pointer,
            );
            if (isInstanceOfFinalize) {
              jniValue.setEnabledUseCasesOnMainThread(
                  jni.CameraController.IMAGE_CAPTURE |
                      jni.CameraController.IMAGE_ANALYSIS);
            }
            listener(event.dartValue);
          },
        ),
      ),
    );
    return MyRecording(recording);
  }

  void _observeZoomState() async {
    final zoomStateData = await jniValue.getZoomStateOnMainThread();
    final lifecycleOwner = MyJNI.activity.castTo(jni.LifecycleOwner.type);
    final observer = jni.Observer.implement(
      jni.$ObserverImpl(
        T: jni.ZoomState.type,
        onChanged: (zoomState) {
          _zoomStateChagnedController.add(zoomState.dartValue);
        },
      ),
    );
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
    final lifecycleOwner = MyJNI.activity.castTo(jni.LifecycleOwner.type);
    final observer = jni.Observer.implement(
      jni.$ObserverImpl(
        T: JInteger.type,
        onChanged: (torchStateValue) {
          final torchState = torchStateValue.isNull
              ? null
              : torchStateValue.intValue() == jni.TorchState.ON;
          _torchStateChagnedController.add(torchState);
        },
      ),
    );
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

jni.LifecycleCameraController _createLifecycleCameraController() {
  return jni.LifecycleCameraController(MyJNI.context)
    ..setImageAnalysisBackpressureStrategyOnMainThread(
        jni.MyImageAnalysis.STRATEGY_KEEP_ONLY_LATEST)
    ..setImageCaptureModeOnMainThread(
        jni.MyImageCapture.CAPTURE_MODE_MAXIMIZE_QUALITY);
}
