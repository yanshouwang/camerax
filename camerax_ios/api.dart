// Run with `dart run pigeon --input api.dart`.
import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/api.g.dart',
    dartOptions: DartOptions(),
    swiftOut: 'ios/camerax_ios/Sources/camerax_ios/CameraXApi.g.swift',
    swiftOptions: SwiftOptions(errorClassName: 'CameraXError'),
  ),
)
// avfoundation
enum AVCaptureDeviceCinematicVideoFocusModeApi { none, strong, weak }

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
  dogHead,
  dogBody,
  catHead,
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
abstract class AVMetadataObjectProxyApi {
  AVMetadataObjectTypeApi getType();
  int getTime();
  int getDuration();
  RectFProxyApi getBounds();
  bool isFixedFocus();
  AVCaptureDeviceCinematicVideoFocusModeApi getCinematicVideoFocusMode();
  int getGroupID();
  int getObjectID();
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'AVMetadataCatHeadObject',
    import: 'AVFoundation',
    minIosApi: '26.0.0',
  ),
)
abstract class AVMetadataCatHeadObjectProxyApi
    extends AVMetadataObjectProxyApi {}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'AVMetadataDogHeadObject',
    import: 'AVFoundation',
    minIosApi: '26.0.0',
  ),
)
abstract class AVMetadataDogHeadObjectProxyApi
    extends AVMetadataObjectProxyApi {}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'AVMetadataBodyObject',
    import: 'AVFoundation',
  ),
)
abstract class AVMetadataBodyObjectProxyApi extends AVMetadataObjectProxyApi {
  int getBodyID();
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'AVMetadataCatBodyObject',
    import: 'AVFoundation',
  ),
)
abstract class AVMetadataCatBodyObjectProxyApi
    extends AVMetadataBodyObjectProxyApi {}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'AVMetadataDogBodyObject',
    import: 'AVFoundation',
  ),
)
abstract class AVMetadataDogBodyObjectProxyApi
    extends AVMetadataBodyObjectProxyApi {}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'AVMetadataHumanBodyObject',
    import: 'AVFoundation',
  ),
)
abstract class AVMetadataHumanBodyObjectProxyApi
    extends AVMetadataBodyObjectProxyApi {}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'AVMetadataHumanFullBodyObject',
    import: 'AVFoundation',
    minIosApi: '17.0.0',
  ),
)
abstract class AVMetadataHumanFullBodyObjectProxyApi
    extends AVMetadataBodyObjectProxyApi {}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'AVMetadataFaceObject',
    import: 'AVFoundation',
  ),
)
abstract class AVMetadataFaceObjectProxyApi extends AVMetadataObjectProxyApi {
  int getFaceID();
  bool hasRollAngle();
  double getRollAngle();
  bool hasYawAngle();
  double getYawAngle();
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'AVMetadataMachineReadableCodeObject',
    import: 'AVFoundation',
  ),
)
abstract class AVMetadataMachineReadableCodeObjectProxyApi
    extends AVMetadataObjectProxyApi {
  List<PointFProxyApi> getCorners();
  String? getStringValue();
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'AVMetadataSalientObject',
    import: 'AVFoundation',
  ),
)
abstract class AVMetadataSalientObjectProxyApi
    extends AVMetadataObjectProxyApi {}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'AVAnalyzer.Result'))
abstract class AVAnalyzerResultProxyApi {
  List<AVMetadataObjectProxyApi> getObjects();
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'AVAnalyzer'))
abstract class AVAnalyzerProxyApi extends ImageAnalysisAnalyzerProxyApi {
  AVAnalyzerProxyApi({
    List<AVMetadataObjectTypeApi>? types,
    required AVAnalyzerResultConsumerProxyApi consumer,
  });
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
  androidPrivate,
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

enum PermissionManagerPermissionApi { video, audio }

enum SurfaceRotationApi { rotation0, rotation90, rotation180, rotation270 }

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'AutoCloseable'))
abstract class AutoCloseableProxyApi {
  void close();
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'Closeable'))
abstract class CloseableProxyApi extends AutoCloseableProxyApi {}

// @ProxyApi(
//   swiftOptions: SwiftProxyApiOptions(name: 'CGImage', import: 'CoreGraphics'),
// )
// abstract class CGImageProxyApi {}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'CLLocation',
    import: 'CoreLocation',
  ),
)
abstract class CLLocationProxyApi {
  CLLocationProxyApi();

  late final double latitude;
  late final double longitude;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'AVAnalyzerResultConsumer'))
abstract class AVAnalyzerResultConsumerProxyApi {
  AVAnalyzerResultConsumerProxyApi();

  late final void Function(AVAnalyzerResultProxyApi value) accept;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'ImageProxyConsumer'))
abstract class ImageProxyConsumerProxyApi {
  ImageProxyConsumerProxyApi();

  late final void Function(ImageProxyProxyApi value) accept;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'VideoRecordEventConsumer'))
abstract class VideoRecordEventConsumerProxyApi {
  VideoRecordEventConsumerProxyApi();

  late final void Function(VideoRecordEventProxyApi value) accept;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'CameraStateObserver'))
abstract class CameraStateObserverProxyApi {
  CameraStateObserverProxyApi();

  late final void Function(CameraStateApi value) onChanged;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'TorchStateObserver'))
abstract class TorchStateObserverProxyApi {
  TorchStateObserverProxyApi();

  late final void Function(TorchStateApi value) onChanged;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'ZoomStateObserver'))
abstract class ZoomStateObserverProxyApi {
  ZoomStateObserverProxyApi();

  late final void Function(ZoomStateProxyApi value) onChanged;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'PermissionManager'))
abstract class PermissionManagerProxyApi {
  @static
  late final PermissionManagerProxyApi instance;

  bool checkPermissioin(PermissionManagerPermissionApi permission);
  @async
  bool requestPermissions(List<PermissionManagerPermissionApi> permissions);
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'Point'))
abstract class PointProxyApi {
  PointProxyApi();

  late final int x;
  late final int y;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'PointF'))
abstract class PointFProxyApi {
  PointFProxyApi();

  late final double x;
  late final double y;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'Rect'))
abstract class RectProxyApi {
  RectProxyApi();

  late final int left;
  late final int top;
  late final int right;
  late final int bottom;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'RectF'))
abstract class RectFProxyApi {
  RectFProxyApi();

  late final double left;
  late final double top;
  late final double right;
  late final double bottom;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'Size'))
abstract class SizeProxyApi {
  SizeProxyApi();

  late final int width;
  late final int height;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'SizeF'))
abstract class SizeFProxyApi {
  SizeFProxyApi();

  late final double width;
  late final double height;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'DurationTuple'))
abstract class DurationTupleProxyApi {
  DurationTupleProxyApi(int duration, TimeUnitApi timeUnit);
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'MeteringPointTuple'))
abstract class MeteringPointTupleProxyApi {
  MeteringPointTupleProxyApi(
    MeteringPointProxyApi point, {
    List<FocusMeteringActionMeteringModeApi>? modes,
  });
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
abstract class ResolutionStrategyProxyApi {
  @static
  late final ResolutionStrategyProxyApi highestAvailableStrategy;

  ResolutionStrategyProxyApi(
    SizeProxyApi boundSize,
    ResolutionStrategyFallbackRuleApi fallbackRule,
  );

  SizeProxyApi? getBoundSize();
  ResolutionStrategyFallbackRuleApi getFallbackRule();
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'ResolutionSelector'))
abstract class ResolutionSelectorProxyApi {
  ResolutionSelectorProxyApi.build({
    // ResolutionSelectorModeApi? mode,
    // AspectRatioStrategyProxyApi? aspectRatioStrategy,
    // ResolutionFilterProxyApi? resolutionFilter,
    ResolutionStrategyProxyApi? resolutionStrategy,
  });

  // ResolutionSelectorModeApi getAllowedResolutionMode();
  // AspectRatioStrategyProxyApi getAspectRatioStrategy();
  // ResolutionFilterProxyApi? getResolutionFilter();
  ResolutionStrategyProxyApi? getResolutionStrategy();
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'CameraControl'))
abstract class CameraControlProxyApi {
  void enableTorch(bool torch);
  // void setTorchStrengthLevel(int torchStrengthLevel);
  void setZoomRatio(double ratio);
  void setLinearZoom(double linearZoom);
  FocusMeteringResultProxyApi startFocusAndMetering(
    FocusMeteringActionProxyApi action,
  );
  void cancelFocusAndMetering();
  int setExposureCompensationIndex(int value);
  // void enableLowLightBoostAsync(bool lowLightBoost);
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'CameraInfo'))
abstract class CameraInfoProxyApi {
  @static
  bool mustPlayShutterSound();

  CameraSelectorProxyApi getCameraSelector();
  CameraStateApi? getCameraState();
  void observeCameraState(CameraStateObserverProxyApi observer);
  void removeCameraStateObserver(CameraStateObserverProxyApi observer);
  // ExposureStateApi getExposureState();
  double getIntrinsicZoomRatio();
  CameraSelectorLensFacingApi getLensFacing();
  // LowLightBoostStateApi? getLowLightBoostState();
  // void observeLowLightBoostState(LowLightBoostStateObserverProxyApi observer);
  // void removeLowLightBoostStateObserver(
  //   LowLightBoostStateObserverProxyApi observer,
  // );
  // int getMaxTorchStrengthLevel();
  List<CameraInfoProxyApi> getPhysicalCameraInfos();
  int getSensorRotationDegrees1();
  int getSensorRotationDegrees2(SurfaceRotationApi relativeRotation);
  // List<IntRangeProxyApi> getSupportedFrameRateRanges1();
  // List<IntRangeProxyApi> getSupportedFrameRateRanges2(
  //   SessionConfigProxyApi sessionConfig,
  // );
  TorchStateApi? getTorchState();
  void observeTorchState(TorchStateObserverProxyApi observer);
  void removeTorchStateObserver(TorchStateObserverProxyApi observer);
  // int? getTorchStrengthLevel();
  // void observeTorchStrengthLevel(IntObserverProxyApi observer);
  // void removeTorchStrengthLevelObserver(IntObserverProxyApi observer);
  ZoomStateProxyApi? getZoomState();
  void observeZoomState(ZoomStateObserverProxyApi observer);
  void removeZoomStateObserver(ZoomStateObserverProxyApi observer);
  bool hasFlashUnit();
  // bool isFeatureGroupSupported(SessionConfigProxyApi sessionConfig);
  bool isFocusMeteringSupported(FocusMeteringActionProxyApi action);
  bool isLogicalMultiCameraSupported();
  bool isLowLightBoostSupported();
  bool isTorchStrengthSupported();
  bool isZslSupported();
  // List<DynamicRangeApi> querySupportedDynamicRanges(
  //     List<DynamicRangeApi> candidateDynamicRanges);
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'CameraSelector'))
abstract class CameraSelectorProxyApi {
  @static
  late final CameraSelectorProxyApi back;
  @static
  late final CameraSelectorProxyApi front;
  @static
  late final CameraSelectorProxyApi external;

  CameraSelectorProxyApi.build({CameraSelectorLensFacingApi? lensFacing});
  // CameraSelectorProxyApi.of(List<CameraIdentifierProxyApi> cameraIdentifiers);

  // List<CameraInfoProxyApi> filter(List<CameraInfoProxyApi> cameraInfos);
  // String? getPhysicalCameraId();
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'FocusMeteringAction'))
abstract class FocusMeteringActionProxyApi {
  FocusMeteringActionProxyApi.build(
    MeteringPointTupleProxyApi point, {
    List<MeteringPointTupleProxyApi>? morePoints,
    bool? disableAutoCancel,
    DurationTupleProxyApi? autoCancelDuration,
  });

  int getAutoCancelDurationInMillis();
  List<MeteringPointProxyApi> getMeteringPointsAe();
  List<MeteringPointProxyApi> getMeteringPointsAf();
  List<MeteringPointProxyApi> getMeteringPointsAwb();
  bool isAutoCancelEnabled();
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'FocusMeteringResult'))
abstract class FocusMeteringResultProxyApi {
  late final bool isFocusSuccessful;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'ImageAnalysis.Analyzer'))
abstract class ImageAnalysisAnalyzerProxyApi {
  void analyze(ImageProxyProxyApi image);
  // SizeProxyApi? getDefaultTargetResolution();
  // ImageAnalysisCoordinateSystemApi getTargetCoordinateSystem();
  // void updateTransform(MatrixProxyApi? matrix);
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'ImageAnalysis.Analyzer'))
abstract class ImageAnalysisAnalyzerImplProxyApi
    extends ImageAnalysisAnalyzerProxyApi {
  ImageAnalysisAnalyzerImplProxyApi({
    required ImageProxyConsumerProxyApi consumer,
  });
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'ImageCapture.OnImageCapturedCallback',
  ),
)
abstract class ImageCaptureOnImageCapturedCallbackProxyApi {
  ImageCaptureOnImageCapturedCallbackProxyApi();

  late final void Function()? onCaptureStarted;
  late final void Function(int progress)? onCaptureProcessProgressed;
  // late final void Function(CGImageProxyApi bitmap)? onPostviewBitmapAvailable;
  late final void Function(ImageProxyProxyApi image)? onCaptureSuccess;
  late final void Function(List<Object?> exception)? onError;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'ImageInfo'))
abstract class ImageInfoProxyApi {
  late final int timestamp;
  late final int rotationDegrees;
  // late final FlashStateApi flashState;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'ImageProxy.PlaneProxy'))
abstract class ImageProxyPlaneProxyProxyApi {
  late final Uint8List value;
  late final int pixelStride;
  late final int rowStride;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'ImageProxy'))
abstract class ImageProxyProxyApi extends AutoCloseableProxyApi {
  late final ImageFormatApi format;
  late final int width;
  late final int height;
  late final ImageInfoProxyApi imageInfo;
  late final List<ImageProxyPlaneProxyProxyApi> planes;

  // RectApi getCropRect();
  // ImageProxyApi? getImage();
  // void setCropRect(RectApi? rect);
  // CGImageProxyApi toBitmap();
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'MeteringPoint'))
abstract class MeteringPointProxyApi {
  late final double size;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'MeteringPointFactory'))
abstract class MeteringPointFactoryProxyApi {
  @static
  double getDefaultPointSize();

  MeteringPointProxyApi createPoint1(double x, double y);
  MeteringPointProxyApi createPoint2(double x, double y, double size);
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'SurfaceOrientedMeteringPointFactory',
  ),
)
abstract class SurfaceOrientedMeteringPointFactoryProxyApi
    extends MeteringPointFactoryProxyApi {
  SurfaceOrientedMeteringPointFactoryProxyApi(double width, double height);
  // SurfaceOrientedMeteringPointFactoryProxyApi.useCase(
  //   double width,
  //   double height,
  //   UseCaseProxyApi useCaseForAspectRatio,
  // );
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'ZoomState'))
abstract class ZoomStateProxyApi {
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
abstract class AudioStatsProxyApi {
  late final double audioAmplitude;
  late final AudioStatsAudioStateApi audioState;
  late final List<Object?>? errorCause;
  late final bool hasAudio;
  late final bool hasError;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'OutputOptions'))
abstract class OutputOptionsProxyApi {
  int getDurationLimitMillis();
  int getFileSizeLimit();
  CLLocationProxyApi? getLocation();
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'FileOutputOptions'))
abstract class FileOutputOptionsProxyApi extends OutputOptionsProxyApi {
  FileOutputOptionsProxyApi.build(
    String file, {
    int? durationLimitMillis,
    int? fileSizeLimitBytes,
    CLLocationProxyApi? location,
  });

  String getFile();
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'OutputResults'))
abstract class OutputResultsProxyApi {
  late final String? outputUri;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'RecordingStats'))
abstract class RecordingStatsProxyApi {
  late final AudioStatsProxyApi audioStats;
  late final int numBytesRecorded;
  late final int recordedDurationNanos;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'Recording'))
abstract class RecordingProxyApi extends AutoCloseableProxyApi {
  bool isPersistent();
  void mute(bool muted);
  void pause();
  void resume();
  void stop();
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'VideoRecordEvent'))
abstract class VideoRecordEventProxyApi {}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'VideoRecordEvent.Status'))
abstract class VideoRecordStatusEventProxyApi extends VideoRecordEventProxyApi {
  // late final OutputOptionsProxyApi outputOptions;
  late final RecordingStatsProxyApi recordingStats;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'VideoRecordEvent.Start'))
abstract class VideoRecordStartEventProxyApi extends VideoRecordEventProxyApi {
  // late final OutputOptionsProxyApi outputOptions;
  late final RecordingStatsProxyApi recordingStats;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'VideoRecordEvent.Pause'))
abstract class VideoRecordPauseEventProxyApi extends VideoRecordEventProxyApi {
  // late final OutputOptionsProxyApi outputOptions;
  late final RecordingStatsProxyApi recordingStats;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'VideoRecordEvent.Resume'))
abstract class VideoRecordResumeEventProxyApi extends VideoRecordEventProxyApi {
  // late final OutputOptionsProxyApi outputOptions;
  late final RecordingStatsProxyApi recordingStats;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'VideoRecordEvent.Finalize'))
abstract class VideoRecordFinalizeEventProxyApi
    extends VideoRecordEventProxyApi {
  // late final OutputOptionsProxyApi outputOptions;
  late final RecordingStatsProxyApi recordingStats;
  late final List<Object?>? cause;
  late final VideoRecordFinalizeEventErrorApi error;
  late final OutputResultsProxyApi outputResults;
  late final bool hasError;
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
abstract class AudioConfigProxyApi {
  @static
  late final AudioConfigProxyApi audioDisabled;

  AudioConfigProxyApi.create(bool enableAudio);

  bool getAudioEnabled();
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'CameraController'))
abstract class CameraControllerProxyApi {
  CameraControllerProxyApi();

  // void getInitializeFuture();
  void bind();
  void unbind();
  bool hasCamera(CameraSelectorProxyApi cameraSelector);
  CameraSelectorProxyApi getCameraSelector();
  void setCameraSelector(CameraSelectorProxyApi cameraSelector);
  CameraInfoProxyApi? getCameraInfo();
  CameraControlProxyApi? getCameraControl();
  TorchStateApi? getTorchState();
  void observeTorchState(TorchStateObserverProxyApi observer);
  void removeTorchStateObserver(TorchStateObserverProxyApi observer);
  void enableTorch(bool torchEnabled);
  ZoomStateProxyApi? getZoomState();
  void observeZoomState(ZoomStateObserverProxyApi observer);
  void removeZoomStateObserver(ZoomStateObserverProxyApi observer);
  void setZoomRatio(double zoomRatio);
  void setLinearZoom(double linearZoom);
  bool isPinchToZoomEnabled();
  void setPinchToZoomEnabled(bool enabled);
  // TapToFocusInfoProxyApi? getTapToFocusInfoState();
  // void observeTapToFocusInfoState(TapToFocusInfoObserverProxyApi observer);
  // void removeTapToFocusInfoStateObserver(
  //   TapToFocusInfoObserverProxyApi observer,
  // );
  bool isTapToFocusEnabled();
  void setTapToFocusEnabled(bool enabled);
  // void setTapToFocusAutoCancelDuration(DurationTupleProxyApi duration);
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
  // ExecutorProxyApi? getImageCaptureIoExecutor();
  // void setImageCaptureIoExecutor(ExecutorProxyApi executor);
  void takePicture1(
    ImageCaptureOnImageCapturedCallbackProxyApi imageCapturedCallback,
  );
  // void takePicture2(
  //   ImageCaptureOutputFileOptionsProxyApi outputFileOptions,
  //   ImageCaptureOnImageSavedCallbackProxyApi imageSavedCallback,
  // );
  ResolutionSelectorProxyApi? getImageAnalysisResolutionSelector();
  void setImageAnalysisResolutionSelector(
    ResolutionSelectorProxyApi? resolutionSelector,
  );
  ImageAnalysisStrategyApi getImageAnalysisBackpressureStrategy();
  void setImageAnalysisBackpressureStrategy(ImageAnalysisStrategyApi strategy);
  int getImageAnalysisImageQueueDepth();
  void setImageAnalysisImageQueueDepth(int depth);
  ImageAnalysisOutputImageFormatApi getImageAnalysisOutputImageFormat();
  void setImageAnalysisOutputImageFormat(
    ImageAnalysisOutputImageFormatApi imageAnalysisOutputImageFormat,
  );
  // ExecutorProxyApi? getImageAnalysisBackgroundExecutor();
  // void setImageAnalysisBackgroundExecutor(ExecutorProxyApi? executor);
  void setImageAnalysisAnalyzer(ImageAnalysisAnalyzerProxyApi analyzer);
  void clearImageAnalysisAnalyzer();
  // QualitySelectorApi getVideoCaptureQualitySelector();
  // void setVideoCaptureQualitySelector(QualitySelectorApi qualitySelector);
  // DynamicRangeApi getVideoCaptureDynamicRange();
  // void setVideoCaptureDynamicRange(DynamicRangeApi dynamicRange);
  MirrorModeApi getVideoCaptureMirrorMode();
  void setVideoCaptureMirrorMode(MirrorModeApi mirrorMode);
  // RangeApi getVideoCaptureTargetFrameRate();
  // void setVideoCaptureTargetFrameRate(RangeApi targetFrameRate);
  bool isRecording();
  RecordingProxyApi startRecording1(
    FileOutputOptionsProxyApi outputOptions,
    AudioConfigProxyApi audioConfig,
    VideoRecordEventConsumerProxyApi listener,
  );
  // RecordingProxyApi startRecording2(
  //   FileDescriptorOutputOptionsProxyApi outputOptions,
  //   AudioConfigProxyApi audioConfig,
  //   VideoRecordEventConsumerProxyApi listener,
  // );
  // RecordingProxyApi startRecording3(
  //   MediaStoreOutputOptionsProxyApi outputOptions,
  //   AudioConfigProxyApi audioConfig,
  //   VideoRecordEventConsumerProxyApi listener,
  // );
  // void setEffects(List<CameraEffectProxyApi> effects);
  // void clearEffects();
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'PreviewView'))
abstract class PreviewViewProxyApi {
  PreviewViewProxyApi();

  CameraControllerProxyApi? getController();
  void setController(CameraControllerProxyApi? controller);
  PreviewViewScaleTypeApi getScaleType();
  void setScaleType(PreviewViewScaleTypeApi scaleType);
  // PreviewViewImplementationModeApi getImplementationMode();
  // void setImplementationMode(
  //   PreviewViewImplementationModeApi implementationMode,
  // );
  // MeteringPointFactoryProxyApi getMeteringPointFactory();
  // OutputTransformProxyApi? getOutputTransform();
  // PreviewViewStreamStateApi? getPreviewStreamState();
  // void observePreviewStreamState(
  //   PreviewViewStreamStateObserverProxyApi observer,
  // );
  // void removePreviewStreamStateObserver(
  //   PreviewViewStreamStateObserverProxyApi observer,
  // );
  // ImageCaptureScreenFalshProxyApi? getScreenFlash();
  // void setScreenFlashWindow(WindowProxyApi? screenFlashWindow);
  // void setScreenFlashOverlayColor(int color);
  // MatrixProxyApi? getSensorToViewTransform();
  // PreviewSurfaceProviderProxyApi getSurfaceProvider();
  // VidePortProxyApi? getViewPort1();
  // VidePortProxyApi? getViewPort2(SurfaceRotationApi targetRotation);
  // bool onTouchEvent(MotionEventProxyApi event);
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'RotationProvider.Listener'))
abstract class RotationProviderListenerProxyApi {
  RotationProviderListenerProxyApi();

  late final void Function(SurfaceRotationApi rotation) onRotationChanged;
}

@ProxyApi(swiftOptions: SwiftProxyApiOptions(name: 'RotationProvider'))
abstract class RotationProviderProxyApi {
  RotationProviderProxyApi();

  bool addListener(RotationProviderListenerProxyApi listener);
  void removeListener(RotationProviderListenerProxyApi listener);
}

// vision
enum VNBarcodeSymbologyApi {
  aztec,
  codabar,
  code39,
  code39Checksum,
  code39FullASCII,
  code39FullASCIIChecksum,
  code93,
  code93i,
  code128,
  dataMatrix,
  ean8,
  ean13,
  gs1DataBar,
  gs1DataBarExpanded,
  gs1DataBarLimited,
  i2of5,
  i2of5Checksum,
  itf14,
  microPDF417,
  microQR,
  msiPlessey,
  pdf417,
  qr,
  upce,
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'VNImageRequestHandler',
    import: 'Vision',
  ),
)
abstract class VNImageRequestHandlerProxyApi {
  VNImageRequestHandlerProxyApi.url(String url);

  void perform(List<VNRequestProxyApi> requests);
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(name: 'VNRequest', import: 'Vision'),
)
abstract class VNRequestProxyApi {
  late final void Function(List<Object?>?) completionHandler;

  bool getPreferBackgroundProcessing();
  void setPreferBackgroundProcessing(bool value);
  List<VNObservationProxyApi>? getResults();
  void cancel();
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'VNImageBasedRequest',
    import: 'Vision',
  ),
)
abstract class VNImageBasedRequestProxyApi extends VNRequestProxyApi {
  RectFProxyApi getRegionOfInterest();
  void setRegionOfInterest(RectFProxyApi value);
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(name: 'VNObservation', import: 'Vision'),
)
abstract class VNObservationProxyApi {
  double getConfidence();
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'VNDetectedObjectObservation',
    import: 'Vision',
  ),
)
abstract class VNDetectedObjectObservationProxyApi
    extends VNObservationProxyApi {
  RectFProxyApi getBoundingBox();
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'VNRectangleObservation',
    import: 'Vision',
  ),
)
abstract class VNRectangleObservationProxyApi
    extends VNDetectedObjectObservationProxyApi {
  PointFProxyApi getBottomLeft();
  PointFProxyApi getBottomRight();
  PointFProxyApi getTopLeft();
  PointFProxyApi getTopRight();
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'VNDetectBarcodesRequest',
    import: 'Vision',
  ),
)
abstract class VNDetectBarcodesRequestProxyApi
    extends VNImageBasedRequestProxyApi {
  VNDetectBarcodesRequestProxyApi();

  List<VNBarcodeSymbologyApi> getSupportedSymbologies();
  List<VNBarcodeSymbologyApi> getSymbologies();
  void setSymbologies(List<VNBarcodeSymbologyApi> value);
  @override
  List<VNBarcodeObservationProxyApi>? getResults();
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'VNBarcodeObservation',
    import: 'Vision',
  ),
)
abstract class VNBarcodeObservationProxyApi
    extends VNRectangleObservationProxyApi {
  String? getPayloadStringValue();
  VNBarcodeSymbologyApi getSymbology();
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'VNDetectFaceRectanglesRequest',
    import: 'Vision',
  ),
)
abstract class VNDetectFaceRectanglesRequestProxyApi
    extends VNImageBasedRequestProxyApi {
  VNDetectFaceRectanglesRequestProxyApi();

  @override
  List<VNFaceObservationProxyApi>? getResults();
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'VNFaceLandmarkRegion',
    import: 'Vision',
  ),
)
abstract class VNFaceLandmarkRegionProxyApi {
  int getPointCount();
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'VNFaceLandmarkRegion2D',
    import: 'Vision',
  ),
)
abstract class VNFaceLandmarkRegion2DProxyApi
    extends VNFaceLandmarkRegionProxyApi {
  List<PointFProxyApi> getNormalizedPoints();
  List<double>? getPrecisionEstimatesPerPoint();

  List<PointFProxyApi> pointsInImage(SizeProxyApi imageSize);
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(name: 'VNFaceLandmarks', import: 'Vision'),
)
abstract class VNFaceLandmarksProxyApi {
  double getConfidence();
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'VNFaceLandmarks2D',
    import: 'Vision',
  ),
)
abstract class VNFaceLandmarks2DProxyApi extends VNFaceLandmarksProxyApi {
  VNFaceLandmarkRegion2DProxyApi? getAllPoints();
  VNFaceLandmarkRegion2DProxyApi? getFaceContour();
  VNFaceLandmarkRegion2DProxyApi? getLeftEye();
  VNFaceLandmarkRegion2DProxyApi? getRightEye();
  VNFaceLandmarkRegion2DProxyApi? getLeftEyebrow();
  VNFaceLandmarkRegion2DProxyApi? getRightEyebrow();
  VNFaceLandmarkRegion2DProxyApi? getNose();
  VNFaceLandmarkRegion2DProxyApi? getNoseCrest();
  VNFaceLandmarkRegion2DProxyApi? getMedianLine();
  VNFaceLandmarkRegion2DProxyApi? getOuterLips();
  VNFaceLandmarkRegion2DProxyApi? getInnerLips();
  VNFaceLandmarkRegion2DProxyApi? getLeftPupil();
  VNFaceLandmarkRegion2DProxyApi? getRightPupil();
}

@ProxyApi(
  swiftOptions: SwiftProxyApiOptions(
    name: 'VNFaceObservation',
    import: 'Vision',
  ),
)
abstract class VNFaceObservationProxyApi
    extends VNDetectedObjectObservationProxyApi {
  VNFaceLandmarks2DProxyApi? getLandmarks();
  double? getRoll();
  double? getYaw();
  double? getPitch();
}
