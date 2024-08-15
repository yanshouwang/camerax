import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/core.dart';
import 'package:camerax_platform_interface/src/video.dart';
import 'package:hybrid_logging/hybrid_logging.dart';

typedef VideoRecordEventCallback = void Function(VideoRecordEvent event);

abstract interface class CameraController implements LogController {
  Stream<ZoomState?> get zoomStateChanged;
  Stream<bool?> get torchStateChanged;

  Future<bool> checkAuthorization({
    required AuthorizationType type,
  });
  Future<bool> requestAuthorization({
    required AuthorizationType type,
  });
  Future<void> bind();
  Future<void> unbind();
  Future<bool> hasCamera(CameraSelector cameraSelector);
  Future<CameraSelector> getCameraSelector();
  Future<void> setCameraSelector(CameraSelector cameraSelector);
  Future<bool> isTapToFocusEnabled();
  Future<void> setTapToFocusEnabled(bool enabled);
  Future<bool> isPinchToZoomEnabled();
  Future<void> setPinchToZoomEnabled(bool enabled);
  Future<ZoomState?> getZoomState();
  Future<void> setZoomRatio(double zoomRatio);
  Future<void> setLinearZoom(double linearZoom);
  Future<bool?> getTorchState();
  Future<void> enableTorch(bool torchEnabled);
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
  Future<ImageProxy> takePictureToMemory();
  Future<Uri> takePictureToAlbum({
    String? name,
  });
  Future<DynamicRange> getVideoCaptureDynamicRange();
  Future<void> setVideoCaptureDynamicRange(DynamicRange dynamicRange);
  Future<MirrorMode> getVideoCaptureMirrorMode();
  Future<void> setVideoCaptureMirrorMode(MirrorMode mirrorMode);
  Future<QualitySelector> getVideoCaptureQualitySelector();
  Future<void> setVideoCaptureQualitySelector(QualitySelector qualitySelector);
  Future<Range<int>> getVideoCaptureTargetFrameRate();
  Future<void> setVideoCaptureTargetFrameRate(Range<int> targetFrameRate);
  Future<bool> isRecording();
  Future<Recording> startRecording({
    String? name,
    required bool enableAudio,
    required VideoRecordEventCallback listener,
  });
  Future<BackpressureStrategy> getImageAnalysisBackpressureStrategy();
  Future<void> setImageAnalysisBackpressureStrategy(
      BackpressureStrategy strategy);
  Future<int> getImageAnalysisImageQueueDepth();
  Future<void> setImageAnalysisImageQueueDepth(int depth);
  Future<OutputImageFormat> getImageAnalysisOutputImageFormat();
  Future<void> setImageAnalysisOutputImageFormat(
      OutputImageFormat imageAnalysisOutputImageFormat);
  Future<ResolutionSelector?> getImageAnalysisResolutionSelector();
  Future<void> setImageAnalysisResolutionSelector(
      ResolutionSelector? resolutionSelector);
  Future<void> setImageAnalysisAnalyzer(Analyzer analyzer);
  Future<void> clearImageAnalysisAnalyzer();

  factory CameraController() {
    return CameraXPlugin.instance.createCameraController();
  }
}
