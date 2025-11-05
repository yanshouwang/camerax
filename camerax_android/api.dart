// Run with `dart run pigeon --input api.dart`.
import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/camerax_api.g.dart',
    dartOptions: DartOptions(),
    kotlinOut:
        'android/src/main/kotlin/dev/zeekr/camerax_android/CameraXApi.g.kt',
    kotlinOptions: KotlinOptions(
      package: 'dev.zeekr.camerax_android',
      errorClassName: 'CameraXError',
    ),
  ),
)
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

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.camera2.interop.Camera2CameraControl',
  ),
)
abstract class Camera2CameraControlProxyApi {
  Camera2CameraControlProxyApi.from(CameraControlProxyApi cameraControl);

  @async
  void addCaptureRequestOptions(CaptureRequestOptionsProxyApi bundle);
  @async
  void clearCaptureRequestOptions();
  CaptureRequestOptionsProxyApi getCaptureRequestOptions();
  @async
  void setCaptureRequestOptions(CaptureRequestOptionsProxyApi bundle);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.camera2.interop.Camera2CameraInfo',
  ),
)
abstract class Camera2CameraInfoProxyApi {
  Camera2CameraInfoProxyApi.from(CameraInfoProxyApi cameraInfo);

  String getCameraId();
  RangeProxyApi? getSensorInfoExposureTimeRange();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.camera2.interop.CaptureRequestOptions',
  ),
)
abstract class CaptureRequestOptionsProxyApi {
  CaptureRequestOptionsProxyApi.build({
    CameraMetadataControlModeApi? mode,
    CameraMetadataControlAeModeApi? aeMode,
    CameraMetadataControlAfModeApi? afMode,
    CameraMetadataControlAwbModeApi? awbMode,
    int? sensorExposureTime,
  });
}

// common
enum LocationFormatApi { formatDegrees, formatMinutes, formatSeconds }

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
  // yCbCr420Sp,  // NV21
  // yCbCr422I,   // YUY2
  // yCbCr422Sp,  // NV16
}

enum PermissionApi { video, audio }

enum SurfaceRotationApi { rotation0, rotation90, rotation180, rotation270 }

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'java.lang.AutoCloseable',
  ),
)
abstract class AutoCloseableProxyApi {
  void close();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(fullClassName: 'java.io.Closeable'),
)
abstract class CloseableProxyApi extends AutoCloseableProxyApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.common.ImageProxyConsumer',
  ),
)
abstract class ImageProxyConsumerProxyApi {
  ImageProxyConsumerProxyApi();

  late final void Function(ImageProxyProxyApi value) accept;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.zeekr.camerax_android.common.MlKitAnalyzerResultConsumer',
  ),
)
abstract class MlKitAnalyzerResultConsumerProxyApi {
  MlKitAnalyzerResultConsumerProxyApi();

  late final void Function(MlKitAnalyzerResultProxyApi value) accept;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.common.VideoRecordEventConsumer',
  ),
)
abstract class VideoRecordEventConsumerProxyApi {
  VideoRecordEventConsumerProxyApi();

  late final void Function(VideoRecordEventProxyApi value) accept;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'android.location.Location',
  ),
)
abstract class LocationProxyApi {
  @static
  String convert1(double coordinate, LocationFormatApi outputType);
  @static
  String convert2(String coordinate);
  @static
  void distanceBetween(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
    List<double> result,
  );

  LocationProxyApi.location(LocationProxyApi location);
  LocationProxyApi.provider(String? provider);

  double bearingTo(LocationProxyApi dest);
  double distanceTo(LocationProxyApi dest);
  // void dump(PrinterProxyApi pw, String? prefix);
  double getAccuracy();
  double getAltitude();
  double getBearing();
  double getBearingAccuracyDegrees();
  int getElapsedRealtimeAgeMillis1();
  int getElapsedRealtimeAgeMillis2(int referenceRealtimeMs);
  int getElapsedRealtimeMillis();
  int getElapsedRealtimeNanos();
  double getElapsedRealtimeUncertaintyNanos();
  // BundleProxyApi? getExtras();
  double getLatitude();
  double getLongitude();
  double getMslAltitudeAccuracyMeters();
  double getMslAltitudeMeters();
  String? getProvider();
  double getSpeed();
  double getSpeedAccuracyMetersPerSecond();
  int getTime();
  double getVerticalAccuracyMeters();
  bool hasAccuracy();
  bool hasAltitude();
  bool hasBearing();
  bool hasBearingAccuracy();
  bool hasElapsedRealtimeUncertaintyNanos();
  bool hasMslAltitude();
  bool hasMslAltitudeAccuracy();
  bool hasSpeed();
  bool hasSpeedAccuracy();
  bool hasVerticalAccuracy();
  bool isComplete();
  bool isFromMockProvider();
  bool isMock();
  void removeAccuracy();
  void removeAltitude();
  void removeBearing();
  void removeBearingAccuracy();
  void removeElapsedRealtimeUncertaintyNanos();
  void removeMslAltitude();
  void removeMslAltitudeAccuracy();
  void removeSpeed();
  void removeSpeedAccuracy();
  void removeVerticalAccuracy();
  void reset();
  void set(LocationProxyApi location);
  void setAccuracy(double horizontalAccuracyMeters);
  void setAltitude(double altitudeMeters);
  void setBearing(double bearingDegrees);
  void setBearingAccuracyDegrees(double bearingAccuracyDegrees);
  void setElapsedRealtimeNanos(int elapsedRealtimeNs);
  void setElapsedRealtimeUncertaintyNanos(double elapsedRealtimeUncertaintyNs);
  // void setExtras(BundleProxyApi? extras);
  void setLatitude(double latitudeDegrees);
  void setLongitude(double latitudeDegrees);
  void setMock(bool mock);
  void setMslAltitudeAccuracyMeters(double mslAltitudeAccuracyMeters);
  void setMslAltitudeMeters(double mslAltitudeMeters);
  void setProvider(String? provider);
  void setSpeed(double speedMetersPerSecond);
  void setSpeedAccuracyMetersPerSecond(double speedAccuracyMeterPerSecond);
  void setTime(int timeMs);
  void setVerticalAccuracyMeters(double altitudeAccuracyMeters);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.common.CameraStateObserver',
  ),
)
abstract class CameraStateObserverProxyApi {
  CameraStateObserverProxyApi();

  late final void Function(CameraStateApi value) onChanged;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.common.IntObserver',
  ),
)
abstract class IntObserverProxyApi {
  IntObserverProxyApi();

  late final void Function(int value) onChanged;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.zeekr.camerax_android.common.LowLightBoostStateObserver',
  ),
)
abstract class LowLightBoostStateObserverProxyApi {
  LowLightBoostStateObserverProxyApi();

  late final void Function(LowLightBoostStateApi value) onChanged;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.zeekr.camerax_android.common.PreviewViewStreamStateObserver',
  ),
)
abstract class PreviewViewStreamStateObserverProxyApi {
  PreviewViewStreamStateObserverProxyApi();

  late final void Function(PreviewViewStreamStateApi value) onChanged;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.common.TapToFocusInfoObserver',
  ),
)
abstract class TapToFocusInfoObserverProxyApi {
  TapToFocusInfoObserverProxyApi();

  late final void Function(TapToFocusInfoProxyApi value) onChanged;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.common.TorchStateObserver',
  ),
)
abstract class TorchStateObserverProxyApi {
  TorchStateObserverProxyApi();

  late final void Function(TorchStateApi value) onChanged;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.common.ZoomStateObserver',
  ),
)
abstract class ZoomStateObserverProxyApi {
  ZoomStateObserverProxyApi();

  late final void Function(ZoomStateProxyApi value) onChanged;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.common.PermissionManager',
  ),
)
abstract class PermissionManagerProxyApi {
  @static
  late final PermissionManagerProxyApi instance;

  bool checkPermissioin(PermissionApi permission);
  @async
  bool requestPermissions(List<PermissionApi> permissions);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(fullClassName: 'android.graphics.Point'),
)
abstract class PointProxyApi {
  PointProxyApi();
  PointProxyApi.src(PointProxyApi src);
  PointProxyApi.xy(int x, int y);

  int x();
  int y();

  bool equals(int x, int y);
  void negate();
  void offset(int dx, int dy);
  void set(int x, int y);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'android.graphics.PointF',
  ),
)
abstract class PointFProxyApi {
  @static
  double length2(double x, double y);

  PointFProxyApi();
  PointFProxyApi.p1(PointProxyApi p);
  PointFProxyApi.p2(PointFProxyApi p);
  PointFProxyApi.xy(double x, double y);

  double x();
  double y();

  bool equals(double x, double y);
  double length1();
  void negate();
  void offset(double dx, double dy);
  void set1(PointFProxyApi p);
  void set2(double x, double y);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(fullClassName: 'android.graphics.Rect'),
)
abstract class RectProxyApi {
  @static
  bool intersects2(RectProxyApi a, RectProxyApi b);
  @static
  RectProxyApi? unflattenFromString(String? str);

  RectProxyApi();
  RectProxyApi.r(RectProxyApi? r);
  RectProxyApi.ltrb(int left, int top, int right, int bottom);

  int bottom();
  int left();
  int right();
  int top();

  int centerX();
  int centerY();
  bool contains1(RectProxyApi r);
  bool contains2(int x, int y);
  bool contains3(int left, int top, int right, int bottom);
  double exactCenterX();
  double exactCenterY();
  String flattenToString();
  int height();
  // void inset1(InsetsProxyApi insets);
  void inset2(int dx, int dy);
  void inset3(int left, int top, int right, int bottom);
  bool intersect1(RectProxyApi r);
  bool intersect2(int left, int top, int right, int bottom);
  bool intersects1(int left, int top, int right, int bottom);
  bool isEmpty();
  void offset(int dx, int dy);
  void offsetTo(int newLeft, int newTop);
  void set1(RectProxyApi src);
  void set2(int left, int top, int right, int bottom);
  void setEmpty();
  bool setIntersect(RectProxyApi a, RectProxyApi b);
  void sort();
  String toShortString();
  void union1(RectProxyApi r);
  void union2(int x, int y);
  void union3(int left, int top, int right, int bottom);
  int width();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(fullClassName: 'android.util.Size'),
)
abstract class SizeProxyApi {
  SizeProxyApi(int width, int height);
  SizeProxyApi.parseSize(String stirng);

  int getHeight();
  int getWidth();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.common.Range',
  ),
)
abstract class RangeProxyApi {
  RangeProxyApi(int lower, int upper);
  // RangeProxyApi.create(int lower, int upper);

  int clamp(int value);
  bool contains1(RangeProxyApi range);
  bool contains2(int value);
  RangeProxyApi extend1(RangeProxyApi range);
  RangeProxyApi extend2(int value);
  RangeProxyApi extend3(int lower, int upper);
  int getLower();
  int getUpper();
  RangeProxyApi intersect1(RangeProxyApi range);
  RangeProxyApi intersect2(int lower, int upper);
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

enum FlashStateApi { unknown, fired, unavailable, notFired }

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

enum LowLightBoostStateApi { off, inactive, active }

enum MirrorModeApi { off, on, onFrontOnly }

enum TorchStateApi { off, on }

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'androidx.camera.core.resolutionselector.AspectRatioStrategy',
  ),
)
abstract class AspectRatioStrategyProxyApi {
  AspectRatioStrategyProxyApi(
    AspectRatioApi preferredAspectRatio,
    AspectRatioStrategyFallbackRuleApi fallbackRule,
  );

  AspectRatioStrategyFallbackRuleApi getFallbackRule();
  AspectRatioApi getPreferredAspectRatio();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.resolutionselector.ResolutionFilter',
  ),
)
abstract class ResolutionFilterProxyApi {
  ResolutionFilterProxyApi();

  late final List<SizeProxyApi> Function(
    List<SizeProxyApi> supportedSizes,
    int rotationDegrees,
  )
  filter;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.resolutionselector.ResolutionStrategy',
  ),
)
abstract class ResolutionStrategyProxyApi {
  ResolutionStrategyProxyApi(
    SizeProxyApi boundSize,
    ResolutionStrategyFallbackRuleApi fallbackRule,
  );

  SizeProxyApi? getBoundSize();
  ResolutionStrategyFallbackRuleApi getFallbackRule();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.resolutionselector.ResolutionSelector',
  ),
)
abstract class ResolutionSelectorProxyApi {
  ResolutionSelectorProxyApi.build({
    ResolutionSelectorModeApi? mode,
    AspectRatioStrategyProxyApi? aspectRatioStrategy,
    ResolutionFilterProxyApi? resolutionFilter,
    ResolutionStrategyProxyApi? resolutionStrategy,
  });

  ResolutionSelectorModeApi getAllowedResolutionMode();
  AspectRatioStrategyProxyApi getAspectRatioStrategy();
  ResolutionFilterProxyApi? getResolutionFilter();
  ResolutionStrategyProxyApi? getResolutionStrategy();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.CameraControl',
  ),
)
abstract class CameraControlProxyApi {
  @async
  void cancelFocusAndMetering();
  @async
  void enableLowLightBoostAsync(bool lowLightBoost);
  @async
  void enableTorch(bool torch);
  @async
  int setExposureCompensationIndex(int value);
  @async
  void setLinearZoom(double linearZoom);
  @async
  void setTorchStrengthLevel(int torchStrengthLevel);
  @async
  void setZoomRatio(double ratio);
  @async
  FocusMeteringResultProxyApi startFocusAndMetering(
    FocusMeteringActionProxyApi action,
  );
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.CameraInfo',
  ),
)
abstract class CameraInfoProxyApi {
  @static
  bool mustPlayShutterSound();

  CameraSelectorProxyApi getCameraSelector();
  CameraStateApi? getCameraState();
  void observeCameraState(CameraStateObserverProxyApi observer);
  void removeCameraStateObserver(CameraStateObserverProxyApi observer);
  ExposureStateProxyApi getExposureState();
  double getIntrinsicZoomRatio();
  CameraSelectorLensFacingApi getLensFacing();
  LowLightBoostStateApi getLowLightBoostState();
  void observeLowLightBoostState(LowLightBoostStateObserverProxyApi observer);
  void removeLowLightBoostStateObserver(
    LowLightBoostStateObserverProxyApi observer,
  );
  int getMaxTorchStrengthLevel();
  List<CameraInfoProxyApi> getPhysicalCameraInfos();
  int getSensorRotationDegrees1();
  int getSensorRotationDegrees2(SurfaceRotationApi relativeRotation);
  List<RangeProxyApi> getSupportedFrameRateRanges();
  // List<RangeProxyApi> getSupportedFrameRateRanges(
  //   SessionConfigProxyApi sessionConfig,
  // );
  TorchStateApi? getTorchState();
  void observeTorchState(TorchStateObserverProxyApi observer);
  void removeTorchStateObserver(TorchStateObserverProxyApi observer);
  int getTorchStrengthLevel();
  void observeTorchStrengthLevel(IntObserverProxyApi observer);
  void removeTorchStrengthLevelObserver(IntObserverProxyApi observer);
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
  List<DynamicRangeProxyApi> querySupportedDynamicRanges(
    List<DynamicRangeProxyApi> candidateDynamicRanges,
  );
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.CameraSelector',
  ),
)
abstract class CameraSelectorProxyApi {
  @static
  late final CameraSelectorProxyApi defaultBackCamera;
  @static
  late final CameraSelectorProxyApi defaultFrontCamera;

  CameraSelectorProxyApi.build({CameraSelectorLensFacingApi? lensFacing});
  // CameraSelectorProxyApi.of(List<CameraIdentifierProxyApi> cameraIdentifiers);

  List<CameraInfoProxyApi> filter(List<CameraInfoProxyApi> cameraInfos);
  String? getPhysicalCameraId();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.DynamicRange',
  ),
)
abstract class DynamicRangeProxyApi {
  DynamicRangeProxyApi(
    DynamicRangeEncodingApi encoding,
    DynamicRangeBitDepthApi bitDepth,
  );

  DynamicRangeBitDepthApi getBitDepth();
  DynamicRangeEncodingApi getEncoding();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ExposureState',
  ),
)
abstract class ExposureStateProxyApi {
  int getExposureCompensationIndex();
  RangeProxyApi getExposureCompensationRange();
  double getExposureCompensationStep();
  bool isExposureCompensationSupported();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.core.MeteringPointTuple',
  ),
)
abstract class MeteringPointTupleProxyApi {
  MeteringPointTupleProxyApi(
    MeteringPointProxyApi point, {
    List<FocusMeteringActionMeteringModeApi>? modes,
  });
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.core.DurationTuple',
  ),
)
abstract class DurationTupleProxyApi {
  DurationTupleProxyApi(int duration, TimeUnitApi timeUnit);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.FocusMeteringAction',
  ),
)
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

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.FocusMeteringResult',
  ),
)
abstract class FocusMeteringResultProxyApi {
  bool isFocusSuccessful();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ImageAnalysis.Analyzer',
  ),
)
abstract class ImageAnalysisAnalyzerProxyApi {
  void analyze(ImageProxyProxyApi image);
  SizeProxyApi? getDefaultTargetResolution();
  ImageAnalysisCoordinateSystemApi getTargetCoordinateSystem();
  // void updateTransform(MatrixProxyApi? matrix);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ImageAnalysis.Analyzer',
  ),
)
abstract class ImageAnalysisAnalyzerImplProxyApi
    extends ImageAnalysisAnalyzerProxyApi {
  ImageAnalysisAnalyzerImplProxyApi({
    required ImageProxyConsumerProxyApi consumer,
  });
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ImageCapture.OnImageCapturedCallback',
  ),
)
abstract class ImageCaptureOnImageCapturedCallbackProxyApi {
  ImageCaptureOnImageCapturedCallbackProxyApi();

  late final void Function(int progress)? onCaptureProcessProgressed;
  late final void Function()? onCaptureStarted;
  late final void Function(ImageProxyProxyApi image)? onCaptureSuccess;
  late final void Function(List<Object?> exception)? onError;
  late final void Function(BitmapProxyApi bitmap)? onPostviewBitmapAvailable;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ImageInfo',
  ),
)
abstract class ImageInfoProxyApi {
  FlashStateApi getFlashState();
  int getRotationDegrees();
  int getTimestamp();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ImageProxy.PlaneProxy',
  ),
)
abstract class ImageProxyPlaneProxyProxyApi {
  // ByteBufferProxyApi getBuffer();
  Uint8List getValue();
  int getPixelStride();
  int getRowStride();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ImageProxy',
  ),
)
abstract class ImageProxyProxyApi extends AutoCloseableProxyApi {
  RectProxyApi getCropRect();
  ImageFormatApi getFormat();
  int getHeight();
  // ImageProxyApi? getImage();
  ImageInfoProxyApi getImageInfo();
  List<ImageProxyPlaneProxyProxyApi> getPlanes();
  int getWidth();
  void setCropRect(RectProxyApi? rect);
  // BitmapProxyApi toBitmap();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.MeteringPoint',
  ),
)
abstract class MeteringPointProxyApi {
  double getSize();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.MeteringPointFactory',
  ),
)
abstract class MeteringPointFactoryProxyApi {
  @static
  double getDefaultPointSize();

  MeteringPointProxyApi createPoint1(double x, double y);
  MeteringPointProxyApi createPoint2(double x, double y, double size);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.SurfaceOrientedMeteringPointFactory',
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

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ZoomState',
  ),
)
abstract class ZoomStateProxyApi {
  double getLinearZoom();
  double getMaxZoomRatio();
  double getMinZoomRatio();
  double getZoomRatio();
}

// ml
enum BarcodeFormatApi {
  unknown,
  all,
  code128,
  code39,
  code93,
  codabar,
  dataMatrix,
  ean13,
  ean8,
  itf,
  qrCode,
  upcA,
  upcE,
  pdf417,
  aztec,
}

enum BarcodeTypeApi {
  unknown,
  contactInfo,
  email,
  isbn,
  phone,
  product,
  sms,
  text,
  url,
  wifi,
  geo,
  calendarEvent,
  driverLicense,
}

enum BarcodeAddressTypeApi { unknown, work, home }

enum BarcodeEmailTypeApi { unknown, work, home }

enum BarcodePhoneTypeApi { unknown, work, home, fax, mobile }

enum BarcodeWiFiTypeApi { open, wpa, wep }

enum FaceDetectorOptionsClassificationModeApi { none, all }

enum FaceDetectorOptionsContourModeApi { none, all }

enum FaceDetectorOptionsLandmarkModeApi { none, all }

enum FaceDetectorOptionsPerformanceModeApi { fast, accurate }

enum FaceContourTypeApi {
  face,
  leftCheek,
  leftEye,
  leftEyebrowBottom,
  leftEyebrowTop,
  lowerLipBottom,
  lowerLipTop,
  noseBottom,
  noseBridge,
  rightCheek,
  rightEye,
  rightEyebrowBottom,
  rightEyebrowTop,
  upperLipBottom,
  upperLipTop,
}

enum FaceLandmarkTypeApi {
  leftCheek,
  leftEar,
  leftEye,
  mouthBottom,
  mouthLeft,
  mouthRight,
  noseBase,
  rightCheek,
  rightEar,
  rightEye,
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.Address',
  ),
)
abstract class BarcodeAddressProxyApi {
  List<String> getAddressLines();
  BarcodeAddressTypeApi getType();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'com.google.mlkit.vision.barcode.common.Barcode.CalendarDateTime',
  ),
)
abstract class BarcodeCalendarDateTimeProxyApi {
  int getDay();
  int getHours();
  int getMinutes();
  int getMonth();
  String? getRawValue();
  int getSeconds();
  int getYear();
  bool isUtc();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'com.google.mlkit.vision.barcode.common.Barcode.CalendarEvent',
  ),
)
abstract class BarcodeCalendarEventProxyApi {
  String? getDescription();
  BarcodeCalendarDateTimeProxyApi? getEnd();
  String? getLocation();
  String? getOrganizer();
  BarcodeCalendarDateTimeProxyApi? getStart();
  String? getStatus();
  String? getSummary();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.ContactInfo',
  ),
)
abstract class BarcodeContactInfoProxyApi {
  List<BarcodeAddressProxyApi> getAddresses();
  List<BarcodeEmailProxyApi> getEmails();
  BarcodePersonNameProxyApi? getName();
  String? getOrganization();
  List<BarcodePhoneProxyApi> getPhones();
  String? getTitle();
  List<String> getUrls();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'com.google.mlkit.vision.barcode.common.Barcode.DriverLicense',
  ),
)
abstract class BarcodeDriverLicenseProxyApi {
  String? getAddressCity();
  String? getAddressState();
  String? getAddressStreet();
  String? getAddressZip();
  String? getBirthDate();
  String? getDocumentType();
  String? getExpiryDate();
  String? getFirstName();
  String? getGender();
  String? getIssueDate();
  String? getIssuingCountry();
  String? getLastName();
  String? getLicenseNumber();
  String? getMiddleName();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.Email',
  ),
)
abstract class BarcodeEmailProxyApi {
  String? getAddress();
  String? getBody();
  String? getSubject();
  BarcodeEmailTypeApi getType();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.GeoPoint',
  ),
)
abstract class BarcodeGeoPointProxyApi {
  double getLat();
  double getLng();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.PersonName',
  ),
)
abstract class BarcodePersonNameProxyApi {
  String? getFirst();
  String? getFormattedName();
  String? getLast();
  String? getMiddle();
  String? getPrefix();
  String? getPronunciation();
  String? getSuffix();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.Phone',
  ),
)
abstract class BarcodePhoneProxyApi {
  String? getNumber();
  BarcodePhoneTypeApi getType();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.Sms',
  ),
)
abstract class BarcodeSmsProxyApi {
  String? getMessage();
  String? getPhoneNumber();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.UrlBookmark',
  ),
)
abstract class BarcodeUrlBookmarkProxyApi {
  String? getTitle();
  String? getUrl();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.WiFi',
  ),
)
abstract class BarcodeWiFiProxyApi {
  BarcodeWiFiTypeApi getEncryptionType();
  String? getPassword();
  String? getSsid();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode',
  ),
)
abstract class BarcodeProxyApi {
  RectProxyApi? getBoundingBox();
  BarcodeCalendarEventProxyApi? getCalendarEvent();
  BarcodeContactInfoProxyApi? getContactInfo();
  List<PointProxyApi>? getCornerPoints();
  String? getDisplayValue();
  BarcodeDriverLicenseProxyApi? getDriverLicense();
  BarcodeEmailProxyApi? getEmail();
  BarcodeFormatApi getFormat();
  BarcodeGeoPointProxyApi? getGeoPoint();
  BarcodePhoneProxyApi? getPhone();
  Uint8List? getRawBytes();
  String? getRawValue();
  BarcodeSmsProxyApi? getSms();
  BarcodeUrlBookmarkProxyApi? getUrl();
  BarcodeTypeApi getValueType();
  BarcodeWiFiProxyApi? getWifi();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'com.google.mlkit.vision.barcode.ZoomSuggestionOptions.ZoomCallback',
  ),
)
abstract class ZoomSuggestionOptionsZoomCallbackProxyApi {
  ZoomSuggestionOptionsZoomCallbackProxyApi();

  late final bool Function(double zoomRatio) setZoom;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.ZoomSuggestionOptions',
  ),
)
abstract class ZoomSuggestionOptionsProxyApi {
  ZoomSuggestionOptionsProxyApi.build(
    ZoomSuggestionOptionsZoomCallbackProxyApi zoomCallback, {
    double? maxSupportedZoomRatio,
  });
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.BarcodeScannerOptions',
  ),
)
abstract class BarcodeScannerOptionsProxyApi {
  BarcodeScannerOptionsProxyApi.build({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormatApi>? formats,
    ZoomSuggestionOptionsProxyApi? zoomSuggestionOptions,
  });
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.BarcodeScanner',
  ),
)
abstract class BarcodeScannerProxyApi extends CloseableProxyApi {
  BarcodeScannerProxyApi();
  BarcodeScannerProxyApi.options(BarcodeScannerOptionsProxyApi options);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.face.FaceContour',
  ),
)
abstract class FaceContourProxyApi {
  FaceContourTypeApi getFaceContourType();
  List<PointFProxyApi> getPoints();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.face.FaceLandmark',
  ),
)
abstract class FaceLandmarkProxyApi {
  FaceLandmarkTypeApi getLandmarkType();
  PointFProxyApi getPosition();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.face.Face',
  ),
)
abstract class FaceProxyApi {
  List<FaceContourProxyApi> getAllContours();
  List<FaceLandmarkProxyApi> getAllLandmarks();
  RectProxyApi getBoundingBox();
  FaceContourProxyApi? getContour(FaceContourTypeApi contourType);
  double getHeadEulerAngleX();
  double getHeadEulerAngleY();
  double getHeadEulerAngleZ();
  FaceLandmarkProxyApi? getLandmark(FaceLandmarkTypeApi landmarkType);
  double? getLeftEyeOpenProbability();
  double? getRightEyeOpenProbability();
  double? getSmilingProbability();
  int? getTrackingId();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.face.FaceDetectorOptions',
  ),
)
abstract class FaceDetectorOptionsProxyApi {
  FaceDetectorOptionsProxyApi.build({
    bool? enableTracking,
    FaceDetectorOptionsClassificationModeApi? classificationMode,
    FaceDetectorOptionsContourModeApi? contourMode,
    FaceDetectorOptionsLandmarkModeApi? landmarkMode,
    double? minFaceSize,
    FaceDetectorOptionsPerformanceModeApi? performanceMode,
  });
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.face.FaceDetector',
  ),
)
abstract class FaceDetectorProxyApi extends CloseableProxyApi {
  FaceDetectorProxyApi();
  FaceDetectorProxyApi.options(FaceDetectorOptionsProxyApi options);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.mlkit.vision.MlKitAnalyzer.Result',
  ),
)
abstract class MlKitAnalyzerResultProxyApi {
  int getTimestamp();
  List<BarcodeProxyApi>? getValue1(BarcodeScannerProxyApi detector);
  List<FaceProxyApi>? getValue2(FaceDetectorProxyApi detector);
  List<Object?>? getThrowable1(BarcodeScannerProxyApi detector);
  List<Object?>? getThrowable2(FaceDetectorProxyApi detector);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.mlkit.vision.MlKitAnalyzer',
  ),
)
abstract class MlKitAnalyzerProxyApi extends ImageAnalysisAnalyzerProxyApi {
  MlKitAnalyzerProxyApi({
    required List<BarcodeScannerProxyApi> detectors1,
    required List<FaceDetectorProxyApi> detectors2,
    required ImageAnalysisCoordinateSystemApi targetCoordinateSystem,
    required MlKitAnalyzerResultConsumerProxyApi consumer,
  });
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

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.AudioStats',
  ),
)
abstract class AudioStatsProxyApi {
  double getAudioAmplitude();
  AudioStatsAudioStateApi getAudioState();
  List<Object?>? getErrorCause();
  bool hasAudio();
  bool hasError();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.FallbackStrategy',
  ),
)
abstract class FallbackStrategyProxyApi {
  FallbackStrategyProxyApi.higherQualityOrLowerThan(QualityProxyApi quality);
  FallbackStrategyProxyApi.higherQualityThan(QualityProxyApi quality);
  FallbackStrategyProxyApi.lowerQualityOrHigherThan(QualityProxyApi quality);
  FallbackStrategyProxyApi.lowerQualityThan(QualityProxyApi quality);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.OutputOptions',
  ),
)
abstract class OutputOptionsProxyApi {
  int getDurationLimitMillis();
  int getFileSizeLimit();
  LocationProxyApi? getLocation();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.FileOutputOptions',
  ),
)
abstract class FileOutputOptionsProxyApi extends OutputOptionsProxyApi {
  FileOutputOptionsProxyApi.build(
    String file, {
    int? durationLimitMillis,
    int? fileSizeLimitBytes,
    LocationProxyApi? location,
  });

  String getFile();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.OutputResults',
  ),
)
abstract class OutputResultsProxyApi {
  OutputResultsProxyApi();

  String? getOutputUri();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.Quality',
  ),
)
abstract class QualityProxyApi {
  @static
  late final QualityProxyApi fhd;
  @static
  late final QualityProxyApi hd;
  @static
  late final QualityProxyApi highest;
  @static
  late final QualityProxyApi lowest;
  @static
  late final QualityProxyApi sd;
  @static
  late final QualityProxyApi uhd;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.QualitySelector',
  ),
)
abstract class QualitySelectorProxyApi {
  @static
  SizeProxyApi? getResolution(
    CameraInfoProxyApi cameraInfo,
    QualityProxyApi quality,
  );

  QualitySelectorProxyApi.from1(QualityProxyApi quality);
  QualitySelectorProxyApi.from2(
    QualityProxyApi quality,
    FallbackStrategyProxyApi fallbackStrategy,
  );
  QualitySelectorProxyApi.fromOrderedList1(List<QualityProxyApi> qualities);
  QualitySelectorProxyApi.fromOrderedList2(
    List<QualityProxyApi> qualities,
    FallbackStrategyProxyApi fallbackStrategy,
  );
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.RecordingStats',
  ),
)
abstract class RecordingStatsProxyApi {
  AudioStatsProxyApi getAudioStats();
  int getNumBytesRecorded();
  int getRecordedDurationNanos();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.Recording',
  ),
)
abstract class RecordingProxyApi extends AutoCloseableProxyApi {
  bool isPersistent();
  void mute(bool muted);
  void pause();
  void resume();
  void stop();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent',
  ),
)
abstract class VideoRecordEventProxyApi {
  OutputOptionsProxyApi getOutputOptions();
  RecordingStatsProxyApi getRecordingStats();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent.Status',
  ),
)
abstract class VideoRecordStatusEventProxyApi
    extends VideoRecordEventProxyApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent.Start',
  ),
)
abstract class VideoRecordStartEventProxyApi extends VideoRecordEventProxyApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent.Pause',
  ),
)
abstract class VideoRecordPauseEventProxyApi extends VideoRecordEventProxyApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent.Resume',
  ),
)
abstract class VideoRecordResumeEventProxyApi
    extends VideoRecordEventProxyApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent.Finalize',
  ),
)
abstract class VideoRecordFinalizeEventProxyApi
    extends VideoRecordEventProxyApi {
  List<Object?>? getCause();
  VideoRecordFinalizeEventErrorApi getError();
  OutputResultsProxyApi getOutputResults();
  bool hasError();
}

// view
enum CameraControllerTapToFocusApi {
  tapToFocusNotStarted,
  tapToFocusStarted,
  tapToFocusFocused,
  tapToFocusNotFocused,
  tapToFocusFailed,
}

enum CameraControllerUseCaseApi { imageCapture, imageAnalysis, videoCapture }

enum PreviewViewImplementationModeApi { compatible, performance }

enum PreviewViewScaleTypeApi {
  fillStart,
  fillCenter,
  fillEnd,
  fitStart,
  fitCenter,
  fitEnd,
}

enum PreviewViewStreamStateApi { idle, streaming }

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.view.video.AudioConfig',
  ),
)
abstract class AudioConfigProxyApi {
  @static
  late final AudioConfigProxyApi audioDisabled;

  AudioConfigProxyApi.create(bool enableAudio);

  bool getAudioEnabled();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.view.CameraController',
  ),
)
abstract class CameraControllerProxyApi {
  // @async
  // void clearEffects();
  @async
  void clearImageAnalysisAnalyzer();
  @async
  void enableTorch(bool torchEnabled);
  @async
  CameraControlProxyApi? getCameraControl();
  @async
  CameraInfoProxyApi? getCameraInfo();
  @async
  CameraSelectorProxyApi getCameraSelector();
  // @async
  // ExecutorProxyApi? getImageAnalysisBackgroundExecutor();
  @async
  ImageAnalysisStrategyApi getImageAnalysisBackpressureStrategy();
  @async
  int getImageAnalysisImageQueueDepth();
  @async
  ImageAnalysisOutputImageFormatApi getImageAnalysisOutputImageFormat();
  @async
  ResolutionSelectorProxyApi? getImageAnalysisResolutionSelector();
  @async
  ImageCaptureFlashModeApi getImageCaptureFlashMode();
  // @async
  // ExecutorProxyApi? getImageCaptureIoExecutor();
  @async
  ImageCaptureCaptureModeApi getImageCaptureMode();
  @async
  ResolutionSelectorProxyApi? getImageCaptureResolutionSelector();
  // @async
  // void getInitializeFuture();
  @async
  ResolutionSelectorProxyApi? getPreviewResolutionSelector();
  @async
  TapToFocusInfoProxyApi getTapToFocusInfoState();
  @async
  void observeTapToFocusInfoState(TapToFocusInfoObserverProxyApi observer);
  @async
  void removeTapToFocusInfoStateObserver(
    TapToFocusInfoObserverProxyApi observer,
  );
  @async
  TorchStateApi? getTorchState();
  @async
  void observeTorchState(TorchStateObserverProxyApi observer);
  @async
  void removeTorchStateObserver(TorchStateObserverProxyApi observer);
  @async
  DynamicRangeProxyApi getVideoCaptureDynamicRange();
  @async
  MirrorModeApi getVideoCaptureMirrorMode();
  @async
  QualitySelectorProxyApi getVideoCaptureQualitySelector();
  @async
  RangeProxyApi getVideoCaptureTargetFrameRate();
  @async
  ZoomStateProxyApi? getZoomState();
  @async
  void observeZoomState(ZoomStateObserverProxyApi observer);
  @async
  void removeZoomStateObserver(ZoomStateObserverProxyApi observer);
  @async
  bool hasCamera(CameraSelectorProxyApi cameraSelector);
  @async
  bool isImageAnalysisEnabled();
  @async
  bool isImageCaptureEnabled();
  @async
  bool isPinchToZoomEnabled();
  @async
  bool isRecording();
  @async
  bool isTapToFocusEnabled();
  @async
  bool isVideoCaptureEnabled();
  @async
  void setCameraSelector(CameraSelectorProxyApi cameraSelector);
  // @async
  // void setEffects(List<CameraEffectProxyApi> effects);
  @async
  void setEnabledUseCases(List<CameraControllerUseCaseApi> enabledUseCases);
  @async
  void setImageAnalysisAnalyzer(ImageAnalysisAnalyzerProxyApi analyzer);
  // @async
  // void setImageAnalysisBackgroundExecutor(ExecutorProxyApi? executor);
  @async
  void setImageAnalysisBackpressureStrategy(ImageAnalysisStrategyApi strategy);
  @async
  void setImageAnalysisImageQueueDepth(int depth);
  @async
  void setImageAnalysisOutputImageFormat(
    ImageAnalysisOutputImageFormatApi imageAnalysisOutputImageFormat,
  );
  @async
  void setImageAnalysisResolutionSelector(
    ResolutionSelectorProxyApi? resolutionSelector,
  );
  @async
  void setImageCaptureFlashMode(ImageCaptureFlashModeApi flashMode);
  // @async
  // void setImageCaptureIoExecutor(ExecutorProxyApi executor);
  @async
  void setImageCaptureMode(ImageCaptureCaptureModeApi captureMode);
  @async
  void setImageCaptureResolutionSelector(
    ResolutionSelectorProxyApi? resolutionSelector,
  );
  @async
  void setLinearZoom(double linearZoom);
  @async
  void setPinchToZoomEnabled(bool enabled);
  @async
  void setPreviewResolutionSelector(
    ResolutionSelectorProxyApi? resolutionSelector,
  );
  @async
  void setTapToFocusAutoCancelDuration(DurationTupleProxyApi duration);
  @async
  void setTapToFocusEnabled(bool enabled);
  @async
  void setVideoCaptureDynamicRange(DynamicRangeProxyApi dynamicRange);
  @async
  void setVideoCaptureMirrorMode(MirrorModeApi mirrorMode);
  @async
  void setVideoCaptureQualitySelector(QualitySelectorProxyApi qualitySelector);
  @async
  void setVideoCaptureTargetFrameRate(RangeProxyApi targetFrameRate);
  @async
  void setZoomRatio(double zoomRatio);
  // @async
  // RecordingProxyApi startRecording(
  //   FileDescriptorOutputOptionsProxyApi outputOptions,
  //   AudioConfigProxyApi audioConfig,
  //   VideoRecordEventConsumerProxyApi listener,
  // );
  @async
  RecordingProxyApi startRecording(
    FileOutputOptionsProxyApi outputOptions,
    AudioConfigProxyApi audioConfig,
    VideoRecordEventConsumerProxyApi listener,
  );
  // @async
  // RecordingProxyApi startRecording(
  //   MediaStoreOutputOptionsProxyApi outputOptions,
  //   AudioConfigProxyApi audioConfig,
  //   VideoRecordEventConsumerProxyApi listener,
  // );
  @async
  void takePicture({
    required ImageCaptureOnImageCapturedCallbackProxyApi callback,
  });
  // @async
  // void takePicture({
  //   required ImageCaptureOutputFileOptionsProxyApi outputFileOptions,
  //   required ImageCaptureOnImageSavedCallbackProxyApi imageSavedCallback,
  // });
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.view.LifecycleCameraController',
  ),
)
abstract class LifecycleCameraControllerProxyApi
    extends CameraControllerProxyApi {
  LifecycleCameraControllerProxyApi();

  @async
  void bindToLifecycle();
  @async
  void unbind();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.view.PreviewView',
  ),
)
abstract class PreviewViewProxyApi {
  PreviewViewProxyApi();

  // @async
  // BitmapProxyApi? getBitmap();
  @async
  CameraControllerProxyApi? getController();
  @async
  PreviewViewImplementationModeApi getImplementationMode();
  @async
  MeteringPointFactoryProxyApi getMeteringPointFactory();
  // OutputTransformProxyApi? getOutputTransform();
  PreviewViewStreamStateApi getPreviewStreamState();
  void observePreviewStreamState(
    PreviewViewStreamStateObserverProxyApi observer,
  );
  void removePreviewStreamStateObserver(
    PreviewViewStreamStateObserverProxyApi observer,
  );
  @async
  PreviewViewScaleTypeApi getScaleType();
  // @async
  // ImageCaptureScreenFalshProxyApi? getScreenFlash();
  // @async
  // MatrixProxyApi? getSensorToViewTransform();
  // @async
  // PreviewSurfaceProviderProxyApi getSurfaceProvider();
  // @async
  // VidePortProxyApi? getViewPort1();
  // @async
  // VidePortProxyApi? getViewPort2(SurfaceRotationApi targetRotation);
  // bool onTouchEvent(MotionEventProxyApi event);
  bool performClick();
  @async
  void setController(CameraControllerProxyApi? controller);
  @async
  void setImplementationMode(
    PreviewViewImplementationModeApi implementationMode,
  );
  @async
  void setScaleType(PreviewViewScaleTypeApi scaleType);
  void setScreenFlashOverlayColor(int color);
  // @async
  // void setScreenFlashWindow(WindowProxyApi? screenFlashWindow);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.view.RotationProvider.Listener',
  ),
)
abstract class RotationProviderListenerProxyApi {
  RotationProviderListenerProxyApi();

  late final void Function(int rotation) onRotationChanged;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.view.RotationProvider',
  ),
)
abstract class RotationProviderProxyApi {
  RotationProviderProxyApi();

  bool addListener(RotationProviderListenerProxyApi listener);
  void removeListener(RotationProviderListenerProxyApi listener);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.view.TapToFocusInfo',
  ),
)
abstract class TapToFocusInfoProxyApi {
  TapToFocusInfoProxyApi(
    CameraControllerTapToFocusApi focusState,
    PointFProxyApi? tapPoint,
  );

  CameraControllerTapToFocusApi getFocusState();
  PointFProxyApi? getTapPoint();
}
