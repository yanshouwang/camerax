// Run with `dart run pigeon --input api.dart`.
import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/camerax.g.dart',
    dartOptions: DartOptions(),
    swiftOut: 'ios/Classes/CameraXApi.g.swift',
    swiftOptions: SwiftOptions(
      errorClassName: 'CameraXError',
    ),
  ),
)
enum PermissionApi {
  album,
  audio,
  video,
}

enum LensFacingApi {
  unknown,
  front,
  back,
  external,
}

enum CameraStateApi {
  pendingOpen,
  opening,
  open,
  closing,
  closed,
}

enum TorchStateApi {
  off,
  on,
}

enum MeteringModeApi {
  af,
  ae,
  awb,
}

enum TimeUnitApi {
  nanoseconds,
  microseconds,
  milliseconds,
  seconds,
  minutes,
  hours,
  days,
}

enum AspectRatioApi {
  ratioDefault,
  ratio4_3,
  ratio16_9,
}

enum BitDepthApi {
  bitDepthUnspecified,
  bitDepth8Bit,
  bitDepth10Bit,
}

enum EncodingApi {
  unspecified,
  sdr,
  hdrUnspecified,
  hlg,
  hdr10,
  hdr10Plus,
  dolbyVision,
}

enum ScaleTypeApi {
  fillStart,
  fillCenter,
  fillEnd,
  fitStart,
  fitCenter,
  fitEnd,
}

enum UseCaseApi {
  imageCapture,
  imageAnalysis,
  videoCapture,
}

enum ResolutionModeApi {
  preferCaptureRateOverHigherResolution,
  preferHigherResolutionOverCaptureRate,
}

enum AspectRatioFallbackRuleApi {
  none,
  auto,
}

enum ResolutionFallbackRuleApi {
  none,
  closestHigherThenLower,
  closestHigher,
  closestLowerThenHigher,
  closestLower,
}

enum CaptureModeApi {
  maximizeQuality,
  minimizeLatency,
  zeroShutterLag,
}

enum FlashModeApi {
  auto,
  on,
  off,
  screen,
}

enum BackpressureStrategyApi {
  keepOnlyLatest,
  blockProducer,
}

enum CoordinateSystemApi {
  original,
  sensor,
  viewReferenced,
}

enum ImageFormatApi {
  yuv420_888,
  rgba8888,
  jpeg,
  jpegR,
}

enum MirrorModeApi {
  off,
  on,
  onFrontOnly,
}

enum AudioStateApi {
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

enum ControlModeApi {
  auto,
  off,
  offKeepState,
  useExtendedSceneMode,
  useSceneMode,
}

enum ControlAeModeApi {
  off,
  on,
  onAlwaysFlash,
  onAutoFlash,
  onAutoFlashRedeye,
  onExternalFlash,
  onLowLightBoostBrightnessPriority,
}

enum ControlAfModeApi {
  auto,
  continuousPicture,
  edof,
  macro,
  off,
}

enum ControlAwbModeApi {
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

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'PermissionManager',
  ),
)
abstract class PermissionManagerApi {
  @static
  late final PermissionManagerApi instance;

  bool checkPermissioin(PermissionApi permission);
  @async
  bool requestPermissions(List<PermissionApi> permissions);
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'AutoCloseable',
  ),
)
abstract class AutoCloseableApi {
  void close();
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'CLLocation',
    import: 'CoreLocation',
  ),
)
abstract class LocationApi {
  LocationApi();

  late final double latitude;
  late final double longitude;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'IntSize',
  ),
)
abstract class SizeApi {
  SizeApi();

  late final int width;
  late final int height;
}

// @ProxyApi(
//   swiftOptions: SwiftProxyApiOptions(
//     name: 'Point',
//   ),
// )
// abstract class PointApi {
//   PointApi();

//   late final int x;
//   late final int y;
// }

// @ProxyApi(
//   swiftOptions: SwiftProxyApiOptions(
//     name: 'PointF',
//   ),
// )
// abstract class PointFApi {
//   PointFApi();

//   late final double x;
//   late final double y;
// }

// @ProxyApi(
//   swiftOptions: SwiftProxyApiOptions(
//     name: 'Rect',
//   ),
// )
// abstract class RectApi {
//   RectApi();

//   late final int left;
//   late final int top;
//   late final int right;
//   late final int bottom;
// }

// @ProxyApi(
//   swiftOptions: SwiftProxyApiOptions(
//     name: 'IntRange',
//   ),
// )
// abstract class IntRangeApi {
//   IntRangeApi();

//   late final int lower;
//   late final int upper;
// }

// @ProxyApi(
//   swiftOptions: SwiftProxyApiOptions(
//     name: 'LongRange',
//   ),
// )
// abstract class LongRangeApi {
//   LongRangeApi();

//   late final int lower;
//   late final int upper;
// }

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'CameraSelector',
  ),
)
abstract class CameraSelectorApi {
  @static
  late final CameraSelectorApi front;
  @static
  late final CameraSelectorApi back;
  @static
  late final CameraSelectorApi external;

  CameraSelectorApi(LensFacingApi? lensFacing);
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'NSKeyValueObservation',
  ),
)
abstract class NSKeyValueObservationApi {
  void invalidate();
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'CameraStateObserver',
  ),
)
abstract class CameraStateObserverApi {
  CameraStateObserverApi();

  late final void Function(CameraStateApi value) onChanged;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'TorchStateObserver',
  ),
)
abstract class TorchStateObserverApi {
  TorchStateObserverApi();

  late final void Function(TorchStateApi value) onChanged;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'ZoomState',
  ),
)
abstract class ZoomStateApi {
  late final double minZoomRatio;
  late final double maxZoomRatio;
  late final double zoomRatio;
  late final double linearZoom;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'ZoomStateObserver',
  ),
)
abstract class ZoomStateObserverApi {
  ZoomStateObserverApi();

  late final void Function(ZoomStateApi value) onChanged;
}

// @ProxyApi(
//   swiftOptions: SwiftProxyApiOptions(
//     name: 'ExposureState',
//   ),
// )
// abstract class ExposureStateApi {
//   late final int exposureCompensationIndex;
//   late final IntRangeApi exposureCompensationRange;
//   late final double exposureCompensationStep;
//   late final bool isExposureCompensationSupported;
// }

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'MeteringPoint',
  ),
)
abstract class MeteringPointApi {
  late final double size;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'MeteringPointFactory',
  ),
)
abstract class MeteringPointFactoryApi {
  MeteringPointApi createPoint(
    double x,
    double y, {
    double? size,
  });
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

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'MeteringPointTuple',
  ),
)
abstract class MeteringPointTupleApi {
  MeteringPointTupleApi(
    MeteringPointApi point, {
    List<MeteringModeApi>? modes,
  });
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'DurationTuple',
  ),
)
abstract class DurationTupleApi {
  DurationTupleApi(int duration, TimeUnitApi timeUnit);
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'FocusMeteringAction',
  ),
)
abstract class FocusMeteringActionApi {
  FocusMeteringActionApi.build(
    MeteringPointTupleApi first, {
    List<MeteringPointTupleApi>? others,
    bool? disableAutoCancel,
    DurationTupleApi? autoCancelDuration,
  });

  int getAutoCancelDurationInMillis();
  List<MeteringPointApi> getMeteringPointsAe();
  List<MeteringPointApi> getMeteringPointsAf();
  List<MeteringPointApi> getMeteringPointsAwb();
  bool isAutoCancelEnabled();
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'FocusMeteringResult',
  ),
)
abstract class FocusMeteringResultApi {
  late final bool isFocusSuccessful;
}

// @ProxyApi(
//   swiftOptions: SwiftProxyApiOptions(
//     name: 'DynamicRange',
//   ),
// )
// abstract class DynamicRangeApi {
//   DynamicRangeApi();

//   late final EncodingApi encoding;
//   late final BitDepthApi bitDepth;
// }

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'CameraInfo',
  ),
)
abstract class CameraInfoApi {
  @static
  bool mustPlayShutterSound();
  CameraSelectorApi getCameraSelector();
  CameraStateApi? getCameraState();
  NSKeyValueObservationApi observeCameraState(CameraStateObserverApi observer);
  TorchStateApi? getTorchState();
  NSKeyValueObservationApi observeTorchState(TorchStateObserverApi observer);
  ZoomStateApi? getZoomState();
  NSKeyValueObservationApi observeZoomState(ZoomStateObserverApi observer);
  // ExposureStateApi getExposureState();
  double getIntrinsticZoomRatio();
  LensFacingApi getLensFacing();
  List<CameraInfoApi> getPhysicalCameraInfos();
  int getSensorRotationDegrees();
  // List<IntRangeApi> getSupportedFrameRateRanges();
  bool isLogicalMultiCameraSupported();
  bool isZslSupported();
  bool hasFlashUnit();
  bool isFocusMeteringSupported(FocusMeteringActionApi action);
  // List<DynamicRangeApi> querySupportedDynamicRanges(
  //     List<DynamicRangeApi> candidateDynamicRanges);
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'CameraControl',
  ),
)
abstract class CameraControlApi {
  void enableTorch(bool torch);
  void setZoomRatio(double ratio);
  void setLinearZoom(double linearZoom);
  FocusMeteringResultApi startFocusAndMetering(FocusMeteringActionApi action);
  void cancelFocusAndMetering();
  int setExposureCompensationIndex(int value);
}

// @ProxyApi(
//   swiftOptions: SwiftProxyApiOptions(
//     name: 'AspectRatioStrategy',
//   ),
// )
// abstract class AspectRatioStrategyApi {
//   AspectRatioStrategyApi();

//   late final AspectRatioApi preferredAspectRatio;
//   late final AspectRatioFallbackRuleApi fallbackRule;
// }

// @ProxyApi(
//   swiftOptions: SwiftProxyApiOptions(
//     name: 'ResolutionFilter',
//   ),
// )
// abstract class ResolutionFilterApi {
//   ResolutionFilterApi();

//   late final List<SizeApi> Function(
//       List<SizeApi> supportedSizes, int rotationDegrees) filter;
// }

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'ResolutionStrategy',
  ),
)
abstract class ResolutionStrategyApi {
  ResolutionStrategyApi();

  late final SizeApi? boundSize;
  late final ResolutionFallbackRuleApi fallbackRule;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'ResolutionSelector',
  ),
)
abstract class ResolutionSelectorApi {
  ResolutionSelectorApi();

  // late final ResolutionModeApi allowedResolutionMode;
  // late final AspectRatioStrategyApi aspectRatioStrategy;
  // late final ResolutionFilterApi? resolutionFilter;
  late final ResolutionStrategyApi? resolutionStrategy;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'ImageInfo',
  ),
)
abstract class ImageInfoApi {
  late final int timestamp;
  late final int rotationDegrees;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'ImageProxy.PlaneProxy',
  ),
)
abstract class PlaneProxyApi {
  late final Uint8List value;
  late final int pixelStride;
  late final int rowStride;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'ImageProxy',
  ),
)
abstract class ImageProxyApi extends AutoCloseableApi {
  late final ImageFormatApi format;
  late final int width;
  late final int height;
  late final List<PlaneProxyApi> planes;
  late final ImageInfoApi imageInfo;
  // RectApi getCropRect();
  // void setCropRect(RectApi? rect);
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'ImageCapture.Metadata',
  ),
)
abstract class MetadataApi {
  MetadataApi();

  late final bool isReversedHorizontal;
  late final bool isReversedVertical;
  late final LocationApi? location;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'ImageCapture.OutputFileOptions',
  ),
)
abstract class OutputFileOptionsApi {
  OutputFileOptionsApi.build(
    String file, {
    MetadataApi? metadata,
  });
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'ImageCapture.OutputFileResults',
  ),
)
abstract class OutputFileResultsApi {
  late final String? savedUri;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'ImageCapture.OnImageCapturedCallback',
  ),
)
abstract class OnImageCapturedCallbackApi {
  OnImageCapturedCallbackApi();

  late final void Function()? onCaptureStarted;
  late final void Function(int progress)? onCaptureProcessProgressed;
  late final void Function(Uint8List bitmap)? onPostviewBitmapAvailable;
  late final void Function(ImageProxyApi image)? onCaptureSuccess;
  late final void Function(List<Object?> exception)? onError;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'ImageCapture.OnImageSavedCallback',
  ),
)
abstract class OnImageSavedCallbackApi {
  OnImageSavedCallbackApi();

  late final void Function()? onCaptureStarted;
  late final void Function(int progress)? onCaptureProcessProgressed;
  late final void Function(Uint8List bitmap)? onPostviewBitmapAvailable;
  late final void Function(OutputFileResultsApi outputFileResults)?
      onImageSaved;
  late final void Function(List<Object?> exception)? onError;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'ImageAnalysis.Analyzer',
  ),
)
abstract class AnalyzerApi {}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'ImageAnalysis.Analyzer',
  ),
)
abstract class ImageAnalyzerApi implements AnalyzerApi {
  ImageAnalyzerApi();

  late final void Function(ImageProxyApi image) analyze;
}

// @ProxyApi(
//   swiftOptions: SwiftProxyApiOptions(
//     name: 'Quality',
//   ),
// )
// abstract class QualityApi {
//   @static
//   late final QualityApi fhd;
//   @static
//   late final QualityApi hd;
//   @static
//   late final QualityApi highest;
//   @static
//   late final QualityApi lowest;
//   @static
//   late final QualityApi sd;
//   @static
//   late final QualityApi uhd;
// }

// @ProxyApi(
//   swiftOptions: SwiftProxyApiOptions(
//     name: 'FallbackStrategy',
//   ),
// )
// abstract class FallbackStrategyApi {
//   FallbackStrategyApi.higherQualityOrLowerThan(QualityApi quality);
//   FallbackStrategyApi.higherQualityThan(QualityApi quality);
//   FallbackStrategyApi.lowerQualityOrHigherThan(QualityApi quality);
//   FallbackStrategyApi.lowerQualityThan(QualityApi quality);
// }

// @ProxyApi(
//   swiftOptions: SwiftProxyApiOptions(
//     name: 'QualitySelector',
//   ),
// )
// abstract class QualitySelectorApi {
//   QualitySelectorApi.from(
//     QualityApi quality, {
//     FallbackStrategyApi? fallbackStrategy,
//   });

//   QualitySelectorApi.fromOrderedList(
//     List<QualityApi> qualities, {
//     FallbackStrategyApi? fallbackStrategy,
//   });

//   @static
//   SizeApi? getResolution(CameraInfoApi cameraInfo, QualityApi quality);
// }

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'OutputOptions',
  ),
)
abstract class OutputOptionsApi {
  int getDurationLimitMillis();
  int getFileSizeLimit();
  LocationApi? getLocation();
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'FileOutputOptions',
  ),
)
abstract class FileOutputOptionsApi extends OutputOptionsApi {
  FileOutputOptionsApi.build({
    required String file,
    int? durationLimitMillis,
    int? fileSizeLimitBytes,
    LocationApi? location,
  });

  String getFile();
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'AudioConfig',
  ),
)
abstract class AudioConfigApi {
  @static
  late final AudioConfigApi audioDisabled;

  AudioConfigApi.create(bool enableAudio);

  bool getAudioEnabled();
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'AudioStats',
  ),
)
abstract class AudioStatsApi {
  late final double audioAmplitude;
  late final AudioStateApi audioState;
  late final List<Object?>? errorCause;
  late final bool hasAudio;
  late final bool hasError;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'RecordingStats',
  ),
)
abstract class RecordingStatsApi {
  late final AudioStatsApi audioStats;
  late final int numBytesRecorded;
  late final int recordedDurationNanos;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'VideoRecordEvent',
  ),
)
abstract class VideoRecordEventApi {}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'VideoRecordEvent.Status',
  ),
)
abstract class VideoRecordStatusEventApi extends VideoRecordEventApi {
  late final RecordingStatsApi recordingStats;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'VideoRecordEvent.Start',
  ),
)
abstract class VideoRecordStartEventApi extends VideoRecordEventApi {
  late final RecordingStatsApi recordingStats;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'VideoRecordEvent.Pause',
  ),
)
abstract class VideoRecordPauseEventApi extends VideoRecordEventApi {
  late final RecordingStatsApi recordingStats;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'VideoRecordEvent.Resume',
  ),
)
abstract class VideoRecordResumeEventApi extends VideoRecordEventApi {
  late final RecordingStatsApi recordingStats;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'OutputResults',
  ),
)
abstract class OutputResultsApi {
  late final String? outputUri;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'VideoRecordEvent.Finalize',
  ),
)
abstract class VideoRecordFinalizeEventApi extends VideoRecordEventApi {
  late final RecordingStatsApi recordingStats;
  late final List<Object?>? cause;
  late final VideoRecordFinalizeEventErrorApi error;
  late final OutputResultsApi outputResults;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'VideoRecordEventConsumer',
  ),
)
abstract class VideoRecordEventConsumerApi {
  VideoRecordEventConsumerApi();

  late final void Function(VideoRecordEventApi value) accept;
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'Recording',
  ),
)
abstract class RecordingApi extends AutoCloseableApi {
  bool isPersistent();
  void mute(bool muted);
  void pause();
  void resume();
  void stop();
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'CameraController',
  ),
)
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
  NSKeyValueObservationApi observeTorchState(TorchStateObserverApi observer);
  void enableTorch(bool torchEnabled);
  ZoomStateApi? getZoomState();
  NSKeyValueObservationApi observeZoomState(ZoomStateObserverApi observer);
  void setZoomRatio(double zoomRatio);
  void setLinearZoom(double linearZoom);
  bool isPinchToZoomEnabled();
  void setPinchToZoomEnabled(bool enabled);
  bool isTapToFocusEnabled();
  void setTapToFocusEnabled(bool enabled);
  bool isImageCaptureEnabled();
  bool isImageAnalysisEnabled();
  bool isVideoCaptureEnabled();
  void setEnabledUseCases(List<UseCaseApi> enabledUseCases);
  // ResolutionSelectorApi? getPreviewResolutionSelector();
  // void setPreviewResolutionSelector(ResolutionSelectorApi? resolutionSelector);
  // ResolutionSelectorApi? getImageCaptureResolutionSelector();
  // void setImageCaptureResolutionSelector(
  //     ResolutionSelectorApi? resolutionSelector);
  CaptureModeApi getImageCaptureMode();
  void setImageCaptureMode(CaptureModeApi captureMode);
  FlashModeApi getImageCaptureFlashMode();
  void setImageCaptureFlashMode(FlashModeApi flashMode);
  void takePictureToMemory(OnImageCapturedCallbackApi capturedCallback);
  void takePictureToFile(OutputFileOptionsApi outputFileOptions,
      OnImageSavedCallbackApi savedCallback);
  ResolutionSelectorApi? getImageAnalysisResolutionSelector();
  void setImageAnalysisResolutionSelector(
      ResolutionSelectorApi? resolutionSelector);
  BackpressureStrategyApi getImageAnalysisBackpressureStrategy();
  void setImageAnalysisBackpressureStrategy(BackpressureStrategyApi strategy);
  int getImageAnalysisImageQueueDepth();
  void setImageAnalysisImageQueueDepth(int depth);
  ImageFormatApi getImageAnalysisOutputImageFormat();
  void setImageAnalysisOutputImageFormat(
      ImageFormatApi imageAnalysisOutputImageFormat);
  void setImageAnalysisAnalyzer(AnalyzerApi analyzer);
  void clearImageAnalysisAnalyzer();
  // DynamicRangeApi getVideoCaptureDynamicRange();
  // void setVideoCaptureDynamicRange(DynamicRangeApi dynamicRange);
  MirrorModeApi getVideoCaptureMirrorMode();
  void setVideoCaptureMirrorMode(MirrorModeApi mirrorMode);
  // QualitySelectorApi getVideoCaptureQualitySelector();
  // void setVideoCaptureQualitySelector(QualitySelectorApi qualitySelector);
  // IntRangeApi getVideoCaptureTargetFrameRate();
  // void setVideoCaptureTargetFrameRate(IntRangeApi targetFrameRate);
  bool isRecording();
  RecordingApi startRecording(
    FileOutputOptionsApi outputOptions,
    AudioConfigApi audioConfig,
    VideoRecordEventConsumerApi listener,
  );
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'PreviewView',
  ),
)
abstract class PreviewViewApi {
  PreviewViewApi();

  CameraControllerApi? getController();
  void setController(CameraControllerApi? controller);
  ScaleTypeApi getScaleType();
  void setScaleType(ScaleTypeApi scaleType);
}

// @ProxyApi(
//   swiftOptions: SwiftProxyApiOptions(
//     name: 'Camera2CameraControl',
//   ),
// )
// abstract class Camera2CameraControlApi {
//   Camera2CameraControlApi.from(CameraControlApi cameraControl);

//   void addCaptureRequestOptions(CaptureRequestOptionsApi bundle);
//   void clearCaptureRequestOptions();
//   CaptureRequestOptionsApi getCaptureRequestOptions();
//   void setCaptureRequestOptions(CaptureRequestOptionsApi bundle);
// }

// @ProxyApi(
//   swiftOptions: SwiftProxyApiOptions(
//     name: 'Camera2CameraInfo',
//   ),
// )
// abstract class Camera2CameraInfoApi {
//   Camera2CameraInfoApi.from(CameraInfoApi cameraInfo);

//   LongRangeApi? getSensorInfoExposureTimeRange();
//   String getCameraId();
// }

// @ProxyApi(
//   swiftOptions: SwiftProxyApiOptions(
//     name: 'CaptureRequestOptions',
//   ),
// )
// abstract class CaptureRequestOptionsApi {
//   CaptureRequestOptionsApi.build({
//     ControlModeApi? mode,
//     ControlAeModeApi? aeMode,
//     ControlAfModeApi? afMode,
//     ControlAwbModeApi? awbMode,
//     int? sensorExposureTime,
//   });
// }
