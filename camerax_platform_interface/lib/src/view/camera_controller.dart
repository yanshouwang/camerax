import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';
import 'package:camerax_platform_interface/src/video.dart';

import 'use_case.dart';
import 'video.dart';

typedef VideoRecordEventConsumer = void Function(VideoRecordEvent event);

abstract base class CameraController {
  CameraController.impl();

  factory CameraController() => CameraXPlugin.instance.newCameraController();

  Stream<ZoomState> get zoomStateChanged;
  Stream<TorchState> get torchStateChanged;

  Future<void> initialize();

  Future<void> bind();
  Future<void> unbind();
  Future<bool> hasCamera(CameraSelector cameraSelector);
  Future<CameraSelector> getCameraSelector();
  Future<void> setCameraSelector(CameraSelector cameraSelector);
  Future<CameraInfo?> getCameraInfo();
  Future<CameraControl?> getCameraControl();
  Future<TorchState?> getTorchState();
  Future<void> enableTorch(bool enabled);
  Future<ZoomState?> getZoomState();
  Future<void> setZoomRatio(double zoomRatio);
  Future<void> setLinearZoom(double linearZoom);
  Future<bool> isPinchToZoomEnabled();
  Future<void> setPinchToZoomEnabled(bool enabled);
  Future<bool> isTapToFocusEnabled();
  Future<void> setTapToFocusEnabled(bool enabled);
  Future<bool> isImageAnalysisEnabled();
  Future<bool> isImageCaptureEnabled();
  Future<bool> isVideoCaptureEnabled();
  Future<void> setEnabledUseCases(List<UseCase> useCases);
  Future<ResolutionSelector?> getPreviewResolutionSelector();
  Future<void> setPreviewResolutionSelector(
      ResolutionSelector? resolutionSelector);
  Future<FlashMode> getImageCaptureFlashMode();
  Future<void> setImageCaptureFlashMode(FlashMode flashMode);
  Future<CaptureMode> getImageCaptureMode();
  Future<void> setImageCaptureMode(CaptureMode captureMode);
  Future<ResolutionSelector?> getImageCaptureResolutionSelector();
  Future<void> setImageCaptureResolutionSelector(
      ResolutionSelector? resolutionSelector);
  Future<void> takePicture({
    CaptureStartedCallback? onCaptureStarted,
    CaptureProcessProgressedCallback? onCaptureProcessProgressed,
    PostviewBitmapAvailableCallback? onPostviewBitmapAvailable,
    CaptureSuccessCallback? onCaptureSuccess,
    CaptureErrorCallback? onError,
  });
  Future<BackpressureStrategy> getImageAnalysisBackpressureStrategy();
  Future<void> setImageAnalysisBackpressureStrategy(
      BackpressureStrategy strategy);
  Future<int> getImageAnalysisImageQueueDepth();
  Future<void> setImageAnalysisImageQueueDepth(int depth);
  Future<ImageFormat> getImageAnalysisOutputImageFormat();
  Future<void> setImageAnalysisOutputImageFormat(ImageFormat format);
  Future<ResolutionSelector?> getImageAnalysisResolutionSelector();
  Future<void> setImageAnalysisResolutionSelector(
      ResolutionSelector? resolutionSelector);
  Future<void> setImageAnalysisAnalyzer(Analyzer analyzer);
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
    required VideoRecordEventConsumer listener,
  });
}
