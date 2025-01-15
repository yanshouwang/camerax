import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/common.dart';
import 'package:camerax_android/src/legacy/core.dart';
import 'package:camerax_android/src/legacy/ml.dart';
import 'package:camerax_android/src/legacy/video.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

import 'use_case.dart';

final class CameraController extends $interface.CameraController {
  final $native.LifecycleCameraController obj;
  final $native.PreviewView viewObj;

  late final StreamController<$interface.TorchState>
      _torchStateChangedController;
  late final StreamController<$interface.ZoomState> _zoomStateChangedController;

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
  Stream<$interface.TorchState> get torchStateChanged =>
      _torchStateChangedController.stream;
  @override
  Stream<$interface.ZoomState> get zoomStateChanged =>
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
  Future<bool> hasCamera($interface.CameraSelector cameraSelector) async {
    if (cameraSelector is! CameraSelector) {
      throw TypeError();
    }
    final hasCamera = await obj.hasCamera(cameraSelector.obj);
    return hasCamera;
  }

  @override
  Future<$interface.CameraSelector> getCameraSelector() async {
    final cameraSelectorObj = await obj.getCameraSelector();
    return CameraSelector.$native(cameraSelectorObj);
  }

  @override
  Future<void> setCameraSelector(
      $interface.CameraSelector cameraSelector) async {
    if (cameraSelector is! CameraSelector) {
      throw TypeError();
    }
    await obj.setCameraSelector(cameraSelector.obj);
  }

  @override
  Future<$interface.CameraInfo?> getCameraInfo() async {
    final obj = await this.obj.getCameraInfo();
    if (obj == null) {
      return null;
    }
    return CameraInfo.$native(obj);
  }

  @override
  Future<$interface.CameraControl?> getCameraControl() async {
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
  Future<$interface.TorchState?> getTorchState() async {
    final dataObj = await this.obj.getTorchState();
    final obj = await dataObj.getValue();
    return obj?.args;
  }

  @override
  Future<void> enableTorch(bool enabled) async {
    await obj.enableTorch(enabled);
  }

  @override
  Future<$interface.ZoomState?> getZoomState() async {
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
  Future<void> setEnabledUseCases(List<$interface.UseCase> useCases) async {
    final useCaseObjs = useCases.map((useCase) => useCase.obj).toList();
    await obj.setEnabledUseCases(useCaseObjs);
  }

  @override
  Future<$interface.ResolutionSelector?> getPreviewResolutionSelector() async {
    final obj = await this.obj.getPreviewResolutionSelector();
    return obj?.args;
  }

  @override
  Future<void> setPreviewResolutionSelector(
      $interface.ResolutionSelector? resolutionSelector) async {
    await obj.setPreviewResolutionSelector(resolutionSelector?.obj);
  }

  @override
  Future<$interface.ResolutionSelector?>
      getImageCaptureResolutionSelector() async {
    final obj = await this.obj.getImageCaptureResolutionSelector();
    return obj?.args;
  }

  @override
  Future<void> setImageCaptureResolutionSelector(
      $interface.ResolutionSelector? resolutionSelector) async {
    await obj.setImageCaptureResolutionSelector(resolutionSelector?.obj);
  }

  @override
  Future<$interface.CaptureMode> getImageCaptureMode() async {
    final obj = await this.obj.getImageCaptureMode();
    return obj.args;
  }

  @override
  Future<void> setImageCaptureMode($interface.CaptureMode captureMode) async {
    await obj.setImageCaptureMode(captureMode.obj);
  }

  @override
  Future<$interface.FlashMode> getImageCaptureFlashMode() async {
    final obj = await this.obj.getImageCaptureFlashMode();
    return obj.args;
  }

  @override
  Future<void> setImageCaptureFlashMode($interface.FlashMode flashMode) async {
    await obj.setImageCaptureFlashMode(flashMode.obj);
  }

  @override
  Future<void> takePictureToMemory({
    $interface.CaptureStartedCallback? onCaptureStarted,
    $interface.CaptureProcessProgressedCallback? onCaptureProcessProgressed,
    $interface.PostviewBitmapAvailableCallback? onPostviewBitmapAvailable,
    $interface.CaptureSuccessCallback? onCaptureSuccess,
    $interface.CaptureErrorCallback? onError,
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
    $interface.OutputFileOptions outputFileOptions, {
    $interface.CaptureStartedCallback? onCaptureStarted,
    $interface.CaptureProcessProgressedCallback? onCaptureProcessProgressed,
    $interface.PostviewBitmapAvailableCallback? onPostviewBitmapAvailable,
    $interface.ImageSavedCallback? onImageSaved,
    $interface.CaptureErrorCallback? onError,
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
  Future<$interface.ResolutionSelector?>
      getImageAnalysisResolutionSelector() async {
    final obj = await this.obj.getImageAnalysisResolutionSelector();
    return obj?.args;
  }

  @override
  Future<void> setImageAnalysisResolutionSelector(
      $interface.ResolutionSelector? resolutionSelector) async {
    await obj.setImageAnalysisResolutionSelector(resolutionSelector?.obj);
  }

  @override
  Future<$interface.BackpressureStrategy>
      getImageAnalysisBackpressureStrategy() async {
    final obj = await this.obj.getImageAnalysisBackpressureStrategy();
    return obj.args;
  }

  @override
  Future<void> setImageAnalysisBackpressureStrategy(
      $interface.BackpressureStrategy strategy) async {
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
  Future<$interface.ImageFormat> getImageAnalysisOutputImageFormat() async {
    final obj = await this.obj.getImageAnalysisOutputImageFormat();
    return obj.args;
  }

  @override
  Future<void> setImageAnalysisOutputImageFormat(
      $interface.ImageFormat format) async {
    await obj.setImageAnalysisOutputImageFormat(format.obj);
  }

  @override
  Future<void> setImageAnalysisAnalyzer($interface.Analyzer analyzer) async {
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
  Future<$interface.DynamicRange> getVideoCaptureDynamicRange() async {
    final obj = await this.obj.getVideoCaptureDynamicRange();
    return obj.args;
  }

  @override
  Future<void> setVideoCaptureDynamicRange(
      $interface.DynamicRange dynamicRange) async {
    await obj.setVideoCaptureDynamicRange(dynamicRange.obj);
  }

  @override
  Future<$interface.MirrorMode> getVideoCaptureMirrorMode() async {
    final obj = await this.obj.getVideoCaptureMirrorMode();
    return obj.args;
  }

  @override
  Future<void> setVideoCaptureMirrorMode(
      $interface.MirrorMode mirrorMode) async {
    await obj.setVideoCaptureMirrorMode(mirrorMode.obj);
  }

  @override
  Future<$interface.QualitySelector> getVideoCaptureQualitySelector() async {
    final obj = await this.obj.getVideoCaptureQualitySelector();
    return QualitySelector.$native(obj);
  }

  @override
  Future<void> setVideoCaptureQualitySelector(
      $interface.QualitySelector qualitySelector) async {
    if (qualitySelector is! QualitySelector) {
      throw TypeError();
    }
    await obj.setVideoCaptureQualitySelector(qualitySelector.obj);
  }

  @override
  Future<$interface.Range<int>> getVideoCaptureTargetFrameRate() async {
    final obj = await this.obj.getVideoCaptureTargetFrameRate();
    return obj.args;
  }

  @override
  Future<void> setVideoCaptureTargetFrameRate(
      $interface.Range<int> targetFrameRate) async {
    await obj.setVideoCaptureTargetFrameRate(targetFrameRate.obj);
  }

  @override
  Future<bool> isRecording() async {
    final isRecording = await obj.isRecording();
    return isRecording;
  }

  @override
  Future<$interface.Recording> startRecording(
    $interface.FileOutputOptions outputOptions, {
    required $interface.AudioConfig audioConfig,
    required $interface.VideoRecordEventConsumer listener,
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
