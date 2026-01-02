import 'dart:async';

import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_android/src/video.dart';
import 'package:camerax_android/src/view.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class CameraControllerImpl implements CameraController {
  final LifecycleCameraControllerProxyApi api;

  CameraControllerImpl.internal(this.api);

  @override
  Future<bool> hasCamera(CameraSelector cameraSelector) =>
      api.hasCamera(cameraSelector.api);

  @override
  Future<CameraSelector> getCameraSelector() =>
      api.getCameraSelector().then((e) => e.impl);

  @override
  Future<void> setCameraSelector(CameraSelector cameraSelector) =>
      api.setCameraSelector(cameraSelector.api);

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
      api.getTorchState().then((e) => e?.impl);

  @override
  Future<void> enableTorch(bool enabled) => api.enableTorch(enabled);

  @override
  Future<ZoomState?> getZoomState() => api.getZoomState().then((e) => e?.impl);

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
  Future<void> setEnabledUseCases(List<CameraController$UseCase> useCases) {
    final useCaseApis = useCases.map((e) => e.api).toList();
    return api.setEnabledUseCases(useCaseApis);
  }

  @override
  Future<ResolutionSelector?> getPreviewResolutionSelector() =>
      api.getPreviewResolutionSelector().then((e) => e?.impl);

  @override
  Future<void> setPreviewResolutionSelector(
    ResolutionSelector? resolutionSelector,
  ) => api.setPreviewResolutionSelector(resolutionSelector?.api);

  @override
  Future<ResolutionSelector?> getImageCaptureResolutionSelector() =>
      api.getImageCaptureResolutionSelector().then((e) => e?.impl);

  @override
  Future<void> setImageCaptureResolutionSelector(
    ResolutionSelector? resolutionSelector,
  ) => api.setImageCaptureResolutionSelector(resolutionSelector?.api);

  @override
  Future<ImageCapture$CaptureMode> getImageCaptureMode() =>
      api.getImageCaptureMode().then((e) => e.impl);

  @override
  Future<void> setImageCaptureMode(ImageCapture$CaptureMode captureMode) =>
      api.setImageCaptureMode(captureMode.api);

  @override
  Future<ImageCapture$FlashMode> getImageCaptureFlashMode() =>
      api.getImageCaptureFlashMode().then((e) => e.impl);

  @override
  Future<void> setImageCaptureFlashMode(ImageCapture$FlashMode flashMode) =>
      api.setImageCaptureFlashMode(flashMode.api);

  @override
  Future<void> takePicture(
    ImageCapture$OnImageCapturedCallback imageCapturedCallback,
  ) => api.takePicture1(imageCapturedCallback.api);

  @override
  Future<ResolutionSelector?> getImageAnalysisResolutionSelector() =>
      api.getImageAnalysisResolutionSelector().then((e) => e?.impl);

  @override
  Future<void> setImageAnalysisResolutionSelector(
    ResolutionSelector? resolutionSelector,
  ) => api.setImageAnalysisResolutionSelector(resolutionSelector?.api);

  @override
  Future<ImageAnalysis$Strategy> getImageAnalysisBackpressureStrategy() =>
      api.getImageAnalysisBackpressureStrategy().then((e) => e.impl);

  @override
  Future<void> setImageAnalysisBackpressureStrategy(
    ImageAnalysis$Strategy strategy,
  ) => api.setImageAnalysisBackpressureStrategy(strategy.api);

  @override
  Future<int> getImageAnalysisImageQueueDepth() =>
      api.getImageAnalysisImageQueueDepth();

  @override
  Future<void> setImageAnalysisImageQueueDepth(int depth) =>
      api.setImageAnalysisImageQueueDepth(depth);

  @override
  Future<ImageAnalysis$OutputImageFormat> getImageAnalysisOutputImageFormat() =>
      api.getImageAnalysisOutputImageFormat().then((e) => e.impl);

  @override
  Future<void> setImageAnalysisOutputImageFormat(
    ImageAnalysis$OutputImageFormat format,
  ) => api.setImageAnalysisOutputImageFormat(format.api);

  @override
  Future<void> setImageAnalysisAnalyzer(ImageAnalysis$Analyzer analyzer) =>
      api.setImageAnalysisAnalyzer(analyzer.api);

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
  Future<void> setVideoCaptureQualitySelector(
    QualitySelector qualitySelector,
  ) => api.setVideoCaptureQualitySelector(qualitySelector.api);

  @override
  Future<Range<int>> getVideoCaptureTargetFrameRate() =>
      api.getVideoCaptureTargetFrameRate().then((e) => e.impl);

  @override
  Future<void> setVideoCaptureTargetFrameRate(Range<int> targetFrameRate) =>
      api.setVideoCaptureTargetFrameRate(targetFrameRate.intApi);

  @override
  Future<bool> isRecording() => api.isRecording();

  @override
  Future<Recording> startRecording({
    required FileOutputOptions outputOptions,
    required AudioConfig audioConfig,
    required Consumer<VideoRecordEvent> listener,
  }) => api
      .startRecording1(outputOptions.api, audioConfig.api, listener.api)
      .then((e) => e.impl);

  @override
  Future<void> observeTorchState(Observer<TorchState> observer) =>
      api.observeTorchState(observer.api);

  @override
  Future<void> observeZoomState(Observer<ZoomState> observer) =>
      api.observeZoomState(observer.api);

  @override
  Future<void> removeTorchStateObserver(Observer<TorchState> observer) =>
      api.removeTorchStateObserver(observer.api);

  @override
  Future<void> removeZoomStateObserver(Observer<ZoomState> observer) =>
      api.removeZoomStateObserver(observer.api);

  @override
  Future<TapToFocusInfo?> getTapToFocusInfoState() =>
      api.getTapToFocusInfoState().then((e) => e?.impl);

  @override
  Future<void> observeTapToFocusInfoState(Observer<TapToFocusInfo> observer) =>
      api.observeTapToFocusInfoState(observer.api);

  @override
  Future<void> removeTapToFocusInfoStateObserver(
    Observer<TapToFocusInfo> observer,
  ) => api.removeTapToFocusInfoStateObserver(observer.api);

  @override
  Future<void> setTapToFocusAutoCancelDuration(Duration duration) =>
      api.setTapToFocusAutoCancelDuration(
        duration.inMicroseconds,
        TimeUnitApi.microseconds,
      );
}

final class CameraControllerChannelImpl extends CameraControllerChannel {
  @override
  CameraController create() {
    final api = LifecycleCameraControllerProxyApi();
    return CameraControllerImpl.internal(api);
  }
}

extension CameraControllerTapToFocusApiX on CameraControllerTapToFocusApi {
  CameraController$TapToFocus get impl =>
      CameraController$TapToFocus.values[index];
}

extension CameraController$UseCaseX on CameraController$UseCase {
  CameraControllerUseCaseApi get api =>
      CameraControllerUseCaseApi.values[index];
}

extension CameraControllerX on CameraController {
  CameraControllerProxyApi get api {
    final impl = this;
    if (impl is! CameraControllerImpl) throw TypeError();
    return impl.api;
  }
}
