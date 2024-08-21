import 'dart:async';

import 'package:camerax_android/src/core.dart';
import 'package:camerax_android/src/jni.dart' as jni;
import 'package:camerax_android/src/video.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:hybrid_logging/hybrid_logging.dart';
import 'package:jni/jni.dart';

final class MyCameraController
    with TypeLogger, LoggerController
    implements CameraController {
  final jni.LifecycleCameraController jniValue;

  late final StreamController<ZoomState?> _zoomStateChagnedController;
  late final StreamController<bool?> _torchStateChagnedController;

  late jni.Observer<jni.ZoomState> _jniZoomStateObserver;
  late jni.Observer<JInteger> _jniTorchStateObserver;

  @override
  Stream<ZoomState?> get zoomStateChanged => _zoomStateChagnedController.stream;
  @override
  Stream<bool?> get torchStateChanged => _torchStateChagnedController.stream;

  MyCameraController()
      : jniValue = jni.LifecycleCameraController(jni.MyJNI.context) {
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
    final jniPermissions = type.jniValue;
    if (jniPermissions.length == 0) {
      return true;
    }
    final granted =
        jni.MyPermissionsManager.INSTANCE.checkPermissions(jniPermissions);
    return granted;
  }

  @override
  Future<bool> requestAuthorization({
    required AuthorizationType type,
  }) async {
    final jniPermissions = type.jniValue;
    if (jniPermissions.length == 0) {
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
      jniPermissions,
      callback,
    );
    final granted = await completer.future;
    return granted;
  }

  @override
  Future<void> bind() async {
    final jniLifecycleOwner =
        jni.MyJNI.activity.castTo(jni.LifecycleOwner.type);
    await jniValue.bindToLifecycleOnMainThread(jniLifecycleOwner);
  }

  @override
  Future<void> unbind() async {
    await jniValue.unbindOnMainThread();
  }

  @override
  Future<bool> hasCamera(CameraSelector cameraSelector) async {
    if (cameraSelector is! MyCameraSelector) {
      throw TypeError();
    }
    final hasCamera =
        await jniValue.hasCameraOnMainThread(cameraSelector.jniValue);
    return hasCamera;
  }

  @override
  Future<CameraSelector> getCameraSelector() async {
    final jniCameraSelector = await jniValue.getCameraSelectorOnMainThread();
    return MyCameraSelector.jni(jniCameraSelector);
  }

  @override
  Future<void> setCameraSelector(CameraSelector cameraSelector) async {
    if (cameraSelector is! MyCameraSelector) {
      throw TypeError();
    }
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
    final jniZoomStateData = await jniValue.getZoomStateOnMainThread();
    final jniZoomState = jniZoomStateData.getValue();
    final zoomState = jniZoomState.isNull ? null : jniZoomState.dartValue;
    return zoomState;
  }

  @override
  Future<void> setZoomRatio(double zoomRatio) async {
    final jniFuture = await jniValue.setZoomRatioOnMainThread(zoomRatio);
    final completer = Completer<void>();
    final jniExecutor = jni.ContextCompat.getMainExecutor(jni.MyJNI.context);
    jniFuture.addListener(
      jni.Runnable.implement(
        jni.$RunnableImpl(
          run: () {
            try {
              final jniType = jni.Future.type(jniFuture.V);
              final jniTypedFuture = jniFuture.castTo(jniType);
              jniTypedFuture.get0();
              completer.complete();
            } catch (e) {
              completer.completeError(e);
            }
          },
        ),
      ),
      jniExecutor,
    );
    await completer.future;
  }

  @override
  Future<void> setLinearZoom(double linearZoom) async {
    final jniFuture = await jniValue.setLinearZoomOnMainThread(linearZoom);
    final completer = Completer<void>();
    final jniExecutor = jni.ContextCompat.getMainExecutor(jni.MyJNI.context);
    jniFuture.addListener(
      jni.Runnable.implement(
        jni.$RunnableImpl(
          run: () {
            try {
              final jniType = jni.Future.type(jniFuture.V);
              final jniTypedFuture = jniFuture.castTo(jniType);
              jniTypedFuture.get0();
              completer.complete();
            } catch (e) {
              completer.completeError(e);
            }
          },
        ),
      ),
      jniExecutor,
    );
    await completer.future;
  }

  @override
  Future<bool?> getTorchState() async {
    final jniTorchStateData = await jniValue.getTorchStateOnMainThread();
    final jniTorchState = jniTorchStateData.getValue();
    final torchState = jniTorchState.isNull
        ? null
        : jniTorchState.intValue() == jni.TorchState.ON;
    return torchState;
  }

  @override
  Future<void> enableTorch(bool enabled) async {
    final jniFuture = await jniValue.enableTorchOnMainThread(enabled);
    final completer = Completer<void>();
    final jniExecutor = jni.ContextCompat.getMainExecutor(jni.MyJNI.context);
    jniFuture.addListener(
      jni.Runnable.implement(
        jni.$RunnableImpl(
          run: () {
            try {
              final jniType = jni.Future.type(jniFuture.V);
              final jniTypedFuture = jniFuture.castTo(jniType);
              jniTypedFuture.get0();
              completer.complete();
            } catch (e) {
              completer.completeError(e);
            }
          },
        ),
      ),
      jniExecutor,
    );
    await completer.future;
  }

  @override
  Future<ResolutionSelector?> getPreviewResolutionSelector() async {
    final jniResolutionSelector =
        await jniValue.getPreviewResolutionSelectorOnMainThread();
    if (jniResolutionSelector.isNull) {
      return null;
    }
    return MyResolutionSelector.jni(jniResolutionSelector);
  }

  @override
  Future<void> setPreviewResolutionSelector(
      ResolutionSelector? resolutionSelector) async {
    if (resolutionSelector == null) {
      final jniResolutionSelector =
          jni.ResolutionSelector.fromReference(jNullReference);
      await jniValue
          .setPreviewResolutionSelectorOnMainThread(jniResolutionSelector);
    } else {
      if (resolutionSelector is! MyResolutionSelector) {
        throw TypeError();
      }
      await jniValue.setPreviewResolutionSelectorOnMainThread(
          resolutionSelector.jniValue);
    }
  }

  @override
  Future<FlashMode> getImageCaptureFlashMode() async {
    final jniFlashMode = await jniValue.getImageCaptureFlashModeOnMainThread();
    return jniFlashMode.dartFlashMode;
  }

  @override
  Future<void> setImageCaptureFlashMode(FlashMode flashMode) async {
    await jniValue.setImageCaptureFlashModeOnMainThread(flashMode.jniValue);
  }

  @override
  Future<CaptureMode> getImageCaptureMode() async {
    final jniCaptureMode = await jniValue.getImageCaptureModeOnMainThread();
    return jniCaptureMode.dartCaptureMode;
  }

  @override
  Future<void> setImageCaptureMode(CaptureMode captureMode) async {
    await jniValue.setImageCaptureModeOnMainThread(captureMode.jniValue);
  }

  @override
  Future<ResolutionSelector?> getImageCaptureResolutionSelector() async {
    final jniResolutionSelector =
        await jniValue.getImageCaptureResolutionSelectorOnMainThread();
    if (jniResolutionSelector.isNull) {
      return null;
    }
    return MyResolutionSelector.jni(jniResolutionSelector);
  }

  @override
  Future<void> setImageCaptureResolutionSelector(
      ResolutionSelector? resolutionSelector) async {
    if (resolutionSelector == null) {
      final jniResolutionSelector =
          jni.ResolutionSelector.fromReference(jNullReference);
      await jniValue
          .setImageCaptureResolutionSelectorOnMainThread(jniResolutionSelector);
    } else {
      if (resolutionSelector is! MyResolutionSelector) {
        throw TypeError();
      }
      await jniValue.setImageCaptureResolutionSelectorOnMainThread(
          resolutionSelector.jniValue);
    }
  }

  @override
  Future<Uri> takePicture({
    required Uri uri,
  }) async {
    final completer = Completer<Uri>();
    final jniPath = uri.toFilePath().toJString();
    final jniFile = jni.File(jniPath);
    final jniOutputFileOptions =
        jni.MyImageCapture_MyOutputFileOptions_MyBuilder(jniFile).build();
    final jniExecutor = jni.ContextCompat.getMainExecutor(jni.MyJNI.context);
    final jniImageSavedCallback = jni.MyImageCapture_MyOnImageSavedCallbackImpl(
      jni.MyImageCapture_MyOnImageSavedCallback.implement(
        jni.$MyImageCapture_MyOnImageSavedCallbackImpl(
          onCaptureStarted: () {
            logger.info('onCaptureStarted.');
          },
          onCaptureProcessProgressed: (progress) {
            logger.info('onCaptureProcessProgressed $progress.');
          },
          onImageSaved: (jniOutputFileResults) {
            logger.info('onImageSaved.');
            final savedUri = jniOutputFileResults.getSavedUri().dartValue;
            completer.complete(savedUri);
          },
          onError: (jniException) {
            logger.info('onError $jniException.');
            completer.completeError(jniException);
          },
          onPostviewBitmapAvailable: (jniBitmap) {
            logger.info('onPostviewBitmapAvailable.');
          },
        ),
      ),
    );
    await jniValue.takePictureOnMainThread(
      jniOutputFileOptions,
      jniExecutor,
      jniImageSavedCallback,
    );
    final savedUri = await completer.future;
    return savedUri;
  }

  @override
  Future<DynamicRange> getVideoCaptureDynamicRange() async {
    final jniDynamicRange =
        await jniValue.getVideoCaptureDynamicRangeOnMainThread();
    return jniDynamicRange.dartValue;
  }

  @override
  Future<void> setVideoCaptureDynamicRange(DynamicRange dynamicRange) async {
    await jniValue
        .setVideoCaptureDynamicRangeOnMainThread(dynamicRange.jniValue);
  }

  @override
  Future<MirrorMode> getVideoCaptureMirrorMode() async {
    final jniMirrorMode =
        await jniValue.getVideoCaptureMirrorModeOnMainThread();
    return jniMirrorMode.dartMirrorMode;
  }

  @override
  Future<void> setVideoCaptureMirrorMode(MirrorMode mirrorMode) async {
    await jniValue.setVideoCaptureMirrorModeOnMainThread(mirrorMode.jniValue);
  }

  @override
  Future<QualitySelector> getVideoCaptureQualitySelector() async {
    final jniQualitySelector =
        await jniValue.getVideoCaptureQualitySelectorOnMainThread();
    return MyQualitySelector.jni(jniQualitySelector);
  }

  @override
  Future<void> setVideoCaptureQualitySelector(
      QualitySelector qualitySelector) async {
    if (qualitySelector is! MyQualitySelector) {
      throw TypeError();
    }
    await jniValue
        .setVideoCaptureQualitySelectorOnMainThread(qualitySelector.jniValue);
  }

  @override
  Future<bool> isRecording() async {
    final isRecording = await jniValue.isRecordingOnMainThread();
    return isRecording;
  }

  @override
  Future<Recording> startRecording({
    required Uri uri,
    required bool enableAudio,
    required VideoRecordEventCallback listener,
  }) async {
    await jniValue
        .setEnabledUseCasesOnMainThread(jni.CameraController.VIDEO_CAPTURE);
    final jniPath = uri.toFilePath().toJString();
    final jniFile = jni.File(jniPath);
    final jniOutputOptions = jni.MyFileOutputOptions_MyBuilder(jniFile).build();
    final jniAudioConfig = jni.AudioConfig.create(enableAudio);
    final jniExecutor = jni.ContextCompat.getMainExecutor(jni.MyJNI.context);
    final jniRecording = await jniValue.startRecordingOnMainThread(
      jniOutputOptions,
      jniAudioConfig,
      jniExecutor,
      jni.Consumer.implement(
        jni.$ConsumerImpl(
          T: jni.VideoRecordEvent.type,
          accept: (jniEvent) {
            final isInstanceOfStatus = Jni.env.IsInstanceOf(
              jniEvent.reference.pointer,
              jni.VideoRecordEvent_Status.type.jClass.reference.pointer,
            );
            if (isInstanceOfStatus) {
              return;
            }
            final isInstanceOfFinalize = Jni.env.IsInstanceOf(
              jniEvent.reference.pointer,
              jni.VideoRecordEvent_Finalize.type.jClass.reference.pointer,
            );
            if (isInstanceOfFinalize) {
              jniValue.setEnabledUseCasesOnMainThread(
                  jni.CameraController.IMAGE_CAPTURE |
                      jni.CameraController.IMAGE_ANALYSIS);
            }
            listener(jniEvent.dartValue);
          },
        ),
      ),
    );
    return MyRecording.jni(jniRecording);
  }

  @override
  Future<BackpressureStrategy> getImageAnalysisBackpressureStrategy() async {
    final jniBackpressureStrategy =
        await jniValue.getImageAnalysisBackpressureStrategyOnMainThread();
    return jniBackpressureStrategy.dartBackpressureStrategy;
  }

  @override
  Future<void> setImageAnalysisBackpressureStrategy(
      BackpressureStrategy strategy) async {
    await jniValue
        .setImageAnalysisBackpressureStrategyOnMainThread(strategy.jniValue);
  }

  @override
  Future<int> getImageAnalysisImageQueueDepth() async {
    final imageQueueDepth =
        await jniValue.getImageAnalysisImageQueueDepthOnMainThread();
    return imageQueueDepth;
  }

  @override
  Future<void> setImageAnalysisImageQueueDepth(int imageQueueDepth) async {
    await jniValue.setImageAnalysisImageQueueDepthOnMainThread(imageQueueDepth);
  }

  @override
  Future<ImageFormat> getImageAnalysisOutputImageFormat() async {
    final jniOutputImageFormat =
        await jniValue.getImageAnalysisOutputImageFormatOnMainThread();
    return jniOutputImageFormat.dartOutputImageFormat;
  }

  @override
  Future<void> setImageAnalysisOutputImageFormat(
      ImageFormat outputImageFormat) async {
    await jniValue.setImageAnalysisOutputImageFormatOnMainThread(
        outputImageFormat.jniValue);
  }

  @override
  Future<ResolutionSelector?> getImageAnalysisResolutionSelector() async {
    final jniResolutionSelector =
        await jniValue.getImageAnalysisResolutionSelectorOnMainThread();
    if (jniResolutionSelector.isNull) {
      return null;
    }
    return MyResolutionSelector.jni(jniResolutionSelector);
  }

  @override
  Future<void> setImageAnalysisResolutionSelector(
      ResolutionSelector? resolutionSelector) async {
    if (resolutionSelector == null) {
      final jniResolutionSelector =
          jni.ResolutionSelector.fromReference(jNullReference);
      await jniValue.setImageAnalysisResolutionSelectorOnMainThread(
          jniResolutionSelector);
    } else {
      if (resolutionSelector is! MyResolutionSelector) {
        throw TypeError();
      }
      await jniValue.setImageAnalysisResolutionSelectorOnMainThread(
          resolutionSelector.jniValue);
    }
  }

  @override
  Future<void> setImageAnalysisAnalyzer(Analyzer analyzer) async {
    final jniExecutor =
        jni.Executors.newSingleThreadExecutor().castTo(jni.Executor.type);
    await jniValue.setImageAnalysisAnalyzerOnMainThread(
      jniExecutor,
      analyzer.jniValue,
    );
  }

  @override
  Future<void> clearImageAnalysisAnalyzer() async {
    await jniValue.clearImageAnalysisAnalyzerOnMainThread();
  }

  void _observeZoomState() async {
    final jniZoomStateData = await jniValue.getZoomStateOnMainThread();
    final jniLifecycleOwner =
        jni.MyJNI.activity.castTo(jni.LifecycleOwner.type);
    final jniObserver = jni.Observer.implement(
      jni.$ObserverImpl(
        T: jni.ZoomState.type,
        onChanged: (jniZoomState) {
          final zoomState = jniZoomState.isNull ? null : jniZoomState.dartValue;
          _zoomStateChagnedController.add(zoomState);
        },
      ),
    );
    jniZoomStateData.observeOnMainThread(
      jniLifecycleOwner,
      jniObserver.T,
      jniObserver.reference,
    );
    _jniZoomStateObserver = jniObserver;
  }

  void _removeZoomStateObserver() async {
    final jniZoomStateData = await jniValue.getZoomStateOnMainThread();
    final jniObserver = _jniZoomStateObserver;
    jniZoomStateData.removeObserverOnMainThread(
      jniObserver.T,
      jniObserver.reference,
    );
  }

  void _observeTorchState() async {
    final jniTrochStateData = await jniValue.getTorchStateOnMainThread();
    final jniLifecycleOwner =
        jni.MyJNI.activity.castTo(jni.LifecycleOwner.type);
    final jniObserver = jni.Observer.implement(
      jni.$ObserverImpl(
        T: JInteger.type,
        onChanged: (jniTorchState) {
          final torchState = jniTorchState.isNull
              ? null
              : jniTorchState.intValue() == jni.TorchState.ON;
          _torchStateChagnedController.add(torchState);
        },
      ),
    );
    jniTrochStateData.observeOnMainThread(
      jniLifecycleOwner,
      jniObserver.T,
      jniObserver.reference,
    );
    _jniTorchStateObserver = jniObserver;
  }

  void _removeTorchStateObserver() async {
    final jniTorchStateData = await jniValue.getTorchStateOnMainThread();
    final jniObserver = _jniTorchStateObserver;
    jniTorchStateData.removeObserverOnMainThread(
      jniObserver.T,
      jniObserver.reference,
    );
  }
}
