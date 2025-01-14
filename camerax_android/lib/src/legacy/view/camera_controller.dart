import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

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

  late final StreamController<$base.TorchState> _torchStateChangedController;
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
  Stream<$base.TorchState> get torchStateChanged =>
      _torchStateChangedController.stream;
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
  Future<$base.TorchState?> getTorchState() async {
    final dataObj = await this.obj.getTorchState();
    final obj = await dataObj.getValue();
    return obj?.args;
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
  Future<void> takePictureToMemory({
    $base.CaptureStartedCallback? onCaptureStarted,
    $base.CaptureProcessProgressedCallback? onCaptureProcessProgressed,
    $base.PostviewBitmapAvailableCallback? onPostviewBitmapAvailable,
    $base.CaptureSuccessCallback? onCaptureSuccess,
    $base.CaptureErrorCallback? onError,
  }) async {
    final callback = $native.OnImageCapturedCallback(
      onCaptureStarted:
          onCaptureStarted == null ? null : (obj) => onCaptureStarted(),
      onCaptureProcessProgressed: onCaptureProcessProgressed == null
          ? null
          : (obj, progress) => onCaptureProcessProgressed(progress),
      onPostviewBitmapAvailable: onPostviewBitmapAvailable == null
          ? null
          : (obj, bitmapObj) async {
              final bitmap = await _decodeImage(bitmapObj);
              onPostviewBitmapAvailable(bitmap);
            },
      onCaptureSuccess: onCaptureSuccess == null
          ? null
          : (obj, imageObj) => onCaptureSuccess(imageObj.args),
      onError: onError == null
          ? null
          : (obj, exceptionObj) => onError(exceptionObj.args),
    );
    await obj.takePictureToMemory(callback);
  }

  @override
  Future<void> takePictureToFile(
    $base.OutputFileOptions outputFileOptions, {
    $base.CaptureStartedCallback? onCaptureStarted,
    $base.CaptureProcessProgressedCallback? onCaptureProcessProgressed,
    $base.PostviewBitmapAvailableCallback? onPostviewBitmapAvailable,
    $base.ImageSavedCallback? onImageSaved,
    $base.CaptureErrorCallback? onError,
  }) async {
    if (outputFileOptions is! OutputFileOptions) {
      throw TypeError();
    }
    final callback = $native.OnImageSavedCallback(
      onCaptureStarted:
          onCaptureStarted == null ? null : (obj) => onCaptureStarted(),
      onCaptureProcessProgressed: onCaptureProcessProgressed == null
          ? null
          : (obj, progress) => onCaptureProcessProgressed(progress),
      onPostviewBitmapAvailable: onPostviewBitmapAvailable == null
          ? null
          : (obj, bitmapObj) async {
              final bitmap = await _decodeImage(bitmapObj);
              onPostviewBitmapAvailable(bitmap);
            },
      onImageSaved: onImageSaved == null
          ? null
          : (obj, resultsObj) => onImageSaved(resultsObj.args),
      onError: onError == null
          ? null
          : (obj, exceptionObj) => onError(exceptionObj.args),
    );
    await obj.takePictureToFile(outputFileOptions.obj, callback);
  }

  Future<ui.Image> _decodeImage(Uint8List value) async {
    final buffer = await ui.ImmutableBuffer.fromUint8List(value);
    final descriptor = await ui.ImageDescriptor.encoded(buffer);
    final codec = await descriptor.instantiateCodec();
    final frame = await codec.getNextFrame();
    final image = frame.image;
    return image;
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
  Future<$base.Recording> startRecording(
    $base.FileOutputOptions outputOptions, {
    required $base.AudioConfig audioConfig,
    required $base.VideoRecordEventConsumer listener,
  }) async {
    if (outputOptions is! FileOutputOptions) {
      throw TypeError();
    }
    final obj = await this.obj.startRecording(
          outputOptions.obj,
          audioConfig.obj,
          $native.VideoRecordEventConsumer(
            accept: (obj, eventObj) => listener(eventObj.args),
          ),
        );
    return obj.args;
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
        onChanged: (obj, valueObj) {
          _torchStateChangedController.add(valueObj.args);
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
