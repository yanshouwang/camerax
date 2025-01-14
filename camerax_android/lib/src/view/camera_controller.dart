import 'dart:async';

import 'package:camerax_android/src/core.dart';
import 'package:camerax_android/src/jni.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;
// import 'package:jni/jni.dart' as $native;

final class CameraController extends $base.CameraController {
  final $native.LifecycleCameraController obj;

  late final StreamController<$base.ZoomState> _zoomStateChagnedController;
  late final StreamController<$base.TorchState> _torchStateChagnedController;

  // late $native.Observer<$native.ZoomState> _zoomStateObserverObj;
  // late $native.Observer<$native.JInteger> _torchStateObserverObj;

  // jni.Recording? _jniRecording;

  CameraController.$native(this.obj) : super.impl() {
    _zoomStateChagnedController = StreamController.broadcast(
      onListen: _onListenZoomState,
      onCancel: _onCancelZoomState,
    );
    _torchStateChagnedController = StreamController.broadcast(
      onListen: _onListenTorchState,
      onCancel: _onCancelTorchState,
    );
  }

  factory CameraController() {
    final obj = $native.LifecycleCameraController($native.context);
    return CameraController.$native(obj);
  }

  @override
  Stream<$base.ZoomState> get zoomStateChanged =>
      _zoomStateChagnedController.stream;
  @override
  Stream<$base.TorchState> get torchStateChanged =>
      _torchStateChagnedController.stream;

  @override
  Future<void> initialize() async {
    await obj.initialize();
  }

  @override
  Future<$base.CameraSelector> getCameraSelector() async {
    final cameraSelectorObj = await obj.getCameraSelector();
    return CameraSelector.$native(cameraSelectorObj);
  }

  @override
  Future<void> setCameraSelector($base.CameraSelector cameraSelector) async {
    if (cameraSelector is! CameraSelector) {
      throw TypeError();
    }
    await obj.setCameraSelector(cameraSelector.obj);
  }

  @override
  Future<void> bind() async {
    final lifecycleOwnerObj = $native.activity.as($native.LifecycleOwner.type);
    await obj.bindToLifecycle(lifecycleOwnerObj);
  }

  @override
  Future<void> unbind() async {
    await obj.unbind();
  }

  @override
  Future<bool> hasCamera($base.CameraSelector cameraSelector) async {
    if (cameraSelector is! CameraSelector) {
      throw TypeError();
    }
    final hasCameraObj = await obj.hasCamera(cameraSelector.obj);
    return hasCameraObj.booleanValue(
      releaseOriginal: true,
    );
  }

  @override
  Future<bool> isTapToFocusEnabled() async {
    final isTapToFocusEnabledObj = await obj.isTapToFocusEnabled();
    return isTapToFocusEnabledObj.booleanValue(
      releaseOriginal: true,
    );
  }

  @override
  Future<void> setTapToFocusEnabled(bool enabled) async {
    await obj.setTapToFocusEnabled(enabled);
  }

  @override
  Future<bool> isPinchToZoomEnabled() async {
    final isPinchZoomEnabledObj = await obj.isPinchToZoomEnabled();
    return isPinchZoomEnabledObj.booleanValue(
      releaseOriginal: true,
    );
  }

  @override
  Future<void> setPinchToZoomEnabled(bool enabled) async {
    await obj.setPinchToZoomEnabled(enabled);
  }

  @override
  Future<$base.ZoomState?> getZoomState() async {
    final dataObj = await this.obj.getZoomState();
    final obj = dataObj.getValue();
    return obj == null
        ? null
        : $base.ZoomState(
            minZoomRatio: obj.getMinZoomRatio(),
            maxZoomRatio: obj.getMaxZoomRatio(),
            zoomRatio: obj.getZoomRatio(),
            linearZoom: obj.getLinearZoom(),
          );
  }

  @override
  Future<void> setZoomRatio(double zoomRatio) async {
    await obj.setZoomRatio(zoomRatio);
  }

  @override
  Future<void> setLinearZoom(double linearZoom) async {
    await obj.setLinearZoom(linearZoom);
  }

  @override
  Future<$base.TorchState?> getTorchState() async {
    throw UnimplementedError();
    // final jniTorchStateData = await obj.getTorchStateOnMainThread();
    // final jniTorchState = jniTorchStateData.getValue();
    // final torchState = jniTorchState.isNull
    //     ? null
    //     : jniTorchState.intValue() == jni.TorchState.ON;
    // return torchState;
  }

  @override
  Future<void> enableTorch(bool enabled) async {
    throw UnimplementedError();
    // final jniFuture = await obj.enableTorchOnMainThread(enabled);
    // final completer = Completer<void>();
    // final jniExecutor = jni.ContextCompat.getMainExecutor(jni.MyJNI.context);
    // jniFuture.addListener(
    //   jni.Runnable.implement(
    //     jni.$RunnableImpl(
    //       run: () {
    //         try {
    //           final jniType = jni.Future.type(jniFuture.V);
    //           final jniTypedFuture = jniFuture.castTo(jniType);
    //           jniTypedFuture.get0();
    //           completer.complete();
    //         } catch (e) {
    //           completer.completeError(e);
    //         }
    //       },
    //     ),
    //   ),
    //   jniExecutor,
    // );
    // await completer.future;
  }

  @override
  Future<$base.ResolutionSelector?> getPreviewResolutionSelector() async {
    throw UnimplementedError();
    // final jniResolutionSelector =
    //     await obj.getPreviewResolutionSelectorOnMainThread();
    // if (jniResolutionSelector.isNull) {
    //   return null;
    // }
    // return MyResolutionSelector.jni(jniResolutionSelector);
  }

  @override
  Future<void> setPreviewResolutionSelector(
      $base.ResolutionSelector? resolutionSelector) async {
    throw UnimplementedError();
    // if (resolutionSelector == null) {
    //   final jniResolutionSelector =
    //       jni.ResolutionSelector.fromReference(jNullReference);
    //   await obj.setPreviewResolutionSelectorOnMainThread(jniResolutionSelector);
    // } else {
    //   if (resolutionSelector is! MyResolutionSelector) {
    //     throw TypeError();
    //   }
    //   await obj.setPreviewResolutionSelectorOnMainThread(
    //       resolutionSelector.jniValue);
    // }
  }

  @override
  Future<$base.FlashMode> getImageCaptureFlashMode() async {
    throw UnimplementedError();
    // final jniFlashMode = await obj.getImageCaptureFlashModeOnMainThread();
    // return jniFlashMode.dartFlashMode;
  }

  @override
  Future<void> setImageCaptureFlashMode($base.FlashMode flashMode) async {
    throw UnimplementedError();
    // await obj.setImageCaptureFlashModeOnMainThread(flashMode.jniValue);
  }

  @override
  Future<$base.CaptureMode> getImageCaptureMode() async {
    throw UnimplementedError();
    // final jniCaptureMode = await obj.getImageCaptureModeOnMainThread();
    // return jniCaptureMode.dartCaptureMode;
  }

  @override
  Future<void> setImageCaptureMode($base.CaptureMode captureMode) async {
    throw UnimplementedError();
    // await obj.setImageCaptureModeOnMainThread(captureMode.jniValue);
  }

  @override
  Future<$base.ResolutionSelector?> getImageCaptureResolutionSelector() async {
    throw UnimplementedError();
    // final jniResolutionSelector =
    //     await obj.getImageCaptureResolutionSelectorOnMainThread();
    // if (jniResolutionSelector.isNull) {
    //   return null;
    // }
    // return MyResolutionSelector.jni(jniResolutionSelector);
  }

  @override
  Future<void> setImageCaptureResolutionSelector(
      $base.ResolutionSelector? resolutionSelector) async {
    throw UnimplementedError();
    // if (resolutionSelector == null) {
    //   final jniResolutionSelector =
    //       jni.ResolutionSelector.fromReference(jNullReference);
    //   await obj
    //       .setImageCaptureResolutionSelectorOnMainThread(jniResolutionSelector);
    // } else {
    //   if (resolutionSelector is! MyResolutionSelector) {
    //     throw TypeError();
    //   }
    //   await obj.setImageCaptureResolutionSelectorOnMainThread(
    //       resolutionSelector.jniValue);
    // }
  }

  @override
  Future<void> takePictureToMemory({
    $base.CaptureStartedCallback? onCaptureStarted,
    $base.CaptureProcessProgressedCallback? onCaptureProcessProgressed,
    $base.PostviewBitmapAvailableCallback? onPostviewBitmapAvailable,
    $base.CaptureSuccessCallback? onCaptureSuccess,
    $base.CaptureErrorCallback? onError,
  }) {
    // TODO: implement takePictureToMemory
    throw UnimplementedError();
  }

  @override
  Future<void> takePictureToFile(
    $base.OutputFileOptions outputFileOptions, {
    $base.CaptureStartedCallback? onCaptureStarted,
    $base.CaptureProcessProgressedCallback? onCaptureProcessProgressed,
    $base.PostviewBitmapAvailableCallback? onPostviewBitmapAvailable,
    $base.ImageSavedCallback? onImageSaved,
    $base.CaptureErrorCallback? onError,
  }) {
    // TODO: implement takePictureToFile
    throw UnimplementedError();
    // final completer = Completer<Uri>();
    // final jniPath = uri.toFilePath().toJString();
    // final jniFile = jni.File(jniPath);
    // final jniOutputFileOptions =
    //     jni.MyImageCapture_MyOutputFileOptions_MyBuilder(jniFile).build();
    // final jniExecutor = jni.ContextCompat.getMainExecutor(jni.MyJNI.context);
    // final jniImageSavedCallback = jni.MyImageCapture_MyOnImageSavedCallbackImpl(
    //   jni.MyImageCapture_MyOnImageSavedCallback.implement(
    //     jni.$MyImageCapture_MyOnImageSavedCallbackImpl(
    //       onCaptureStarted: () {
    //         logger.info('onCaptureStarted.');
    //       },
    //       onCaptureProcessProgressed: (progress) {
    //         logger.info('onCaptureProcessProgressed $progress.');
    //       },
    //       onImageSaved: (jniOutputFileResults) {
    //         logger.info('onImageSaved.');
    //         final savedUri = jniOutputFileResults.getSavedUri().dartValue;
    //         completer.complete(savedUri);
    //       },
    //       onError: (jniException) {
    //         logger.info('onError $jniException.');
    //         completer.completeError(jniException);
    //       },
    //       onPostviewBitmapAvailable: (jniBitmap) {
    //         logger.info('onPostviewBitmapAvailable.');
    //       },
    //     ),
    //   ),
    // );
    // await obj.takePictureOnMainThread(
    //   jniOutputFileOptions,
    //   jniExecutor,
    //   jniImageSavedCallback,
    // );
    // final savedUri = await completer.future;
    // return savedUri;
  }

  @override
  Future<$base.DynamicRange> getVideoCaptureDynamicRange() async {
    throw UnimplementedError();
    // final jniDynamicRange = await obj.getVideoCaptureDynamicRangeOnMainThread();
    // return jniDynamicRange.dartValue;
  }

  @override
  Future<void> setVideoCaptureDynamicRange(
      $base.DynamicRange dynamicRange) async {
    throw UnimplementedError();
    // await obj.setVideoCaptureDynamicRangeOnMainThread(dynamicRange.jniValue);
  }

  @override
  Future<$base.MirrorMode> getVideoCaptureMirrorMode() async {
    throw UnimplementedError();
    // final jniMirrorMode = await obj.getVideoCaptureMirrorModeOnMainThread();
    // return jniMirrorMode.dartMirrorMode;
  }

  @override
  Future<void> setVideoCaptureMirrorMode($base.MirrorMode mirrorMode) async {
    throw UnimplementedError();
    // await obj.setVideoCaptureMirrorModeOnMainThread(mirrorMode.jniValue);
  }

  @override
  Future<$base.QualitySelector> getVideoCaptureQualitySelector() async {
    throw UnimplementedError();
    // final jniQualitySelector =
    //     await obj.getVideoCaptureQualitySelectorOnMainThread();
    // return MyQualitySelector.jni(jniQualitySelector);
  }

  @override
  Future<void> setVideoCaptureQualitySelector(
      $base.QualitySelector qualitySelector) async {
    throw UnimplementedError();
    // if (qualitySelector is! MyQualitySelector) {
    //   throw TypeError();
    // }
    // await obj
    //     .setVideoCaptureQualitySelectorOnMainThread(qualitySelector.jniValue);
  }

  @override
  Future<bool> isRecording() async {
    throw UnimplementedError();
    // final isRecording = await obj.isRecordingOnMainThread();
    // return isRecording;
  }

  @override
  Future<$base.Recording> startRecording(
    $base.FileOutputOptions outputOptions, {
    required $base.AudioConfig audioConfig,
    required $base.VideoRecordEventConsumer listener,
  }) async {
    throw UnimplementedError();
    // await obj
    //     .setEnabledUseCasesOnMainThread(jni.CameraController.VIDEO_CAPTURE);
    // final jniPath = uri.toFilePath().toJString();
    // final jniFile = jni.File(jniPath);
    // final jniOutputOptions = jni.MyFileOutputOptions_MyBuilder(jniFile).build();
    // final jniAudioConfig = jni.AudioConfig.create(enableAudio);
    // final jniExecutor = jni.ContextCompat.getMainExecutor(jni.MyJNI.context);
    // final jniRecording = await obj.startRecordingOnMainThread(
    //   jniOutputOptions,
    //   jniAudioConfig,
    //   jniExecutor,
    //   jni.Consumer.implement(
    //     jni.$ConsumerImpl(
    //       T: jni.VideoRecordEvent.type,
    //       accept: (jniEvent) {
    //         final isInstanceOfStatus = Jni.env.IsInstanceOf(
    //           jniEvent.reference.pointer,
    //           jni.VideoRecordEvent_Status.type.jClass.reference.pointer,
    //         );
    //         if (isInstanceOfStatus) {
    //           return;
    //         }
    //         final isInstanceOfFinalize = Jni.env.IsInstanceOf(
    //           jniEvent.reference.pointer,
    //           jni.VideoRecordEvent_Finalize.type.jClass.reference.pointer,
    //         );
    //         if (isInstanceOfFinalize) {
    //           obj.setEnabledUseCasesOnMainThread(
    //               jni.CameraController.IMAGE_CAPTURE |
    //                   jni.CameraController.IMAGE_ANALYSIS);
    //         }
    //         listener(jniEvent.dartValue);
    //       },
    //     ),
    //   ),
    // );
    // _jniRecording = jniRecording;
  }

  @override
  Future<$base.BackpressureStrategy>
      getImageAnalysisBackpressureStrategy() async {
    throw UnimplementedError();
    // final jniBackpressureStrategy =
    //     await obj.getImageAnalysisBackpressureStrategyOnMainThread();
    // return jniBackpressureStrategy.dartBackpressureStrategy;
  }

  @override
  Future<void> setImageAnalysisBackpressureStrategy(
      $base.BackpressureStrategy strategy) async {
    throw UnimplementedError();
    // await obj
    //     .setImageAnalysisBackpressureStrategyOnMainThread(strategy.jniValue);
  }

  @override
  Future<int> getImageAnalysisImageQueueDepth() async {
    throw UnimplementedError();
    // final imageQueueDepth =
    //     await obj.getImageAnalysisImageQueueDepthOnMainThread();
    // return imageQueueDepth;
  }

  @override
  Future<void> setImageAnalysisImageQueueDepth(int imageQueueDepth) async {
    throw UnimplementedError();
    // await obj.setImageAnalysisImageQueueDepthOnMainThread(imageQueueDepth);
  }

  @override
  Future<$base.ImageFormat> getImageAnalysisOutputImageFormat() async {
    throw UnimplementedError();
    // final jniOutputImageFormat =
    //     await obj.getImageAnalysisOutputImageFormatOnMainThread();
    // return jniOutputImageFormat.dartOutputImageFormat;
  }

  @override
  Future<void> setImageAnalysisOutputImageFormat(
      $base.ImageFormat outputImageFormat) async {
    throw UnimplementedError();
    // await obj.setImageAnalysisOutputImageFormatOnMainThread(
    //     outputImageFormat.jniValue);
  }

  @override
  Future<$base.ResolutionSelector?> getImageAnalysisResolutionSelector() async {
    throw UnimplementedError();
    // final jniResolutionSelector =
    //     await obj.getImageAnalysisResolutionSelectorOnMainThread();
    // if (jniResolutionSelector.isNull) {
    //   return null;
    // }
    // return MyResolutionSelector.jni(jniResolutionSelector);
  }

  @override
  Future<void> setImageAnalysisResolutionSelector(
      $base.ResolutionSelector? resolutionSelector) async {
    throw UnimplementedError();
    // if (resolutionSelector == null) {
    //   final jniResolutionSelector =
    //       jni.ResolutionSelector.fromReference(jNullReference);
    //   await obj.setImageAnalysisResolutionSelectorOnMainThread(
    //       jniResolutionSelector);
    // } else {
    //   if (resolutionSelector is! MyResolutionSelector) {
    //     throw TypeError();
    //   }
    //   await obj.setImageAnalysisResolutionSelectorOnMainThread(
    //       resolutionSelector.jniValue);
    // }
  }

  @override
  Future<void> setImageAnalysisAnalyzer($base.Analyzer analyzer) async {
    throw UnimplementedError();
    // final jniExecutor =
    //     jni.Executors.newSingleThreadExecutor().castTo(jni.Executor.type);
    // await obj.setImageAnalysisAnalyzerOnMainThread(
    //   jniExecutor,
    //   analyzer.jniValue,
    // );
  }

  @override
  Future<void> clearImageAnalysisAnalyzer() async {
    throw UnimplementedError();
    // await obj.clearImageAnalysisAnalyzerOnMainThread();
  }

  void _onListenZoomState() async {
    // final liveZoomStateObj = await obj.getZoomState();
    // final ownerObj = jni.activity.as(jni.LifecycleOwner.type);
    // final observerObj = jni.Observer.implement(
    //   jni.$Observer(
    //     T: liveZoomStateObj.T,
    //     onChanged: (zoomStateObj) {
    //       final zoomState =
    //           zoomStateObj == null ? null : ZoomStateImpl(zoomStateObj);
    //       _zoomStateChagnedController.add(zoomState);
    //     },
    //   ),
    // );
    // await ui.runOnPlatformThread(() {
    //   final observer = jni.Observer.fromReference(
    //       observerObj.T, observerObj.);
    //   liveZoomStateObj.observe(ownerObj, observerObj);
    // });
    // _zoomStateObserverObj = observerObj;
  }

  void _onCancelZoomState() async {
    // final liveZoomStateObj = await obj.getZoomState();
    // final observerObj = _zoomStateObserverObj;
    // await ui.runOnPlatformThread(() {
    //   liveZoomStateObj.removeObserver(observerObj);
    // });
  }

  void _onListenTorchState() async {
    // final jniTrochStateData = await obj.getTorchStateOnMainThread();
    // final jniLifecycleOwner =
    //     jni.MyJNI.activity.castTo(jni.LifecycleOwner.type);
    // final jniObserver = jni.Observer.implement(
    //   jni.$ObserverImpl(
    //     T: JInteger.type,
    //     onChanged: (jniTorchState) {
    //       final torchState = jniTorchState.isNull
    //           ? null
    //           : jniTorchState.intValue() == jni.TorchState.ON;
    //       _torchStateChagnedController.add(torchState);
    //     },
    //   ),
    // );
    // jniTrochStateData.observeOnMainThread(
    //   jniLifecycleOwner,
    //   jniObserver.T,
    //   jniObserver.reference,
    // );
    // _jniTorchStateObserver = jniObserver;
  }

  void _onCancelTorchState() async {
    // final jniTorchStateData = await obj.getTorchStateOnMainThread();
    // final jniObserver = _jniTorchStateObserver;
    // jniTorchStateData.removeObserverOnMainThread(
    //   jniObserver.T,
    //   jniObserver.reference,
    // );
  }

  @override
  Future<$base.CameraControl> getCameraControl() {
    // TODO: implement getCameraControl
    throw UnimplementedError();
  }

  @override
  Future<$base.CameraInfo> getCameraInfo() {
    // TODO: implement getCameraInfo
    throw UnimplementedError();
  }

  @override
  Future<$base.Range<int>> getVideoCaptureTargetFrameRate() {
    // TODO: implement getVideoCaptureTargetFrameRate
    throw UnimplementedError();
  }

  @override
  Future<bool> isImageAnalysisEnabled() {
    // TODO: implement isImageAnalysisEnabled
    throw UnimplementedError();
  }

  @override
  Future<bool> isImageCaptureEnabled() {
    // TODO: implement isImageCaptureEnabled
    throw UnimplementedError();
  }

  @override
  Future<bool> isVideoCaptureEnabled() {
    // TODO: implement isVideoCaptureEnabled
    throw UnimplementedError();
  }

  @override
  Future<void> setEnabledUseCases(List<$base.UseCase> useCases) {
    // TODO: implement setEnabledUseCases
    throw UnimplementedError();
  }

  @override
  Future<void> setVideoCaptureTargetFrameRate(
      $base.Range<int> targetFrameRate) {
    // TODO: implement setVideoCaptureTargetFrameRate
    throw UnimplementedError();
  }
}
