// Run with `dart run pigeon --input api.dart`.
import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/camerax_api.g.dart',
    dartOptions: DartOptions(),
    swiftOut: 'ios/Classes/CameraXApi.g.swift',
    swiftOptions: SwiftOptions(errorClassName: 'CameraXError'),
  ),
)
// avfoundation
enum AVMetadataObjectTypeApi {
  codabar,
  code39,
  code39Mod43,
  code93,
  code128,
  ean8,
  ean13,
  gs1DataBar,
  gs1DataBarExpanded,
  gs1DataBarLimited,
  interleaved2of5,
  itf14,
  upce,
  aztec,
  dataMatrix,
  microPDF417,
  microQR,
  pdf417,
  qr,
  humanBody,
  humanFullBody,
  dogBody,
  catBody,
  face,
  salientObject,
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'AVMetadataObject',
    import: 'AVFoundation',
  ),
)
abstract class AVMetadataObjectApi {}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'AVMetadataBodyObject',
    import: 'AVFoundation',
    minIosApi: '13.0.0',
  ),
)
abstract class AVMetadataBodyObjectApi extends AVMetadataObjectApi {}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'AVMetadataCatBodyObject',
    import: 'AVFoundation',
    minIosApi: '13.0.0',
  ),
)
abstract class AVMetadataCatBodyObjectApi extends AVMetadataBodyObjectApi {
  late final AVMetadataObjectTypeApi type;
  late final int time;
  late final int duration;
  late final RectFApi bounds;
  late final int bodyID;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'AVMetadataDogBodyObject',
    import: 'AVFoundation',
    minIosApi: '13.0.0',
  ),
)
abstract class AVMetadataDogBodyObjectApi extends AVMetadataBodyObjectApi {
  late final AVMetadataObjectTypeApi type;
  late final int time;
  late final int duration;
  late final RectFApi bounds;
  late final int bodyID;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'AVMetadataHumanBodyObject',
    import: 'AVFoundation',
    minIosApi: '13.0.0',
  ),
)
abstract class AVMetadataHumanBodyObjectApi extends AVMetadataBodyObjectApi {
  late final AVMetadataObjectTypeApi type;
  late final int time;
  late final int duration;
  late final RectFApi bounds;
  late final int bodyID;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'AVMetadataHumanFullBodyObject',
    import: 'AVFoundation',
    minIosApi: '17.0.0',
  ),
)
abstract class AVMetadataHumanFullBodyObjectApi
    extends AVMetadataBodyObjectApi {
  late final AVMetadataObjectTypeApi type;
  late final int time;
  late final int duration;
  late final RectFApi bounds;
  late final int bodyID;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'AVMetadataFaceObject',
    import: 'AVFoundation',
  ),
)
abstract class AVMetadataFaceObjectApi extends AVMetadataObjectApi {
  late final AVMetadataObjectTypeApi type;
  late final int time;
  late final int duration;
  late final RectFApi bounds;
  late final int faceID;
  late final bool hasRollAngle;
  late final double rollAngle;
  late final bool hasYawAngle;
  late final double yawAngle;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'AVMetadataMachineReadableCodeObject',
    import: 'AVFoundation',
  ),
)
abstract class AVMetadataMachineReadableCodeObjectApi
    extends AVMetadataObjectApi {
  late final AVMetadataObjectTypeApi type;
  late final int time;
  late final int duration;
  late final RectFApi bounds;
  late final List<PointFApi> corners;
  late final String? stringValue;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'AVMetadataSalientObject',
    import: 'AVFoundation',
    minIosApi: '13.0.0',
  ),
)
abstract class AVMetadataSalientObjectApi extends AVMetadataObjectApi {
  late final AVMetadataObjectTypeApi type;
  late final int time;
  late final int duration;
  late final RectFApi bounds;
  late final int objectID;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'AVAnalyzer.Result'))
abstract class AVAnalyzerResultApi {
  late final List<AVMetadataObjectApi> objects;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'AVAnalyzer'))
abstract class AVAnalyzerApi implements ImageAnalysisAnalyzerApi {
  AVAnalyzerApi({
    List<AVMetadataObjectTypeApi>? types,
    required AVAnalyzerResultConsumerApi consumer,
  });
}

// camera2
enum CameraMetadataControlModeApi {
  auto,
  off,
  offKeepState,
  useExtendedSceneMode,
  useSceneMode,
}

enum CameraMetadataControlAeModeApi {
  off,
  on,
  onAlwaysFlash,
  onAutoFlash,
  onAutoFlashRedeye,
  onExternalFlash,
  onLowLightBoostBrightnessPriority,
}

enum CameraMetadataControlAfModeApi {
  auto,
  continuousPicture,
  edof,
  macro,
  off,
}

enum CameraMetadataControlAwbModeApi {
  auto,
  cloudyDaylight,
  daylight,
  fluorescent,
  incandesecent,
  off,
  shade,
  twilight,
  warmFluorescent,
}

// common
enum TimeUnitApi {
  nanoseconds,
  microseconds,
  milliseconds,
  seconds,
  minutes,
  hours,
  days,
}

enum ImageFormatApi {
  depth16,
  depthJpeg,
  depthPointCloud,
  flexRgba8888,
  flexRgb888,
  heic,
  heicUltraHdr,
  jpeg,
  jpegR,
  nv16,
  nv21,
  private,
  raw10,
  raw12,
  rawPrivate,
  rawSensor,
  // rgb565,
  unknown,
  y8,
  yCbCrP010,
  yCbCrP210,
  yuv420_888,
  yuv422_888,
  yuv444_888,
  yuy2,
  yv12,
  // PixelFormat
  a8,
  // jpeg,
  la88,
  l8,
  opaque,
  rgba1010102,
  rgba4444,
  rgba5551,
  rgba8888,
  rgbaF16,
  rgbx8888,
  rgb332,
  rgb565,
  rgb888,
  translucent,
  transparent,
  // unknown,
  yCbCr420Sp,
  yCbCr422I,
  yCbCr422Sp,
}

enum PermissionApi { video, audio }

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'AutoCloseable'))
abstract class AutoCloseableApi {
  void close();
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'Closeable'))
abstract class CloseableApi extends AutoCloseableApi {}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'CLLocation',
    import: 'CoreLocation',
  ),
)
abstract class CLLocationApi {
  CLLocationApi();

  late final double latitude;
  late final double longitude;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'CameraStateObserver'))
abstract class CameraStateObserverApi {
  CameraStateObserverApi();

  late final void Function(CameraStateApi value) onChanged;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'TorchStateObserver'))
abstract class TorchStateObserverApi {
  TorchStateObserverApi();

  late final void Function(TorchStateApi value) onChanged;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'ZoomStateObserver'))
abstract class ZoomStateObserverApi {
  ZoomStateObserverApi();

  late final void Function(ZoomStateApi value) onChanged;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'VideoRecordEventConsumer'))
abstract class VideoRecordEventConsumerApi {
  VideoRecordEventConsumerApi();

  late final void Function(VideoRecordEventApi value) accept;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'AVAnalyzerResultConsumer'))
abstract class AVAnalyzerResultConsumerApi {
  AVAnalyzerResultConsumerApi();

  late final void Function(AVAnalyzerResultApi value) accept;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'PermissionManager'))
abstract class PermissionManagerApi {
  @static
  late final PermissionManagerApi instance;

  bool checkPermissioin(PermissionApi permission);
  @async
  bool requestPermissions(List<PermissionApi> permissions);
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'Point'))
abstract class PointApi {
  PointApi();

  late final int x;
  late final int y;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'PointF'))
abstract class PointFApi {
  PointFApi();

  late final double x;
  late final double y;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'Rect'))
abstract class RectApi {
  RectApi();

  late final int left;
  late final int top;
  late final int right;
  late final int bottom;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'RectF'))
abstract class RectFApi {
  RectFApi();

  late final double left;
  late final double top;
  late final double right;
  late final double bottom;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'Size'))
abstract class SizeApi {
  SizeApi();

  late final int width;
  late final int height;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'SizeF'))
abstract class SizeFApi {
  SizeFApi();

  late final double width;
  late final double height;
}

// core
enum AspectRatioStrategyFallbackRuleApi { none, auto }

enum ResolutionSelectorModeApi {
  preferCaptureRateOverHigherResolution,
  preferHigherResolutionOverCaptureRate,
}

enum ResolutionStrategyFallbackRuleApi {
  none,
  closestHigherThenLower,
  closestHigher,
  closestLowerThenHigher,
  closestLower,
}

enum AspectRatioApi { ratioDefault, ratio4_3, ratio16_9 }

enum CameraSelectorLensFacingApi { unknown, front, back, external }

enum CameraStateApi { pendingOpen, opening, open, closing, closed }

enum DynamicRangeEncodingApi {
  unspecified,
  sdr,
  hdrUnspecified,
  hlg,
  hdr10,
  hdr10Plus,
  dolbyVision,
}

enum DynamicRangeBitDepthApi { unspecified, eightBit, tenBit }

enum ImageAnalysisStrategyApi { keepOnlyLatest, blockProducer }

enum ImageAnalysisCoordinateSystemApi { original, sensor, viewReferenced }

enum ImageAnalysisOutputImageFormatApi { yuv420_888, rgba8888, nv21 }

enum ImageCaptureCaptureModeApi {
  maximizeQuality,
  minimizeLatency,
  zeroShutterLag,
}

enum ImageCaptureFlashModeApi { auto, on, off, screen }

enum FocusMeteringActionMeteringModeApi { af, ae, awb }

enum MirrorModeApi { off, on, onFrontOnly }

enum TorchStateApi { off, on }

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'ResolutionStrategy'))
abstract class ResolutionStrategyApi {
  ResolutionStrategyApi();

  late final SizeApi? boundSize;
  late final ResolutionStrategyFallbackRuleApi fallbackRule;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'ResolutionSelector'))
abstract class ResolutionSelectorApi {
  ResolutionSelectorApi.build();

  // late final ResolutionSelectorModeApi allowedResolutionMode;
  // late final AspectRatioStrategyApi aspectRatioStrategy;
  // late final ResolutionFilterApi? resolutionFilter;
  late final ResolutionStrategyApi? resolutionStrategy;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'CameraControl'))
abstract class CameraControlApi {
  void enableTorch(bool torch);
  void setZoomRatio(double ratio);
  void setLinearZoom(double linearZoom);
  FocusMeteringResultApi startFocusAndMetering(FocusMeteringActionApi action);
  void cancelFocusAndMetering();
  int setExposureCompensationIndex(int value);
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'CameraInfo'))
abstract class CameraInfoApi {
  @static
  bool mustPlayShutterSound();
  CameraSelectorApi getCameraSelector();
  CameraStateApi? getCameraState();
  void observeCameraState(CameraStateObserverApi observer);
  void removeCameraStateObserver(CameraStateObserverApi observer);
  TorchStateApi? getTorchState();
  void observeTorchState(TorchStateObserverApi observer);
  void removeTorchStateObserver(TorchStateObserverApi observer);
  ZoomStateApi? getZoomState();
  void observeZoomState(ZoomStateObserverApi observer);
  void removeZoomStateObserver(ZoomStateObserverApi observer);
  // ExposureStateApi getExposureState();
  double getIntrinsticZoomRatio();
  CameraSelectorLensFacingApi getLensFacing();
  List<CameraInfoApi> getPhysicalCameraInfos();
  int getSensorRotationDegrees();
  // List<RangeApi> getSupportedFrameRateRanges();
  bool isLogicalMultiCameraSupported();
  bool isZslSupported();
  bool hasFlashUnit();
  bool isFocusMeteringSupported(FocusMeteringActionApi action);
  // List<DynamicRangeApi> querySupportedDynamicRanges(
  //     List<DynamicRangeApi> candidateDynamicRanges);
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'CameraSelector'))
abstract class CameraSelectorApi {
  @static
  late final CameraSelectorApi front;
  @static
  late final CameraSelectorApi back;
  @static
  late final CameraSelectorApi external;

  CameraSelectorApi.build({CameraSelectorLensFacingApi? lensFacing});
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'MeteringPointTuple'))
abstract class MeteringPointTupleApi {
  MeteringPointTupleApi(
    MeteringPointApi point, {
    List<FocusMeteringActionMeteringModeApi>? modes,
  });
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'DurationTuple'))
abstract class DurationTupleApi {
  DurationTupleApi(int duration, TimeUnitApi timeUnit);
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'FocusMeteringAction'))
abstract class FocusMeteringActionApi {
  FocusMeteringActionApi.build(
    MeteringPointTupleApi point, {
    List<MeteringPointTupleApi>? morePoints,
    bool? disableAutoCancel,
    DurationTupleApi? autoCancelDuration,
  });

  int getAutoCancelDurationInMillis();
  List<MeteringPointApi> getMeteringPointsAe();
  List<MeteringPointApi> getMeteringPointsAf();
  List<MeteringPointApi> getMeteringPointsAwb();
  bool isAutoCancelEnabled();
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'FocusMeteringResult'))
abstract class FocusMeteringResultApi {
  late final bool isFocusSuccessful;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'ImageAnalysis.Analyzer'))
abstract class ImageAnalysisAnalyzerApi {}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'ImageAnalyzer'))
abstract class ImageAnalyzerApi implements ImageAnalysisAnalyzerApi {
  ImageAnalyzerApi();

  late final void Function(ImageProxyApi image) analyze;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'ImageCapture.OnImageCapturedCallback',
  ),
)
abstract class ImageCaptureOnImageCapturedCallbackApi {
  ImageCaptureOnImageCapturedCallbackApi();

  late final void Function()? onCaptureStarted;
  late final void Function(int progress)? onCaptureProcessProgressed;
  late final void Function(Uint8List bitmap)? onPostviewBitmapAvailable;
  late final void Function(ImageProxyApi image)? onCaptureSuccess;
  late final void Function(List<Object?> exception)? onError;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'ImageInfo'))
abstract class ImageInfoApi {
  late final int timestamp;
  late final int rotationDegrees;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'ImageProxy.PlaneProxy'))
abstract class ImageProxyPlaneProxyApi {
  late final Uint8List value;
  late final int pixelStride;
  late final int rowStride;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'ImageProxy'))
abstract class ImageProxyApi extends AutoCloseableApi {
  late final ImageFormatApi format;
  late final int width;
  late final int height;
  late final List<ImageProxyPlaneProxyApi> planes;
  late final ImageInfoApi imageInfo;
  // RectApi getCropRect();
  // void setCropRect(RectApi? rect);
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'MeteringPoint'))
abstract class MeteringPointApi {
  late final double size;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'MeteringPointFactory'))
abstract class MeteringPointFactoryApi {
  MeteringPointApi createPoint(double x, double y, {double? size});
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'SurfaceOrientedMeteringPointFactory',
  ),
)
abstract class SurfaceOrientedMeteringPointFactoryApi
    extends MeteringPointFactoryApi {
  SurfaceOrientedMeteringPointFactoryApi(double width, double height);
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'ZoomState'))
abstract class ZoomStateApi {
  late final double minZoomRatio;
  late final double maxZoomRatio;
  late final double zoomRatio;
  late final double linearZoom;
}

// video
enum AudioStatsAudioStateApi {
  active,
  disabled,
  sourceSilenced,
  encoderError,
  sourceError,
  muted,
}

enum VideoRecordFinalizeEventErrorApi {
  none,
  unknown,
  fileSizeLimitReached,
  insufficientStorage,
  sourceInactive,
  invalidOuputOptions,
  encodingFailed,
  recorderError,
  noValidData,
  durationLimitReached,
  recordingGarbageCollected,
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'AudioStats'))
abstract class AudioStatsApi {
  late final double audioAmplitude;
  late final AudioStatsAudioStateApi audioState;
  late final List<Object?>? errorCause;
  late final bool hasAudio;
  late final bool hasError;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'OutputOptions'))
abstract class OutputOptionsApi {
  int getDurationLimitMillis();
  int getFileSizeLimit();
  CLLocationApi? getLocation();
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'FileOutputOptions'))
abstract class FileOutputOptionsApi extends OutputOptionsApi {
  FileOutputOptionsApi.build(
    String file, {
    int? durationLimitMillis,
    int? fileSizeLimitBytes,
    CLLocationApi? location,
  });

  String getFile();
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'OutputResults'))
abstract class OutputResultsApi {
  late final String? outputUri;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'RecordingStats'))
abstract class RecordingStatsApi {
  late final AudioStatsApi audioStats;
  late final int numBytesRecorded;
  late final int recordedDurationNanos;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'Recording'))
abstract class RecordingApi extends AutoCloseableApi {
  bool isPersistent();
  void mute(bool muted);
  void pause();
  void resume();
  void stop();
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'VideoRecordEvent'))
abstract class VideoRecordEventApi {}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'VideoRecordEvent.Status'))
abstract class VideoRecordStatusEventApi extends VideoRecordEventApi {
  late final RecordingStatsApi recordingStats;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'VideoRecordEvent.Start'))
abstract class VideoRecordStartEventApi extends VideoRecordEventApi {
  late final RecordingStatsApi recordingStats;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'VideoRecordEvent.Pause'))
abstract class VideoRecordPauseEventApi extends VideoRecordEventApi {
  late final RecordingStatsApi recordingStats;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'VideoRecordEvent.Resume'))
abstract class VideoRecordResumeEventApi extends VideoRecordEventApi {
  late final RecordingStatsApi recordingStats;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'VideoRecordEvent.Finalize'))
abstract class VideoRecordFinalizeEventApi extends VideoRecordEventApi {
  late final RecordingStatsApi recordingStats;
  late final List<Object?>? cause;
  late final VideoRecordFinalizeEventErrorApi error;
  late final OutputResultsApi outputResults;
}

// view
enum CameraControllerUseCaseApi { imageCapture, imageAnalysis, videoCapture }

enum PreviewViewScaleTypeApi {
  fillStart,
  fillCenter,
  fillEnd,
  fitStart,
  fitCenter,
  fitEnd,
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'AudioConfig'))
abstract class AudioConfigApi {
  @static
  late final AudioConfigApi audioDisabled;

  AudioConfigApi.create(bool enableAudio);

  bool getAudioEnabled();
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'CameraController'))
abstract class CameraControllerApi {
  CameraControllerApi();

  void initialize();
  void bind();
  void unbind();
  bool hasCamera(CameraSelectorApi cameraSelector);
  CameraSelectorApi getCameraSelector();
  void setCameraSelector(CameraSelectorApi cameraSelector);
  CameraInfoApi? getCameraInfo();
  CameraControlApi? getCameraControl();
  TorchStateApi? getTorchState();
  void observeTorchState(TorchStateObserverApi observer);
  void removeTorchStateObserver(TorchStateObserverApi observer);
  void enableTorch(bool torchEnabled);
  ZoomStateApi? getZoomState();
  void observeZoomState(ZoomStateObserverApi observer);
  void removeZoomStateObserver(ZoomStateObserverApi observer);
  void setZoomRatio(double zoomRatio);
  void setLinearZoom(double linearZoom);
  bool isPinchToZoomEnabled();
  void setPinchToZoomEnabled(bool enabled);
  bool isTapToFocusEnabled();
  void setTapToFocusEnabled(bool enabled);
  bool isImageCaptureEnabled();
  bool isImageAnalysisEnabled();
  bool isVideoCaptureEnabled();
  void setEnabledUseCases(List<CameraControllerUseCaseApi> enabledUseCases);
  // ResolutionSelectorApi? getPreviewResolutionSelector();
  // void setPreviewResolutionSelector(ResolutionSelectorApi? resolutionSelector);
  // ResolutionSelectorApi? getImageCaptureResolutionSelector();
  // void setImageCaptureResolutionSelector(
  //     ResolutionSelectorApi? resolutionSelector);
  ImageCaptureCaptureModeApi getImageCaptureMode();
  void setImageCaptureMode(ImageCaptureCaptureModeApi captureMode);
  ImageCaptureFlashModeApi getImageCaptureFlashMode();
  void setImageCaptureFlashMode(ImageCaptureFlashModeApi flashMode);
  void takePicture(ImageCaptureOnImageCapturedCallbackApi capturedCallback);
  ResolutionSelectorApi? getImageAnalysisResolutionSelector();
  void setImageAnalysisResolutionSelector(
    ResolutionSelectorApi? resolutionSelector,
  );
  ImageAnalysisStrategyApi getImageAnalysisBackpressureStrategy();
  void setImageAnalysisBackpressureStrategy(ImageAnalysisStrategyApi strategy);
  int getImageAnalysisImageQueueDepth();
  void setImageAnalysisImageQueueDepth(int depth);
  ImageAnalysisOutputImageFormatApi getImageAnalysisOutputImageFormat();
  void setImageAnalysisOutputImageFormat(
    ImageAnalysisOutputImageFormatApi imageAnalysisOutputImageFormat,
  );
  void setImageAnalysisAnalyzer(ImageAnalysisAnalyzerApi analyzer);
  void clearImageAnalysisAnalyzer();
  // DynamicRangeApi getVideoCaptureDynamicRange();
  // void setVideoCaptureDynamicRange(DynamicRangeApi dynamicRange);
  MirrorModeApi getVideoCaptureMirrorMode();
  void setVideoCaptureMirrorMode(MirrorModeApi mirrorMode);
  // QualitySelectorApi getVideoCaptureQualitySelector();
  // void setVideoCaptureQualitySelector(QualitySelectorApi qualitySelector);
  // RangeApi getVideoCaptureTargetFrameRate();
  // void setVideoCaptureTargetFrameRate(RangeApi targetFrameRate);
  bool isRecording();
  RecordingApi startRecording(
    FileOutputOptionsApi outputOptions,
    AudioConfigApi audioConfig,
    VideoRecordEventConsumerApi listener,
  );
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'PreviewView'))
abstract class PreviewViewApi {
  PreviewViewApi();

  CameraControllerApi? getController();
  void setController(CameraControllerApi? controller);
  PreviewViewScaleTypeApi getScaleType();
  void setScaleType(PreviewViewScaleTypeApi scaleType);
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'RotationProvider.Listener'))
abstract class RotationProviderListenerApi {
  RotationProviderListenerApi();

  late final void Function(int rotation) onRotationChanged;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'RotationProvider'))
abstract class RotationProviderApi {
  RotationProviderApi();

  bool addListener(RotationProviderListenerApi listener);
  void removeListener(RotationProviderListenerApi listener);
}

// vision
// enum VNBarcodeSymbologyApi {
//   aztec,
//   codabar,
//   code39,
//   code39Checksum,
//   code39FullASCII,
//   code39FullASCIIChecksum,
//   code93,
//   code93i,
//   code128,
//   dataMatrix,
//   ean8,
//   ean13,
//   gs1DataBar,
//   gs1DataBarExpanded,
//   gs1DataBarLimited,
//   i2of5,
//   i2of5Checksum,
//   itf14,
//   microPDF417,
//   microQR,
//   msiPlessey,
//   pdf417,
//   qr,
//   upce,
// }

// enum VNBarcodeCompositeTypeApi { none, linked, gs1TypeA, gs1TypeB, gs1TypeC }
