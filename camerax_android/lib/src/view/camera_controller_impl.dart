import 'dart:async';

import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_android/src/video.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'video.dart';

final class CameraControllerImpl extends CameraControllerApi {
  final LifecycleCameraControllerApi api;

  CameraControllerImpl.internal(this.api) : super.impl();

  factory CameraControllerImpl() {
    final api = LifecycleCameraControllerApi();
    return CameraControllerImpl.internal(api);
  }

  @override
  Future<void> initialize() => api.initialize();

  @override
  Future<bool> hasCamera(CameraSelectorApi cameraSelector) =>
      api.hasCamera(cameraSelector.api);

  @override
  Future<CameraSelectorApi> getCameraSelector() =>
      api.getCameraSelector().then((e) => e.impl);

  @override
  Future<void> setCameraSelector(CameraSelectorApi cameraSelector) =>
      api.setCameraSelector(cameraSelector.api);

  @override
  Future<CameraInfoApi?> getCameraInfo() =>
      api.getCameraInfo().then((e) => e?.impl);

  @override
  Future<CameraControlApi?> getCameraControl() =>
      api.getCameraControl().then((e) => e?.impl);

  @override
  Future<void> bind() => api.bindToLifecycle();

  @override
  Future<void> unbind() => api.unbind();

  @override
  Future<TorchState?> getTorchState() =>
      api.getTorchState().then((e) => e?.impl);

  @override
  Future<void> enableTorch(bool enabled) => api.enableTorch(enabled);

  @override
  Future<ZoomStateApi?> getZoomState() => api.getZoomState().then((e) => e?.impl);

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
  Future<void> setEnabledUseCases(List<CameraControllerUseCase> useCases) {
    final useCaseApis = useCases.map((e) => e.api).toList();
    return api.setEnabledUseCases(useCaseApis);
  }

  @override
  Future<ResolutionSelectorApi?> getPreviewResolutionSelector() =>
      api.getPreviewResolutionSelector().then((e) => e?.impl);

  @override
  Future<void> setPreviewResolutionSelector(
    ResolutionSelectorApi? resolutionSelector,
  ) => api.setPreviewResolutionSelector(resolutionSelector?.api);

  @override
  Future<ResolutionSelectorApi?> getImageCaptureResolutionSelector() =>
      api.getImageCaptureResolutionSelector().then((e) => e?.impl);

  @override
  Future<void> setImageCaptureResolutionSelector(
    ResolutionSelectorApi? resolutionSelector,
  ) => api.setImageCaptureResolutionSelector(resolutionSelector?.api);

  @override
  Future<ImageCaptureCaptureMode> getImageCaptureMode() =>
      api.getImageCaptureMode().then((e) => e.impl);

  @override
  Future<void> setImageCaptureMode(ImageCaptureCaptureMode captureMode) =>
      api.setImageCaptureMode(captureMode.api);

  @override
  Future<ImageCaptureFlashMode> getImageCaptureFlashMode() =>
      api.getImageCaptureFlashMode().then((e) => e.impl);

  @override
  Future<void> setImageCaptureFlashMode(ImageCaptureFlashMode flashMode) =>
      api.setImageCaptureFlashMode(flashMode.api);

  @override
  Future<void> takePicture(ImageCaptureOnImageCapturedCallbackApi callback) =>
      api.takePicture(callback.api);

  @override
  Future<ResolutionSelectorApi?> getImageAnalysisResolutionSelector() =>
      api.getImageAnalysisResolutionSelector().then((e) => e?.impl);

  @override
  Future<void> setImageAnalysisResolutionSelector(
    ResolutionSelectorApi? resolutionSelector,
  ) => api.setImageAnalysisResolutionSelector(resolutionSelector?.api);

  @override
  Future<ImageAnalysisStrategy> getImageAnalysisBackpressureStrategy() =>
      api.getImageAnalysisBackpressureStrategy().then((e) => e.impl);

  @override
  Future<void> setImageAnalysisBackpressureStrategy(
    ImageAnalysisStrategy strategy,
  ) => api.setImageAnalysisBackpressureStrategy(strategy.api);

  @override
  Future<int> getImageAnalysisImageQueueDepth() =>
      api.getImageAnalysisImageQueueDepth();

  @override
  Future<void> setImageAnalysisImageQueueDepth(int depth) =>
      api.setImageAnalysisImageQueueDepth(depth);

  @override
  Future<ImageAnalysisOutputImageFormat> getImageAnalysisOutputImageFormat() =>
      api.getImageAnalysisOutputImageFormat().then((e) => e.impl);

  @override
  Future<void> setImageAnalysisOutputImageFormat(
    ImageAnalysisOutputImageFormat format,
  ) => api.setImageAnalysisOutputImageFormat(format.api);

  @override
  Future<void> setImageAnalysisAnalyzer(ImageAnalysisAnalyzerApi analyzer) =>
      api.setImageAnalysisAnalyzer(analyzer.api);

  @override
  Future<void> clearImageAnalysisAnalyzer() => api.clearImageAnalysisAnalyzer();

  @override
  Future<DynamicRangeApi> getVideoCaptureDynamicRange() =>
      api.getVideoCaptureDynamicRange().then((e) => e.impl);

  @override
  Future<void> setVideoCaptureDynamicRange(DynamicRangeApi dynamicRange) =>
      api.setVideoCaptureDynamicRange(dynamicRange.api);

  @override
  Future<MirrorMode> getVideoCaptureMirrorMode() =>
      api.getVideoCaptureMirrorMode().then((e) => e.impl);

  @override
  Future<void> setVideoCaptureMirrorMode(MirrorMode mirrorMode) =>
      api.setVideoCaptureMirrorMode(mirrorMode.api);

  @override
  Future<QualitySelectorApi> getVideoCaptureQualitySelector() =>
      api.getVideoCaptureQualitySelector().then((e) => e.impl);

  @override
  Future<void> setVideoCaptureQualitySelector(
    QualitySelectorApi qualitySelector,
  ) => api.setVideoCaptureQualitySelector(qualitySelector.api);

  @override
  Future<Range<int>> getVideoCaptureTargetFrameRate() =>
      api.getVideoCaptureTargetFrameRate().then((e) => e.impl);

  @override
  Future<void> setVideoCaptureTargetFrameRate(Range<int> targetFrameRate) =>
      api.setVideoCaptureTargetFrameRate(targetFrameRate.intRangeApi);

  @override
  Future<bool> isRecording() => api.isRecording();

  @override
  Future<RecordingApi> startRecording(
    FileOutputOptionsApi outputOptions, {
    required AudioConfigApi audioConfig,
    required ConsumerApi<VideoRecordEventApi> listener,
  }) => api
      .startRecording(
        outputOptions.api,
        audioConfig.api,
        listener.videoRecordEventConsumerApi,
      )
      .then((e) => e.impl);

  @override
  Future<void> observeTorchState(ObserverApi<TorchState> observer) =>
      api.observeTorchState(observer.torchStateObserverApi);

  @override
  Future<void> observeZoomState(ObserverApi<ZoomStateApi> observer) =>
      api.observeZoomState(observer.zoomStateObserverApi);

  @override
  Future<void> removeTorchStateObserver(ObserverApi<TorchState> observer) =>
      api.removeTorchStateObserver(observer.torchStateObserverApi);

  @override
  Future<void> removeZoomStateObserver(ObserverApi<ZoomStateApi> observer) =>
      api.removeZoomStateObserver(observer.zoomStateObserverApi);
}

extension CameraControllerUseCaseX on CameraControllerUseCase {
  CameraControllerUseCaseApi get api =>
      CameraControllerUseCaseApi.values[index];
}

extension CameraControllerX on CameraControllerApi {
  CameraControllerApi get api {
    final impl = this;
    if (impl is! CameraControllerImpl) throw TypeError();
    return impl.api;
  }
}
