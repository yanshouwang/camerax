// Run with `dart run pigeon --input api.dart`.
import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/legacy/camerax.g.dart',
    kotlinOut:
        'android/src/main/kotlin/dev/hebei/camerax_android/legacy/CameraX.g.kt',
    kotlinOptions: KotlinOptions(
      package: 'dev.hebei.camerax_android.legacy',
      errorClassName: 'CameraXError',
    ),
  ),
)
enum Permission {
  album,
  audio,
  video,
}

enum LensFacing {
  unknown,
  front,
  back,
  external,
}

enum CameraState {
  pendingOpen,
  opening,
  open,
  closing,
  closed,
}

enum MeteringMode {
  af,
  ae,
  awb,
}

enum TimeUnit {
  nanoseconds,
  microseconds,
  milliseconds,
  seconds,
  minutes,
  hours,
  days,
}

enum Encoding {
  unspecified,
  sdr,
  hdrUnspecified,
  hlg,
  hdr10,
  hdr10Plus,
  dolbyVision,
}

enum BitDepth {
  bitDepthUnspecified,
  bitDepth8Bit,
  bitDepth10Bit,
}

enum ScaleType {
  fillStart,
  fillCenter,
  fillEnd,
  fitStart,
  fitCenter,
  fitEnd,
}

enum UseCase {
  imageCapture,
  imageAnalysis,
  videoCapture,
}

enum ResolutionMode {
  preferCaptureRateOverHigherResolution,
  preferHigherResolutionOverCaptureRate,
}

enum AspectRatio {
  ratioDefault,
  ratio4_3,
  ratio16_9,
}

enum AspectRatioFallbackRule {
  none,
  auto,
}

enum ResolutionFallbackRule {
  none,
  closestHigherThenLower,
  closestHigher,
  closestLowerThenHigher,
  closestLower,
}

enum CaptureMode {
  maximizeQuality,
  minimizeLatency,
  zeroShutterLag,
}

enum FlashMode {
  auto,
  on,
  off,
  screen,
}

enum BackpressureStrategy {
  keepOnlyLatest,
  blockProducer,
}

enum ImageFormat {
  depth16,
  depthJpeg,
  depthPointCloud,
  flexRgba8888,
  flexRgb888,
  heic,
  jpeg,
  jpegR,
  nv16,
  nv21,
  private,
  raw10,
  raw12,
  rawPrivate,
  rawSensor,
  rgb565,
  unknown,
  y8,
  ycbcrP010,
  yuv420_888,
  yuv422_888,
  yuv444_888,
  yuy2,
  yv12,
}

enum Quality {
  fhd,
  hd,
  highest,
  lowest,
  sd,
  uhd,
}

enum MirrorMode {
  off,
  on,
  onFrontOnly,
}

enum AudioState {
  active,
  disabled,
  sourceSilenced,
  encoderError,
  sourceError,
  muted,
}

enum VideoRecordFinalizeEventError {
  none,
  unknown,
  fileSizeLimitReached,
  insufficientStorage,
  sourceInactive,
  inavlidOuputOptions,
  encodingFailed,
  recorderError,
  noValidData,
  durationLimitReached,
  recordingGarbageCollected,
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.core.PermissionManager',
  ),
)
abstract class PermissionManager {
  @static
  late final PermissionManager instance;

  bool checkPermissioin(Permission permission);
  @async
  bool requestPermissions(List<Permission> permissions);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'java.lang.Throwable',
  ),
)
abstract class Throwable {
  String getCode();
  String getMessage();
  String getDetails();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'android.util.Size',
  ),
)
abstract class Size {
  Size(int width, int height);

  int getWidth();
  int getHeight();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'android.graphics.Rect',
  ),
)
abstract class Rect {
  Rect(int left, int top, int right, int bottom);

  int getWidth();
  int getHeight();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.legacy.core.IntRange.Wrapper',
  ),
)
abstract class IntRange {
  IntRange(int lower, int upper);

  int getLower();
  int getUpper();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.core.CameraSelector',
  ),
)
abstract class CameraSelector {
  @static
  late final CameraSelector front;
  @static
  late final CameraSelector back;
  @static
  late final CameraSelector external;

  CameraSelector(LensFacing? lensFacing);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.hebei.camerax_android.legacy.core.CameraStateLiveData.Wrapper',
  ),
)
abstract class CameraStateLiveData {
  CameraState? getValue();

  void observe(CameraStateObserver observer);
  void removeObserver(CameraStateObserver observer);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.hebei.camerax_android.legacy.core.CameraStateObserver.Wrapper',
  ),
)
abstract class CameraStateObserver {
  CameraStateObserver();

  late final void Function(CameraState value) onChanged;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.hebei.camerax_android.legacy.core.TorchStateLiveData.Wrapper',
  ),
)
abstract class TorchStateLiveData {
  bool? getValue();

  void observe(TorchStateObserver observer);
  void removeObserver(TorchStateObserver observer);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.hebei.camerax_android.legacy.core.TorchStateObserver.Wrapper',
  ),
)
abstract class TorchStateObserver {
  TorchStateObserver();

  late final void Function(bool value) onChanged;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.core.ZoomState',
  ),
)
abstract class ZoomState {
  double getMinZoomRatio();
  double getMaxZoomRatio();
  double getZoomRatio();
  double getLinearZoom();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.hebei.camerax_android.legacy.core.ZoomStateLiveData.Wrapper',
  ),
)
abstract class ZoomStateLiveData {
  ZoomState? getValue();

  void observe(ZoomStateObserver observer);
  void removeObserver(ZoomStateObserver observer);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.hebei.camerax_android.legacy.core.ZoomStateObserver.Wrapper',
  ),
)
abstract class ZoomStateObserver {
  ZoomStateObserver();

  late final void Function(ZoomState value) onChanged;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.core.ExposureState',
  ),
)
abstract class ExposureState {
  int getExposureCompensationIndex();
  IntRange getExposureCompensationRange();
  double getExposureCompensationStep();
  bool isExposureCompensationSupported();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.core.MeteringPoint',
  ),
)
abstract class MeteringPoint {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.hebei.camerax_android.legacy.core.MeteringPointArgs.Wrapper',
  ),
)
abstract class MeteringPointArgs {
  MeteringPointArgs(
    MeteringPoint point, {
    List<MeteringMode>? modes,
  });
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.legacy.core.DurationArgs.Wrapper',
  ),
)
abstract class DurationArgs {
  DurationArgs(int duration, TimeUnit timeUnit);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.core.FocusMeteringAction',
  ),
)
abstract class FocusMeteringAction {
  FocusMeteringAction(
    MeteringPointArgs first, {
    List<MeteringPointArgs>? others,
    bool? disableAutoCancel,
    DurationArgs? autoCancelDuration,
  });
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.core.DynamicRange',
  ),
)
abstract class DynamicRange {
  DynamicRange(Encoding encoding, BitDepth bitDepth);

  Encoding getEncoding();
  BitDepth getBitDepth();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.core.CameraInfo',
  ),
)
abstract class CameraInfo {
  @static
  bool mustPlayShutterSound();
  CameraSelector getCameraSelector();
  CameraStateLiveData getCameraState();
  TorchStateLiveData getTorchState();
  ZoomStateLiveData getZoomState();
  ExposureState getExposureState();
  double getIntrinsticZoomRatio();
  LensFacing getLensFacing();
  List<CameraInfo> getPhysicalCameraInfos();
  int getSensorRotationDegrees();
  List<IntRange> getSupportedFrameRateRanges();
  bool isLogicalMultiCameraSupported();
  bool isZslSupported();
  bool hasFlashUnit();
  bool isFocusMeteringSupported(FocusMeteringAction action);
  List<DynamicRange> querySupportedDynamicRanges(
      List<DynamicRange> candidateDynamicRanges);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.core.CameraControl',
  ),
)
abstract class CameraControl {
  @async
  void enableTorch(bool torch);
  @async
  void setZoomRatio(double ratio);
  @async
  void setLinearZoom(double linearZoom);
  @async
  void startFocusAndMetering(FocusMeteringAction action);
  @async
  void cancelFocusAndMetering();
  @async
  int setExposureCompensationIndex(int value);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.hebei.camerax_android.core.resolutionselector.AspectRatioStrategy',
  ),
)
abstract class AspectRatioStrategy {
  @static
  late final AspectRatioStrategy ratio16_9FallbackAutoStrategy;
  @static
  late final AspectRatioStrategy ratio4_3FallbackAutoStrategy;

  AspectRatioStrategy(
    AspectRatio preferredAspectRatio,
    AspectRatioFallbackRule fallbackRule,
  );

  AspectRatio getPreferredAspectRatio();
  AspectRatioFallbackRule getFallbackRule();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.hebei.camerax_android.core.resolutionselector.ResolutionFilter',
  ),
)
abstract class ResolutionFilter {
  ResolutionFilter();

  late final List<Size> Function(List<Size> supportedSizes, int rotationDegrees)
      filter;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.hebei.camerax_android.core.resolutionselector.ResolutionStrategy',
  ),
)
abstract class ResolutionStrategy {
  @static
  late final ResolutionStrategy highestAvailableStrategy;

  ResolutionStrategy(
    Size boundSize,
    ResolutionFallbackRule fallbackRule,
  );

  Size? getBoundSize();
  ResolutionFallbackRule getFallbackRule();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.hebei.camerax_android.core.resolutionselector.ResolutionSelector',
  ),
)
abstract class ResolutionSelector {
  ResolutionSelector({
    ResolutionMode? allowedResolutionMode,
    AspectRatioStrategy? aspectRatioStrategy,
    ResolutionFilter? resolutionFilter,
    ResolutionStrategy? resolutionStrategy,
  });

  ResolutionMode getAllowedResolutionMode();
  AspectRatioStrategy getAspectRatioStrategy();
  ResolutionFilter? getResolutionFilter();
  ResolutionStrategy? getResolutionStrategy();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.core.ImageInfo',
  ),
)
abstract class ImageInfo {
  int getTimestamp();
  int getRotationDegrees();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
      fullClassName: 'dev.hebei.camerax_android.core.ImageProxy.PlaneProxy'),
)
abstract class PlaneProxy {
  Uint8List getBuffer();
  int getPixelStride();
  int getRowStride();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.core.ImageProxy',
  ),
)
abstract class ImageProxy {
  ImageFormat getFormat();
  int getWidth();
  int getHieght();
  List<PlaneProxy> getPlanes();
  ImageInfo getImageInfo();
  Rect? getCropRect();
  void setCropRect(Rect? rect);
  void close();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.core.ImageAnalysis.Analyzer',
  ),
)
abstract class Analyzer {
  Analyzer();

  late final void Function(ImageProxy image) analyze;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.video.FallbackStrategy',
  ),
)
abstract class FallbackStrategy {
  FallbackStrategy.higherQualityOrLowerThan(Quality quality);
  FallbackStrategy.higherQualityThan(Quality quality);
  FallbackStrategy.lowerQualityOrHigherThan(Quality quality);
  FallbackStrategy.lowerQualityThan(Quality quality);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.video.QualitySelector',
  ),
)
abstract class QualitySelector {
  QualitySelector.from(
    Quality quality, {
    FallbackStrategy? fallbackStrategy,
  });

  QualitySelector.fromOrderedList(
    List<Quality> qualities, {
    FallbackStrategy? fallbackStrategy,
  });

  Size? getResolution(CameraInfo cameraInfo, Quality quality);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.view.video.AudioConfig',
  ),
)
abstract class AudioConfig {
  AudioConfig.create(bool enableAudio);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.video.AudioStats',
  ),
)
abstract class AudioStats {
  double getAudioAmplitude();
  AudioState getAudioState();
  Throwable? getErrorCause();
  bool hasAudio();
  bool hasError();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.video.RecordingStats',
  ),
)
abstract class RecordingStats {
  AudioStats getAudioStats();
  int getNumBytesRecorded();
  int getRecordedDurationNanos();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.video.VideoRecordEvent',
  ),
)
abstract class VideoRecordEvent {
  RecordingStats getRecordingStats();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.video.VideoRecordEvent.Status',
  ),
)
abstract class VideoRecordStatusEvent extends VideoRecordEvent {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.video.VideoRecordEvent.Start',
  ),
)
abstract class VideoRecordStartEvent extends VideoRecordEvent {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.video.VideoRecordEvent.Pause',
  ),
)
abstract class VideoRecordPauseEvent extends VideoRecordEvent {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.video.VideoRecordEvent.Resume',
  ),
)
abstract class VideoRecordResumeEvent extends VideoRecordEvent {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.video.VideoRecordEvent.Finalize',
  ),
)
abstract class VideoRecordFinalizeEvent extends VideoRecordEvent {
  Throwable? getCause();
  VideoRecordFinalizeEventError getError();
  String getOutputUri();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.hebei.camerax_android.legacy.video.VideoRecordEventConsumer',
  ),
)
abstract class VideoRecordEventConsumer {
  VideoRecordEventConsumer();

  late final void Function(VideoRecordEvent event) accept;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.video.Recording',
  ),
)
abstract class Recording {
  bool isPersistene();
  void mute(bool muted);
  void pause();
  void resume();
  void stop();
  void close();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.view.CameraController',
  ),
)
abstract class CameraController {
  @async
  void initialize();
  @async
  bool hasCamera(CameraSelector cameraSelector);
  @async
  CameraSelector getCameraSelector();
  @async
  void setCameraSelector(CameraSelector cameraSelector);
  @async
  CameraInfo? getCameraInfo();
  @async
  CameraControl? getCameraControl();
  @async
  TorchStateLiveData getTorchState();
  @async
  void enableTorch(bool torchEnabled);
  @async
  ZoomStateLiveData getZoomState();
  @async
  void setZoomRatio(double zoomRatio);
  @async
  void setLinearZoom(double linearZoom);
  @async
  bool isPinchToZoomEnabled();
  @async
  void setPinchToZoomEnabled(bool enabled);
  @async
  bool isTapToFocusEnabled();
  @async
  void setTapToFocusEnabled(bool enabled);
  @async
  bool isImageCaptureEnabled();
  @async
  bool isImageAnalysisEnabled();
  @async
  bool isVideoCaptureEnabled();
  @async
  void setEnabledUseCases(List<UseCase> enabledUseCases);
  @async
  ResolutionSelector? getPreviewResolutionSelector();
  @async
  void setPreviewResolutionSelector(ResolutionSelector? resolutionSelector);
  @async
  ResolutionSelector? getImageCaptureResolutionSelector();
  @async
  void setImageCaptureResolutionSelector(
      ResolutionSelector? resolutionSelector);
  @async
  CaptureMode getImageCaptureMode();
  @async
  void setImageCaptureMode(CaptureMode captureMode);
  @async
  FlashMode getImageCaptureFlashMode();
  @async
  void setImageCaptureFlashMode(FlashMode flashMode);
  @async
  Uint8List takePictureToMemory();
  @async
  String takePictureToUri(String uri);
  @async
  ResolutionSelector getImageAnalysisResolutionSelector();
  @async
  void setImageAnalysisResolutionSelector(
      ResolutionSelector resolutionSelector);
  @async
  BackpressureStrategy getImageAnalysisBackpressureStrategy();
  @async
  void setImageAnalysisBackpressureStrategy(
      BackpressureStrategy backpressureStrategy);
  @async
  int getImageAnalysisImageQueueDepth();
  @async
  void setImageAnalysisImageQueueDepth(int imageQueueDepth);
  @async
  ImageFormat getImageAnalysisOutputImageFormat();
  @async
  void setImageAnalysisOutputImageFormat(ImageFormat outputImageFormat);
  @async
  void setImageAnalysisAnalyzer(Analyzer analyzer);
  @async
  void clearImageAnalysisAnalyzer();
  @async
  DynamicRange getVideoCaptureDynamicRange();
  @async
  void setVideoCaptureDynamicRange(DynamicRange dynamicRange);
  @async
  MirrorMode getVideoCaptureMirrorMode();
  @async
  void setVideoCaptureMirrorMode(MirrorMode mirrorMode);
  @async
  QualitySelector getVideoCaptureQualitySelector();
  @async
  void setVideoCaptureQualitySelector(QualitySelector qualitySelector);
  @async
  IntRange getVideoCaptureTargetFrameRate();
  @async
  void setVideoCaptureTargetFrameRate(IntRange targetFrameRate);
  @async
  bool isRecording();
  @async
  Recording startRecording({
    required String uri,
    required AudioConfig audioConfig,
    required VideoRecordEventConsumer listener,
  });
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.view.LifecycleCameraController',
  ),
)
abstract class LifecycleCameraController extends CameraController {
  LifecycleCameraController();

  @async
  void bindToLifecycle();
  @async
  void unbind();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.view.PreviewView',
  ),
)
abstract class PreviewView {
  PreviewView();

  @async
  CameraController? getController();
  @async
  void setController(CameraController? controller);
  @async
  ScaleType getScaleType();
  @async
  void setScaleType(ScaleType scaleType);
}
