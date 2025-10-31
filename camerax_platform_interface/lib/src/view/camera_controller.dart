import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';
import 'package:camerax_platform_interface/src/video.dart';

import 'video.dart';

enum CameraControllerUseCase { imageCapture, imageAnalysis, videoCapture }

abstract base class CameraController {
  CameraController.impl();

  factory CameraController() => CameraXPlugin.instance.newCameraController();

  Future<void> initialize();

  Future<void> bind();
  Future<void> unbind();
  Future<bool> hasCamera(CameraSelector cameraSelector);
  Future<CameraSelector> getCameraSelector();
  Future<void> setCameraSelector(CameraSelector cameraSelector);
  Future<CameraInfo?> getCameraInfo();
  Future<CameraControl?> getCameraControl();
  Future<TorchState?> getTorchState();
  Future<void> observeTorchState(Observer<TorchState> observer);
  Future<void> removeTorchStateObserver(Observer<TorchState> observer);
  Future<void> enableTorch(bool enabled);
  Future<ZoomState?> getZoomState();
  Future<void> observeZoomState(Observer<ZoomState> observer);
  Future<void> removeZoomStateObserver(Observer<ZoomState> observer);
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
  Future<ResolutionSelector?> getPreviewResolutionSelector();
  Future<void> setPreviewResolutionSelector(
    ResolutionSelector? resolutionSelector,
  );
  Future<ImageCaptureFlashMode> getImageCaptureFlashMode();
  Future<void> setImageCaptureFlashMode(ImageCaptureFlashMode flashMode);
  Future<ImageCaptureCaptureMode> getImageCaptureMode();
  Future<void> setImageCaptureMode(ImageCaptureCaptureMode captureMode);
  Future<ResolutionSelector?> getImageCaptureResolutionSelector();
  Future<void> setImageCaptureResolutionSelector(
    ResolutionSelector? resolutionSelector,
  );
  Future<void> takePicture(ImageCaptureOnImageCapturedCallback callback);
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
  Future<ResolutionSelector?> getImageAnalysisResolutionSelector();
  Future<void> setImageAnalysisResolutionSelector(
    ResolutionSelector? resolutionSelector,
  );
  Future<void> setImageAnalysisAnalyzer(ImageAnalysisAnalyzer analyzer);
  Future<void> clearImageAnalysisAnalyzer();
  Future<DynamicRange> getVideoCaptureDynamicRange();
  Future<void> setVideoCaptureDynamicRange(DynamicRange dynamicRange);
  Future<MirrorMode> getVideoCaptureMirrorMode();
  Future<void> setVideoCaptureMirrorMode(MirrorMode mirrorMode);
  Future<QualitySelector> getVideoCaptureQualitySelector();
  Future<void> setVideoCaptureQualitySelector(QualitySelector qualitySelector);
  Future<Range<int>> getVideoCaptureTargetFrameRate();
  Future<void> setVideoCaptureTargetFrameRate(Range<int> targetFrameRate);
  Future<bool> isRecording();
  Future<Recording> startRecording(
    FileOutputOptions outputOptions, {
    required AudioConfig audioConfig,
    required Consumer<VideoRecordEvent> listener,
  });
}
