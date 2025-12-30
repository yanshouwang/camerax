import 'dart:async';

import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_ios/src/core.dart';
import 'package:camerax_ios/src/video.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

// import 'tap_to_focus_info_impl.dart';
import 'video.dart';

final class CameraControllerImpl extends CameraController {
  final CameraControllerProxyApi api;

  CameraControllerImpl.internal(this.api) : super.impl();

  factory CameraControllerImpl() {
    final api = CameraControllerProxyApi();
    return CameraControllerImpl.internal(api);
  }

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
  Future<void> bind() => api.bind();

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
      throw UnimplementedError();
  // api.getPreviewResolutionSelector().then((e) => e?.impl);

  @override
  Future<void> setPreviewResolutionSelector(
    ResolutionSelector? resolutionSelector,
  ) => throw UnimplementedError();
  // api.setPreviewResolutionSelector(resolutionSelector?.api);

  @override
  Future<ResolutionSelector?> getImageCaptureResolutionSelector() =>
      throw UnimplementedError();
  // api.getImageCaptureResolutionSelector().then((e) => e?.impl);

  @override
  Future<void> setImageCaptureResolutionSelector(
    ResolutionSelector? resolutionSelector,
  ) => throw UnimplementedError();
  // api.setImageCaptureResolutionSelector(resolutionSelector?.api);

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
      throw UnimplementedError();
  // api.getVideoCaptureDynamicRange().then((e) => e.impl);

  @override
  Future<void> setVideoCaptureDynamicRange(DynamicRange dynamicRange) =>
      throw UnimplementedError();
  // api.setVideoCaptureDynamicRange(dynamicRange.api);

  @override
  Future<MirrorMode> getVideoCaptureMirrorMode() =>
      api.getVideoCaptureMirrorMode().then((e) => e.impl);

  @override
  Future<void> setVideoCaptureMirrorMode(MirrorMode mirrorMode) =>
      api.setVideoCaptureMirrorMode(mirrorMode.api);

  @override
  Future<QualitySelector> getVideoCaptureQualitySelector() =>
      throw UnimplementedError();
  // api.getVideoCaptureQualitySelector().then((e) => e.impl);

  @override
  Future<void> setVideoCaptureQualitySelector(
    QualitySelector qualitySelector,
  ) => throw UnimplementedError();
  // api.setVideoCaptureQualitySelector(qualitySelector.api);

  @override
  Future<Range<int>> getVideoCaptureTargetFrameRate() =>
      throw UnimplementedError();
  // api.getVideoCaptureTargetFrameRate().then((e) => e.impl);

  @override
  Future<void> setVideoCaptureTargetFrameRate(Range<int> targetFrameRate) =>
      throw UnimplementedError();
  // api.setVideoCaptureTargetFrameRate(targetFrameRate.intApi);

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
      throw UnimplementedError();
  // api.getTapToFocusInfoState().then((e) => e?.impl);

  @override
  Future<void> observeTapToFocusInfoState(Observer<TapToFocusInfo> observer) =>
      throw UnimplementedError();
  // api.observeTapToFocusInfoState(observer.api);

  @override
  Future<void> removeTapToFocusInfoStateObserver(
    Observer<TapToFocusInfo> observer,
  ) => throw UnimplementedError();
  // api.removeTapToFocusInfoStateObserver(observer.api);

  @override
  Future<void> setTapToFocusAutoCancelDuration(Duration duration) =>
      throw UnimplementedError();
  // api.setTapToFocusAutoCancelDuration(duration.api);
}

// extension CameraControllerTapToFocusApiX on CameraControllerTapToFocusApi {
//   CameraControllerTapToFocus get impl =>
//       CameraControllerTapToFocus.values[index];
// }

extension CameraControllerUseCaseX on CameraController$UseCase {
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
