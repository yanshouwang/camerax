import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_android/src/video.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'use_case_impl.dart';

final class CameraControllerImpl extends CameraController {
  final LifecycleCameraControllerApi api;

  late final TorchStateObserverApi _torchStateObserverApi;
  late final ZoomStateObserverApi _zoomStateObserverApi;
  late final StreamController<TorchState> _torchStateChangedController;
  late final StreamController<ZoomState> _zoomStateChangedController;

  CameraControllerImpl.impl(this.api) : super.impl() {
    _torchStateObserverApi = TorchStateObserverApi(
      onChanged: (_, e) => _torchStateChangedController.add(e.impl),
    );
    _zoomStateObserverApi = ZoomStateObserverApi(
      onChanged: (_, e) => _zoomStateChangedController.add(e.impl),
    );
    _torchStateChangedController = StreamController.broadcast(
      onListen: () async {
        try {
          final torchStateApi = await api.getTorchState();
          final observerApi = _torchStateObserverApi;
          await torchStateApi.observe(observerApi);
        } catch (e) {
          _torchStateChangedController.addError(e);
        }
      },
      onCancel: () async {
        try {
          final torchStateApi = await api.getTorchState();
          final observerApi = _torchStateObserverApi;
          await torchStateApi.removeObserver(observerApi);
        } catch (e) {
          _torchStateChangedController.addError(e);
        }
      },
    );
    _zoomStateChangedController = StreamController.broadcast(
      onListen: () async {
        try {
          final zoomStateApi = await api.getZoomState();
          final observerApi = _zoomStateObserverApi;
          await zoomStateApi.observe(observerApi);
        } catch (e) {
          _zoomStateChangedController.addError(e);
        }
      },
      onCancel: () async {
        try {
          final zoomStateApi = await api.getZoomState();
          final observerApi = _zoomStateObserverApi;
          await zoomStateApi.removeObserver(observerApi);
        } catch (e) {
          _zoomStateChangedController.addError(e);
        }
      },
    );
  }

  @override
  Stream<TorchState> get torchStateChanged =>
      _torchStateChangedController.stream;
  @override
  Stream<ZoomState> get zoomStateChanged => _zoomStateChangedController.stream;

  factory CameraControllerImpl() {
    final api = LifecycleCameraControllerApi();
    return CameraControllerImpl.impl(api);
  }

  @override
  Future<void> initialize() => api.initialize();

  @override
  Future<bool> hasCamera(CameraSelector cameraSelector) {
    if (cameraSelector is! CameraSelectorImpl) {
      throw TypeError();
    }
    return api.hasCamera(cameraSelector.api);
  }

  @override
  Future<CameraSelector> getCameraSelector() =>
      api.getCameraSelector().then((e) => e.impl);

  @override
  Future<void> setCameraSelector(CameraSelector cameraSelector) {
    if (cameraSelector is! CameraSelectorImpl) {
      throw TypeError();
    }
    return api.setCameraSelector(cameraSelector.api);
  }

  @override
  Future<CameraInfo?> getCameraInfo() =>
      api.getCameraInfo().then((e) => e?.impl);

  @override
  Future<CameraControl?> getCameraControl() =>
      api.getCameraControl().then((e) => e?.impl);

  @override
  Future<void> bind() => api.bindToLifecycle();

  @override
  Future<void> unbind() => api.unbind();

  @override
  Future<TorchState?> getTorchState() =>
      api.getTorchState().then((e) => e.getValue()).then((e) => e?.impl);

  @override
  Future<void> enableTorch(bool enabled) => api.enableTorch(enabled);

  @override
  Future<ZoomState?> getZoomState() =>
      api.getZoomState().then((e) => e.getValue()).then((e) => e?.impl);

  @override
  Future<void> setZoomRatio(double zoomRatio) => api.setZoomRatio(zoomRatio);

  @override
  Future<void> setLinearZoom(double linearZoom) =>
      api.setLinearZoom(linearZoom);

  @override
  Future<bool> isPinchToZoomEnabled() => api.isPinchToZoomEnabled();

  @override
  Future<void> setPinchToZoomEnabled(bool enabled) =>
      api.setPinchToZoomEnabled(enabled);

  @override
  Future<bool> isTapToFocusEnabled() => api.isTapToFocusEnabled();

  @override
  Future<void> setTapToFocusEnabled(bool enabled) =>
      api.setTapToFocusEnabled(enabled);

  @override
  Future<bool> isImageCaptureEnabled() => api.isImageCaptureEnabled();

  @override
  Future<bool> isImageAnalysisEnabled() => api.isImageAnalysisEnabled();

  @override
  Future<bool> isVideoCaptureEnabled() => api.isVideoCaptureEnabled();

  @override
  Future<void> setEnabledUseCases(List<UseCase> useCases) {
    final useCaseApis = useCases.map((e) => e.api).toList();
    return api.setEnabledUseCases(useCaseApis);
  }

  @override
  Future<ResolutionSelector?> getPreviewResolutionSelector() =>
      api.getPreviewResolutionSelector().then((e) => e?.impl);

  @override
  Future<void> setPreviewResolutionSelector(
          ResolutionSelector? resolutionSelector) =>
      api.setPreviewResolutionSelector(resolutionSelector?.api);

  @override
  Future<ResolutionSelector?> getImageCaptureResolutionSelector() =>
      api.getImageCaptureResolutionSelector().then((e) => e?.impl);

  @override
  Future<void> setImageCaptureResolutionSelector(
          ResolutionSelector? resolutionSelector) =>
      api.setImageCaptureResolutionSelector(resolutionSelector?.api);

  @override
  Future<CaptureMode> getImageCaptureMode() =>
      api.getImageCaptureMode().then((e) => e.impl);

  @override
  Future<void> setImageCaptureMode(CaptureMode captureMode) =>
      api.setImageCaptureMode(captureMode.api);

  @override
  Future<FlashMode> getImageCaptureFlashMode() =>
      api.getImageCaptureFlashMode().then((e) => e.impl);

  @override
  Future<void> setImageCaptureFlashMode(FlashMode flashMode) =>
      api.setImageCaptureFlashMode(flashMode.api);

  @override
  Future<void> takePicture({
    CaptureStartedCallback? onCaptureStarted,
    CaptureProcessProgressedCallback? onCaptureProcessProgressed,
    PostviewBitmapAvailableCallback? onPostviewBitmapAvailable,
    CaptureSuccessCallback? onCaptureSuccess,
    CaptureErrorCallback? onError,
  }) {
    final callbackApi = OnImageCapturedCallbackApi(
      onCaptureStarted:
          onCaptureStarted == null ? null : (_) => onCaptureStarted(),
      onCaptureProcessProgressed: onCaptureProcessProgressed == null
          ? null
          : (_, progress) => onCaptureProcessProgressed(progress),
      onPostviewBitmapAvailable: onPostviewBitmapAvailable == null
          ? null
          : (_, bitmapApi) async {
              final bitmap = await _decodeImage(bitmapApi);
              onPostviewBitmapAvailable(bitmap);
            },
      onCaptureSuccess:
          onCaptureSuccess == null ? null : (_, e) => onCaptureSuccess(e.impl),
      onError: onError == null
          ? null
          : (_, exceptionApi) => onError(exceptionApi.impl),
    );
    return api.takePicture(callbackApi);
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
  Future<ResolutionSelector?> getImageAnalysisResolutionSelector() =>
      api.getImageAnalysisResolutionSelector().then((e) => e?.impl);

  @override
  Future<void> setImageAnalysisResolutionSelector(
          ResolutionSelector? resolutionSelector) =>
      api.setImageAnalysisResolutionSelector(resolutionSelector?.api);

  @override
  Future<BackpressureStrategy> getImageAnalysisBackpressureStrategy() =>
      api.getImageAnalysisBackpressureStrategy().then((e) => e.impl);

  @override
  Future<void> setImageAnalysisBackpressureStrategy(
          BackpressureStrategy strategy) =>
      api.setImageAnalysisBackpressureStrategy(strategy.api);

  @override
  Future<int> getImageAnalysisImageQueueDepth() =>
      api.getImageAnalysisImageQueueDepth();

  @override
  Future<void> setImageAnalysisImageQueueDepth(int depth) =>
      api.setImageAnalysisImageQueueDepth(depth);

  @override
  Future<ImageFormat> getImageAnalysisOutputImageFormat() =>
      api.getImageAnalysisOutputImageFormat().then((e) => e.impl);

  @override
  Future<void> setImageAnalysisOutputImageFormat(ImageFormat format) =>
      api.setImageAnalysisOutputImageFormat(format.api);

  @override
  Future<void> setImageAnalysisAnalyzer(Analyzer analyzer) {
    if (analyzer is! AnalyzerImpl) {
      throw TypeError();
    }
    return api.setImageAnalysisAnalyzer(analyzer.api);
  }

  @override
  Future<void> clearImageAnalysisAnalyzer() => api.clearImageAnalysisAnalyzer();

  @override
  Future<DynamicRange> getVideoCaptureDynamicRange() =>
      api.getVideoCaptureDynamicRange().then((e) => e.impl);

  @override
  Future<void> setVideoCaptureDynamicRange(DynamicRange dynamicRange) =>
      api.setVideoCaptureDynamicRange(dynamicRange.api);

  @override
  Future<MirrorMode> getVideoCaptureMirrorMode() =>
      api.getVideoCaptureMirrorMode().then((e) => e.impl);

  @override
  Future<void> setVideoCaptureMirrorMode(MirrorMode mirrorMode) =>
      api.setVideoCaptureMirrorMode(mirrorMode.api);

  @override
  Future<QualitySelector> getVideoCaptureQualitySelector() =>
      api.getVideoCaptureQualitySelector().then((e) => e.impl);

  @override
  Future<void> setVideoCaptureQualitySelector(QualitySelector qualitySelector) {
    if (qualitySelector is! QualitySelectorImpl) {
      throw TypeError();
    }
    return api.setVideoCaptureQualitySelector(qualitySelector.api);
  }

  @override
  Future<Range<int>> getVideoCaptureTargetFrameRate() =>
      api.getVideoCaptureTargetFrameRate().then((e) => e.impl);

  @override
  Future<void> setVideoCaptureTargetFrameRate(Range<int> targetFrameRate) =>
      api.setVideoCaptureTargetFrameRate(targetFrameRate.intRangeApi);

  @override
  Future<bool> isRecording() => api.isRecording();

  @override
  Future<Recording> startRecording(
    FileOutputOptions outputOptions, {
    required AudioConfig audioConfig,
    required VideoRecordEventConsumer listener,
  }) {
    if (outputOptions is! FileOutputOptionsImpl) {
      throw TypeError();
    }
    return api
        .startRecording(
          outputOptions.api,
          audioConfig.api,
          VideoRecordEventConsumerApi(
            accept: (_, eventApi) => listener(eventApi.impl),
          ),
        )
        .then((e) => e.impl);
  }
}
