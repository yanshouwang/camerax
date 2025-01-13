import 'dart:async';

import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/common.dart';
import 'package:camerax_android/src/legacy/core.dart';
import 'package:camerax_android/src/legacy/ml.dart';
import 'package:camerax_android/src/legacy/video.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'use_case.dart';

final class CameraController extends $base.CameraController {
  final $native.LifecycleCameraController obj;
  final $native.PreviewView viewObj;

  late final StreamController<bool> _torchStateChangedController;
  late final StreamController<$base.ZoomState> _zoomStateChangedController;

  Future<$native.TorchStateObserver>? _torchStateObserver;
  Future<$native.ZoomStateObserver>? _zoomStateObserver;

  CameraController.$native(this.obj, this.viewObj) : super.impl() {
    _torchStateChangedController = StreamController.broadcast(
      onListen: _onListenTorchStateChanged,
      onCancel: _onCancelTorchStateChanged,
    );
    _zoomStateChangedController = StreamController.broadcast(
      onListen: _onListenZoomStateChanged,
      onCancel: _onCancelZoomStateChanged,
    );
  }

  @override
  Stream<bool> get torchStateChanged => _torchStateChangedController.stream;
  @override
  Stream<$base.ZoomState> get zoomStateChanged =>
      _zoomStateChangedController.stream;

  factory CameraController() {
    final obj = $native.LifecycleCameraController();
    final viewObj = $native.PreviewView();
    return CameraController.$native(obj, viewObj);
  }

  @override
  Future<void> initialize() async {
    await obj.initialize();
  }

  @override
  Future<bool> hasCamera($base.CameraSelector cameraSelector) async {
    if (cameraSelector is! CameraSelector) {
      throw TypeError();
    }
    final hasCamera = await obj.hasCamera(cameraSelector.obj);
    return hasCamera;
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
  Future<$base.CameraInfo?> getCameraInfo() async {
    final obj = await this.obj.getCameraInfo();
    if (obj == null) {
      return null;
    }
    return CameraInfo.$native(obj);
  }

  @override
  Future<$base.CameraControl?> getCameraControl() async {
    final obj = await this.obj.getCameraControl();
    if (obj == null) {
      return null;
    }
    return CameraControl.$native(obj);
  }

  @override
  Future<void> bind() async {
    await obj.bindToLifecycle();
  }

  @override
  Future<void> unbind() async {
    await obj.unbind();
  }

  @override
  Future<bool?> getTorchState() async {
    final dataObj = await obj.getTorchState();
    final value = await dataObj.getValue();
    return value == $native.TorchState.on;
  }

  @override
  Future<void> enableTorch(bool enabled) async {
    await obj.enableTorch(enabled);
  }

  @override
  Future<$base.ZoomState?> getZoomState() async {
    final dataObj = await obj.getZoomState();
    final valueObj = await dataObj.getValue();
    return valueObj?.args;
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
  Future<bool> isPinchToZoomEnabled() async {
    final enabled = await obj.isPinchToZoomEnabled();
    return enabled;
  }

  @override
  Future<void> setPinchToZoomEnabled(bool enabled) async {
    await obj.setPinchToZoomEnabled(enabled);
  }

  @override
  Future<bool> isTapToFocusEnabled() async {
    final enabled = await obj.isTapToFocusEnabled();
    return enabled;
  }

  @override
  Future<void> setTapToFocusEnabled(bool enabled) async {
    await obj.setTapToFocusEnabled(enabled);
  }

  @override
  Future<bool> isImageCaptureEnabled() async {
    final enabled = await obj.isImageCaptureEnabled();
    return enabled;
  }

  @override
  Future<bool> isImageAnalysisEnabled() async {
    final enabled = await obj.isImageAnalysisEnabled();
    return enabled;
  }

  @override
  Future<bool> isVideoCaptureEnabled() async {
    final enabled = await obj.isVideoCaptureEnabled();
    return enabled;
  }

  @override
  Future<void> setEnabledUseCases(List<$base.UseCase> useCases) async {
    final useCaseObjs = useCases.map((useCase) => useCase.obj).toList();
    await obj.setEnabledUseCases(useCaseObjs);
  }

  @override
  Future<$base.ResolutionSelector?> getPreviewResolutionSelector() async {
    final obj = await this.obj.getPreviewResolutionSelector();
    return obj?.args;
  }

  @override
  Future<void> setPreviewResolutionSelector(
      $base.ResolutionSelector? resolutionSelector) async {
    await obj.setPreviewResolutionSelector(resolutionSelector?.obj);
  }

  @override
  Future<$base.ResolutionSelector?> getImageCaptureResolutionSelector() async {
    final obj = await this.obj.getImageCaptureResolutionSelector();
    return obj?.args;
  }

  @override
  Future<void> setImageCaptureResolutionSelector(
      $base.ResolutionSelector? resolutionSelector) async {
    await obj.setImageCaptureResolutionSelector(resolutionSelector?.obj);
  }

  @override
  Future<$base.CaptureMode> getImageCaptureMode() async {
    final obj = await this.obj.getImageCaptureMode();
    return obj.args;
  }

  @override
  Future<void> setImageCaptureMode($base.CaptureMode captureMode) async {
    await obj.setImageCaptureMode(captureMode.obj);
  }

  @override
  Future<$base.FlashMode> getImageCaptureFlashMode() async {
    final obj = await this.obj.getImageCaptureFlashMode();
    return obj.args;
  }

  @override
  Future<void> setImageCaptureFlashMode($base.FlashMode flashMode) async {
    await obj.setImageCaptureFlashMode(flashMode.obj);
  }

  @override
  Future<Uri> takePicture(Uri uri) async {
    throw UnimplementedError();
    // final savedUri = await obj.takePicture('$uri');
    // return Uri.parse(savedUri);
  }

  @override
  Future<$base.ResolutionSelector?> getImageAnalysisResolutionSelector() async {
    final obj = await this.obj.getImageAnalysisResolutionSelector();
    return obj?.args;
  }

  @override
  Future<void> setImageAnalysisResolutionSelector(
      $base.ResolutionSelector? resolutionSelector) async {
    await obj.setImageAnalysisResolutionSelector(resolutionSelector?.obj);
  }

  @override
  Future<$base.BackpressureStrategy>
      getImageAnalysisBackpressureStrategy() async {
    final obj = await this.obj.getImageAnalysisBackpressureStrategy();
    return obj.args;
  }

  @override
  Future<void> setImageAnalysisBackpressureStrategy(
      $base.BackpressureStrategy strategy) async {
    await obj.setImageAnalysisBackpressureStrategy(strategy.obj);
  }

  @override
  Future<int> getImageAnalysisImageQueueDepth() async {
    final imageQueueDepth = await obj.getImageAnalysisImageQueueDepth();
    return imageQueueDepth;
  }

  @override
  Future<void> setImageAnalysisImageQueueDepth(int depth) async {
    await obj.setImageAnalysisImageQueueDepth(depth);
  }

  @override
  Future<$base.ImageFormat> getImageAnalysisOutputImageFormat() async {
    final obj = await this.obj.getImageAnalysisOutputImageFormat();
    return obj.args;
  }

  @override
  Future<void> setImageAnalysisOutputImageFormat(
      $base.ImageFormat format) async {
    await obj.setImageAnalysisOutputImageFormat(format.obj);
  }

  @override
  Future<void> setImageAnalysisAnalyzer($base.Analyzer analyzer) async {
    final obj = analyzer is MlKitAnalyzer
        ? analyzer.obj
        : $native.RawAnalyzer(
            analyze: (obj, image) => analyzer.analyze(image.args),
          );
    await this.obj.setImageAnalysisAnalyzer(obj);
  }

  @override
  Future<void> clearImageAnalysisAnalyzer() async {
    await obj.clearImageAnalysisAnalyzer();
  }

  @override
  Future<$base.DynamicRange> getVideoCaptureDynamicRange() async {
    final obj = await this.obj.getVideoCaptureDynamicRange();
    return obj.args;
  }

  @override
  Future<void> setVideoCaptureDynamicRange(
      $base.DynamicRange dynamicRange) async {
    await obj.setVideoCaptureDynamicRange(dynamicRange.obj);
  }

  @override
  Future<$base.MirrorMode> getVideoCaptureMirrorMode() async {
    final obj = await this.obj.getVideoCaptureMirrorMode();
    return obj.args;
  }

  @override
  Future<void> setVideoCaptureMirrorMode($base.MirrorMode mirrorMode) async {
    await obj.setVideoCaptureMirrorMode(mirrorMode.obj);
  }

  @override
  Future<$base.QualitySelector> getVideoCaptureQualitySelector() async {
    final obj = await this.obj.getVideoCaptureQualitySelector();
    return QualitySelector.$native(obj);
  }

  @override
  Future<void> setVideoCaptureQualitySelector(
      $base.QualitySelector qualitySelector) async {
    if (qualitySelector is! QualitySelector) {
      throw TypeError();
    }
    await obj.setVideoCaptureQualitySelector(qualitySelector.obj);
  }

  @override
  Future<$base.Range<int>> getVideoCaptureTargetFrameRate() async {
    final obj = await this.obj.getVideoCaptureTargetFrameRate();
    return obj.args;
  }

  @override
  Future<void> setVideoCaptureTargetFrameRate(
      $base.Range<int> targetFrameRate) async {
    await obj.setVideoCaptureTargetFrameRate(targetFrameRate.obj);
  }

  @override
  Future<bool> isRecording() async {
    final isRecording = await obj.isRecording();
    return isRecording;
  }

  @override
  Future<$base.Recording> startRecording({
    required Uri uri,
    required bool enableAudio,
    required $base.VideoRecordEventConsumer listener,
  }) async {
    throw UnimplementedError();
    // final audioConfigObj = $native.AudioConfig.create(
    //   enableAudio: enableAudio,
    // );
    // final listenerObj = $native.VideoRecordEventConsumer(
    //   accept: (obj, eventObj) {
    //     if (eventObj is $native.VideoRecordStatusEvent) {
    //       final event = VideoRecordStatusEvent.$native(eventObj);
    //       listener(event);
    //     } else if (eventObj is $native.VideoRecordStartEvent) {
    //       final event = VideoRecordStartEvent.$native(eventObj);
    //       listener(event);
    //     } else if (eventObj is $native.VideoRecordPauseEvent) {
    //       final event = VideoRecordPauseEvent.$native(eventObj);
    //       listener(event);
    //     } else if (eventObj is $native.VideoRecordResumeEvent) {
    //       final event = VideoRecordResumeEvent.$native(eventObj);
    //       listener(event);
    //     } else if (eventObj is $native.VideoRecordFinalizeEvent) {
    //       final event = VideoRecordFinalizeEvent.$native(eventObj);
    //       listener(event);
    //     } else {
    //       throw TypeError();
    //     }
    //   },
    // );
    // final obj =
    //     await this.obj.startRecording('$uri', audioConfigObj, listenerObj);
    // return Recording.$native(obj);
  }

  void _onListenTorchStateChanged() async {
    final completer = Completer<$native.TorchStateObserver>();
    try {
      final observer = _torchStateObserver;
      if (observer != null) {
        throw ArgumentError.value(observer);
      }
      _torchStateObserver = completer.future;
      final dataObj = await obj.getTorchState();
      final observerObj = $native.TorchStateObserver(
        onChanged: (obj, value) {
          _torchStateChangedController.add(value == $native.TorchState.on);
        },
      );
      await dataObj.observe(observerObj);
      completer.complete(observerObj);
    } catch (e) {
      completer.completeError(e);
      _torchStateChangedController.addError(e);
    }
  }

  void _onCancelTorchStateChanged() async {
    try {
      final observer = _torchStateObserver;
      if (observer == null) {
        throw ArgumentError.notNull();
      }
      _torchStateObserver = null;
      final dataObj = await obj.getTorchState();
      final observerObj = await observer;
      await dataObj.removeObserver(observerObj);
    } catch (e) {
      _torchStateChangedController.addError(e);
    }
  }

  void _onListenZoomStateChanged() async {
    final completer = Completer<$native.ZoomStateObserver>();
    try {
      final observer = _zoomStateObserver;
      if (observer != null) {
        throw ArgumentError.value(observer);
      }
      _zoomStateObserver = completer.future;
      final dataObj = await obj.getZoomState();
      final observerObj = $native.ZoomStateObserver(
        onChanged: (obj, valueObj) {
          try {
            _zoomStateChangedController.add(valueObj.args);
          } catch (e) {
            _zoomStateChangedController.addError(e);
          }
        },
      );
      await dataObj.observe(observerObj);
      completer.complete(observerObj);
    } catch (e) {
      completer.completeError(e);
      _zoomStateChangedController.addError(e);
    }
  }

  void _onCancelZoomStateChanged() async {
    try {
      final observer = _zoomStateObserver;
      if (observer == null) {
        throw ArgumentError.notNull();
      }
      _zoomStateObserver = null;
      final dataObj = await obj.getZoomState();
      final observerObj = await observer;
      await dataObj.removeObserver(observerObj);
    } catch (e) {
      _zoomStateChangedController.addError(e);
    }
  }
}
