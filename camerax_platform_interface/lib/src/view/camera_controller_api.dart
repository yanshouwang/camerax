import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';
import 'package:camerax_platform_interface/src/video.dart';

import 'video.dart';

enum CameraControllerUseCase { imageCapture, imageAnalysis, videoCapture }

abstract base class CameraControllerApi {
  CameraControllerApi.impl();

  factory CameraControllerApi() =>
      CameraXPlugin.instance.$CameraControllerApi();

  Future<void> initialize();
  Future<void> bind();
  Future<void> unbind();
  Future<bool> hasCamera(CameraSelectorApi cameraSelector);
  Future<CameraSelectorApi> getCameraSelector();
  Future<void> setCameraSelector(CameraSelectorApi cameraSelector);
  Future<CameraInfoApi?> getCameraInfo();
  Future<CameraControlApi?> getCameraControl();
  Future<TorchState?> getTorchState();
  Future<void> observeTorchState(TorchStateObserverApi observer);
  Future<void> removeTorchStateObserver(TorchStateObserverApi observer);
  Future<void> enableTorch(bool enabled);
  Future<ZoomStateApi?> getZoomState();
  Future<void> observeZoomState(ZoomStateObserverApi observer);
  Future<void> removeZoomStateObserver(ZoomStateObserverApi observer);
  Future<void> setZoomRatio(double zoomRatio);
  Future<void> setLinearZoom(double linearZoom);
  Future<bool> isPinchToZoomEnabled();
  Future<void> setPinchToZoomEnabled(bool enabled);
  Future<bool> isTapToFocusEnabled();
  Future<void> setTapToFocusEnabled(bool enabled);
  Future<bool> isImageAnalysisEnabled();
  Future<bool> isImageCaptureEnabled();
  Future<bool> isVideoCaptureEnabled();
  Future<void> setEnabledUseCases(List<CameraControllerUseCase> useCases);
  Future<ResolutionSelectorApi?> getPreviewResolutionSelector();
  Future<void> setPreviewResolutionSelector(
    ResolutionSelectorApi? resolutionSelector,
  );
  Future<ImageCaptureFlashMode> getImageCaptureFlashMode();
  Future<void> setImageCaptureFlashMode(ImageCaptureFlashMode flashMode);
  Future<ImageCaptureCaptureMode> getImageCaptureMode();
  Future<void> setImageCaptureMode(ImageCaptureCaptureMode captureMode);
  Future<ResolutionSelectorApi?> getImageCaptureResolutionSelector();
  Future<void> setImageCaptureResolutionSelector(
    ResolutionSelectorApi? resolutionSelector,
  );
  Future<void> takePicture(ImageCaptureOnImageCapturedCallbackApi callback);
  Future<ImageAnalysisStrategy> getImageAnalysisBackpressureStrategy();
  Future<void> setImageAnalysisBackpressureStrategy(
    ImageAnalysisStrategy strategy,
  );
  Future<int> getImageAnalysisImageQueueDepth();
  Future<void> setImageAnalysisImageQueueDepth(int depth);
  Future<ImageAnalysisOutputImageFormat> getImageAnalysisOutputImageFormat();
  Future<void> setImageAnalysisOutputImageFormat(
    ImageAnalysisOutputImageFormat format,
  );
  Future<ResolutionSelectorApi?> getImageAnalysisResolutionSelector();
  Future<void> setImageAnalysisResolutionSelector(
    ResolutionSelectorApi? resolutionSelector,
  );
  Future<void> setImageAnalysisAnalyzer(ImageAnalysisAnalyzerApi analyzer);
  Future<void> clearImageAnalysisAnalyzer();
  Future<DynamicRangeApi> getVideoCaptureDynamicRange();
  Future<void> setVideoCaptureDynamicRange(DynamicRangeApi dynamicRange);
  Future<MirrorMode> getVideoCaptureMirrorMode();
  Future<void> setVideoCaptureMirrorMode(MirrorMode mirrorMode);
  Future<QualitySelectorApi> getVideoCaptureQualitySelector();
  Future<void> setVideoCaptureQualitySelector(
    QualitySelectorApi qualitySelector,
  );
  Future<RangeApi> getVideoCaptureTargetFrameRate();
  Future<void> setVideoCaptureTargetFrameRate(RangeApi targetFrameRate);
  Future<bool> isRecording();
  Future<RecordingApi> startRecording(
    FileOutputOptionsApi outputOptions, {
    required AudioConfigApi audioConfig,
    required VideoRecordEventConsumerApi listener,
  });
}
