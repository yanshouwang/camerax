import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';
import 'package:camerax_platform_interface/src/video.dart';
import 'package:camerax_platform_interface/src/view.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

enum CameraController$TapToFocus {
  notStarted,
  started,
  focused,
  notFocused,
  failed,
}

enum CameraController$UseCase { imageCapture, imageAnalysis, videoCapture }

abstract interface class CameraController {
  factory CameraController() => CameraControllerChannel.instance.create();

  Future<bool> hasCamera(CameraSelector cameraSelector);
  Future<CameraSelector> getCameraSelector();
  Future<void> setCameraSelector(CameraSelector cameraSelector);

  Future<void> bind();
  Future<void> unbind();

  Future<CameraInfo?> getCameraInfo();
  Future<CameraControl?> getCameraControl();

  Future<TorchState?> getTorchState();
  Future<void> observeTorchState(Observer<TorchState> observer);
  Future<void> removeTorchStateObserver(Observer<TorchState> observer);
  Future<void> enableTorch(bool enabled);

  Future<bool> isPinchToZoomEnabled();
  Future<void> setPinchToZoomEnabled(bool enabled);
  Future<ZoomState?> getZoomState();
  Future<void> observeZoomState(Observer<ZoomState> observer);
  Future<void> removeZoomStateObserver(Observer<ZoomState> observer);
  Future<void> setZoomRatio(double zoomRatio);
  Future<void> setLinearZoom(double linearZoom);

  Future<bool> isTapToFocusEnabled();
  Future<void> setTapToFocusEnabled(bool enabled);
  Future<void> setTapToFocusAutoCancelDuration(Duration duration);
  Future<TapToFocusInfo?> getTapToFocusInfoState();
  Future<void> observeTapToFocusInfoState(Observer<TapToFocusInfo> observer);
  Future<void> removeTapToFocusInfoStateObserver(
    Observer<TapToFocusInfo> observer,
  );

  Future<bool> isImageAnalysisEnabled();
  Future<bool> isImageCaptureEnabled();
  Future<bool> isVideoCaptureEnabled();
  Future<void> setEnabledUseCases(List<CameraController$UseCase> useCases);

  Future<ResolutionSelector?> getPreviewResolutionSelector();
  Future<void> setPreviewResolutionSelector(
    ResolutionSelector? resolutionSelector,
  );

  Future<ImageCapture$FlashMode> getImageCaptureFlashMode();
  Future<void> setImageCaptureFlashMode(ImageCapture$FlashMode flashMode);
  Future<ImageCapture$CaptureMode> getImageCaptureMode();
  Future<void> setImageCaptureMode(ImageCapture$CaptureMode captureMode);
  Future<ResolutionSelector?> getImageCaptureResolutionSelector();
  Future<void> setImageCaptureResolutionSelector(
    ResolutionSelector? resolutionSelector,
  );
  Future<void> takePicture(
    ImageCapture$OnImageCapturedCallback imageCapturedCallback,
  );
  Future<ImageAnalysis$Strategy> getImageAnalysisBackpressureStrategy();

  Future<void> setImageAnalysisBackpressureStrategy(
    ImageAnalysis$Strategy strategy,
  );
  Future<int> getImageAnalysisImageQueueDepth();
  Future<void> setImageAnalysisImageQueueDepth(int depth);
  Future<ImageAnalysis$OutputImageFormat> getImageAnalysisOutputImageFormat();
  Future<void> setImageAnalysisOutputImageFormat(
    ImageAnalysis$OutputImageFormat format,
  );
  Future<ResolutionSelector?> getImageAnalysisResolutionSelector();
  Future<void> setImageAnalysisResolutionSelector(
    ResolutionSelector? resolutionSelector,
  );
  Future<void> setImageAnalysisAnalyzer(ImageAnalysis$Analyzer analyzer);
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
  Future<Recording> startRecording({
    required FileOutputOptions outputOptions,
    required AudioConfig audioConfig,
    required Consumer<VideoRecordEvent> listener,
  });
}

abstract base class CameraControllerChannel extends PlatformInterface {
  CameraControllerChannel() : super(token: _token);

  static final _token = Object();

  static CameraControllerChannel? _instance;

  static CameraControllerChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(CameraControllerChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  CameraController create();
}
