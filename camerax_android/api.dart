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

  RangeProxyApi? getSensorInfoExposureTimeRange();
  String getCameraId();
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
    fullClassName: 'android.location.Location',
  ),
)
abstract class LocationProxyApi {
  LocationProxyApi();

  late final double latitude;
  late final double longitude;
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
    fullClassName: 'dev.zeekr.camerax_android.common.VideoRecordEventConsumer',
  ),
)
abstract class VideoRecordEventConsumerProxyApi {
  VideoRecordEventConsumerProxyApi();

  late final void Function(VideoRecordEventProxyApi value) accept;
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

  late final int x;
  late final int y;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'android.graphics.PointF',
  ),
)
abstract class PointFProxyApi {
  PointFProxyApi();

  late final double x;
  late final double y;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(fullClassName: 'android.graphics.Rect'),
)
abstract class RectProxyApi {
  RectProxyApi();

  late final int left;
  late final int top;
  late final int right;
  late final int bottom;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(fullClassName: 'android.util.Size'),
)
abstract class SizeProxyApi {
  SizeProxyApi();

  late final int width;
  late final int height;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.common.Range',
  ),
)
abstract class RangeProxyApi {
  RangeProxyApi();

  late final int lower;
  late final int upper;
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

  AspectRatioApi getPreferredAspectRatio();
  AspectRatioStrategyFallbackRuleApi getFallbackRule();
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
  void enableTorch(bool torch);
  @async
  void setZoomRatio(double ratio);
  @async
  void setLinearZoom(double linearZoom);
  @async
  FocusMeteringResultProxyApi startFocusAndMetering(
    FocusMeteringActionProxyApi action,
  );
  @async
  void cancelFocusAndMetering();
  @async
  int setExposureCompensationIndex(int value);
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
  TorchStateApi? getTorchState();
  void observeTorchState(TorchStateObserverProxyApi observer);
  void removeTorchStateObserver(TorchStateObserverProxyApi observer);
  ZoomStateProxyApi? getZoomState();
  void observeZoomState(ZoomStateObserverProxyApi observer);
  void removeZoomStateObserver(ZoomStateObserverProxyApi observer);
  ExposureStateProxyApi getExposureState();
  double getIntrinsticZoomRatio();
  CameraSelectorLensFacingApi getLensFacing();
  List<CameraInfoProxyApi> getPhysicalCameraInfos();
  int getSensorRotationDegrees();
  List<RangeProxyApi> getSupportedFrameRateRanges();
  bool isLogicalMultiCameraSupported();
  bool isZslSupported();
  bool hasFlashUnit();
  bool isFocusMeteringSupported(FocusMeteringActionProxyApi action);
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
  late final CameraSelectorProxyApi front;
  @static
  late final CameraSelectorProxyApi back;
  @static
  late final CameraSelectorProxyApi external;

  CameraSelectorProxyApi.build({CameraSelectorLensFacingApi? lensFacing});
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

  DynamicRangeEncodingApi getEncoding();
  DynamicRangeBitDepthApi getBitDepth();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ExposureState',
  ),
)
abstract class ExposureStateProxyApi {
  late final int exposureCompensationIndex;
  late final RangeProxyApi exposureCompensationRange;
  late final double exposureCompensationStep;
  late final bool isExposureCompensationSupported;
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
  late final bool isFocusSuccessful;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ImageAnalysis.Analyzer',
  ),
)
abstract class ImageAnalysisAnalyzerProxyApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ImageAnalysis.Analyzer',
  ),
)
abstract class ImageAnalysisAnalyzerImplProxyApi
    implements ImageAnalysisAnalyzerProxyApi {
  ImageAnalysisAnalyzerImplProxyApi();

  late final void Function(ImageProxyProxyApi image) analyze;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ImageCapture.OnImageCapturedCallback',
  ),
)
abstract class ImageCaptureOnImageCapturedCallbackProxyApi {
  ImageCaptureOnImageCapturedCallbackProxyApi();

  late final void Function()? onCaptureStarted;
  late final void Function(int progress)? onCaptureProcessProgressed;
  late final void Function(Uint8List bitmap)? onPostviewBitmapAvailable;
  late final void Function(ImageProxyProxyApi image)? onCaptureSuccess;
  late final void Function(List<Object?> exception)? onError;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ImageInfo',
  ),
)
abstract class ImageInfoProxyApi {
  late final int timestamp;
  late final int rotationDegrees;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ImageProxy.PlaneProxy',
  ),
)
abstract class ImageProxyPlaneProxyProxyApi {
  late final Uint8List value;
  late final int pixelStride;
  late final int rowStride;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ImageProxy',
  ),
)
abstract class ImageProxyProxyApi extends AutoCloseableProxyApi {
  late final ImageFormatApi format;
  late final int width;
  late final int height;
  late final List<ImageProxyPlaneProxyProxyApi> planes;
  late final ImageInfoProxyApi imageInfo;

  RectProxyApi getCropRect();
  void setCropRect(RectProxyApi? rect);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.MeteringPoint',
  ),
)
abstract class MeteringPointProxyApi {
  late final double size;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.MeteringPointFactory',
  ),
)
abstract class MeteringPointFactoryProxyApi {
  MeteringPointProxyApi createPoint(double x, double y, {double? size});
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.SurfaceOrientedMeteringPointFactory',
  ),
)
abstract class SurfaceOrientedMeteringPointFactoryProxyApi
    extends MeteringPointFactoryProxyApi {
  SurfaceOrientedMeteringPointFactoryProxyApi(double width, double height);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ZoomState',
  ),
)
abstract class ZoomStateProxyApi {
  late final double minZoomRatio;
  late final double maxZoomRatio;
  late final double zoomRatio;
  late final double linearZoom;
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
    fullClassName: 'androidx.camera.mlkit.vision.MlKitAnalyzer.Result',
  ),
)
abstract class MlKitAnalyzerResultProxyApi {
  late final int timestamp;

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
abstract class MlKitAnalyzerProxyApi implements ImageAnalysisAnalyzerProxyApi {
  MlKitAnalyzerProxyApi({
    required List<BarcodeScannerProxyApi> detectors1,
    required List<FaceDetectorProxyApi> detectors2,
    required ImageAnalysisCoordinateSystemApi targetCoordinateSystem,
    required MlKitAnalyzerResultConsumerProxyApi consumer,
  });
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.Address',
  ),
)
abstract class BarcodeAddressProxyApi {
  late final BarcodeAddressTypeApi type;
  late final List<String> addressLines;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'com.google.mlkit.vision.barcode.common.Barcode.CalendarDateTime',
  ),
)
abstract class BarcodeCalendarDateTimeProxyApi {
  late final String? rawValue;
  late final int year;
  late final int month;
  late final int day;
  late final int hours;
  late final int minutes;
  late final int seconds;
  late final bool isUtc;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'com.google.mlkit.vision.barcode.common.Barcode.CalendarEvent',
  ),
)
abstract class BarcodeCalendarEventProxyApi {
  late final BarcodeCalendarDateTimeProxyApi? start;
  late final BarcodeCalendarDateTimeProxyApi? end;
  late final String? location;
  late final String? organizer;
  late final String? summary;
  late final String? description;
  late final String? status;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.ContactInfo',
  ),
)
abstract class BarcodeContactInfoProxyApi {
  late final List<BarcodeAddressProxyApi> addresses;
  late final List<BarcodeEmailProxyApi> emails;
  late final BarcodePersonNameProxyApi? name;
  late final String? organization;
  late final List<BarcodePhoneProxyApi> phones;
  late final String? title;
  late final List<String> urls;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'com.google.mlkit.vision.barcode.common.Barcode.DriverLicense',
  ),
)
abstract class BarcodeDriverLicenseProxyApi {
  late final String? licenseNumber;
  late final String? documentType;
  late final String? expiryDate;
  late final String? firstName;
  late final String? middleName;
  late final String? lastName;
  late final String? gender;
  late final String? birthDate;
  late final String? issueDate;
  late final String? issuingCountry;
  late final String? addressState;
  late final String? addressCity;
  late final String? addressStreet;
  late final String? addressZip;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.Email',
  ),
)
abstract class BarcodeEmailProxyApi {
  late final BarcodeEmailTypeApi type;
  late final String? address;
  late final String? subject;
  late final String? body;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.GeoPoint',
  ),
)
abstract class BarcodeGeoPointProxyApi {
  late final double lat;
  late final double lng;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.PersonName',
  ),
)
abstract class BarcodePersonNameProxyApi {
  late final String? formattedName;
  late final String? pronunciation;
  late final String? prefix;
  late final String? first;
  late final String? middle;
  late final String? last;
  late final String? suffix;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.Phone',
  ),
)
abstract class BarcodePhoneProxyApi {
  late final BarcodePhoneTypeApi type;
  late final String? number;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.Sms',
  ),
)
abstract class BarcodeSmsProxyApi {
  late final String? phoneNumber;
  late final String? message;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.UrlBookmark',
  ),
)
abstract class BarcodeUrlBookmarkProxyApi {
  late final String? title;
  late final String? url;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.WiFi',
  ),
)
abstract class BarcodeWiFiProxyApi {
  late final BarcodeWiFiTypeApi encryptionType;
  late final String? ssid;
  late final String? password;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode',
  ),
)
abstract class BarcodeProxyApi {
  late final RectProxyApi? boundingBox;
  late final List<PointProxyApi>? cornerPoints;
  late final BarcodeFormatApi format;
  late final BarcodeTypeApi valueType;
  late final Uint8List? rawBytes;
  late final String? rawValue;
  late final String? displayValue;
  late final BarcodeCalendarEventProxyApi? calendarEvent;
  late final BarcodeContactInfoProxyApi? contactInfo;
  late final BarcodeDriverLicenseProxyApi? driverLicense;
  late final BarcodeEmailProxyApi? email;
  late final BarcodeGeoPointProxyApi? geoPoint;
  late final BarcodePhoneProxyApi? phone;
  late final BarcodeSmsProxyApi? sms;
  late final BarcodeUrlBookmarkProxyApi? url;
  late final BarcodeWiFiProxyApi? wifi;
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
abstract class BarcodeScannerProxyApi extends CloseableProxyApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.BarcodeScanning',
  ),
)
abstract class BarcodeScanningProxyApi {
  @static
  BarcodeScannerProxyApi getClient1();
  @static
  BarcodeScannerProxyApi getClient2(BarcodeScannerOptionsProxyApi options);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.face.FaceContour',
  ),
)
abstract class FaceContourProxyApi {
  late final FaceContourTypeApi type;
  late final List<PointFProxyApi> points;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.face.FaceLandmark',
  ),
)
abstract class FaceLandmarkProxyApi {
  late final FaceLandmarkTypeApi type;
  late final PointFProxyApi position;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.face.Face',
  ),
)
abstract class FaceProxyApi {
  late final RectProxyApi boundingBox;
  late final List<FaceContourProxyApi> allContours;
  late final List<FaceLandmarkProxyApi> allLandmarks;
  late final double headEulerAngleX;
  late final double headEulerAngleY;
  late final double headEulerAngleZ;
  late final double? leftEyeOpenProbability;
  late final double? rightEyeOpenProbability;
  late final double? smilingProbability;
  late final int? trackingId;

  FaceContourProxyApi? getContour(FaceContourTypeApi contourType);
  FaceLandmarkProxyApi? getLandmark(FaceLandmarkTypeApi landmarkType);
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
abstract class FaceDetectorProxyApi extends CloseableProxyApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.face.FaceDetection',
  ),
)
abstract class FaceDetectionProxyApi {
  @static
  FaceDetectorProxyApi getClient1();
  @static
  FaceDetectorProxyApi getClient2(FaceDetectorOptionsProxyApi options);
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
  late final double audioAmplitude;
  late final AudioStatsAudioStateApi audioState;
  late final List<Object?>? errorCause;
  late final bool hasAudio;
  late final bool hasError;
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
  late final String? outputUri;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.QualitySelector',
  ),
)
abstract class QualitySelectorProxyApi {
  QualitySelectorProxyApi.from(
    QualityProxyApi quality, {
    FallbackStrategyProxyApi? fallbackStrategy,
  });

  QualitySelectorProxyApi.fromOrderedList(
    List<QualityProxyApi> qualities, {
    FallbackStrategyProxyApi? fallbackStrategy,
  });

  @static
  SizeProxyApi? getResolution(
    CameraInfoProxyApi cameraInfo,
    QualityProxyApi quality,
  );
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
    fullClassName: 'androidx.camera.video.RecordingStats',
  ),
)
abstract class RecordingStatsProxyApi {
  late final AudioStatsProxyApi audioStats;
  late final int numBytesRecorded;
  late final int recordedDurationNanos;
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
abstract class VideoRecordEventProxyApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent.Status',
  ),
)
abstract class VideoRecordStatusEventProxyApi extends VideoRecordEventProxyApi {
  late final RecordingStatsProxyApi recordingStats;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent.Start',
  ),
)
abstract class VideoRecordStartEventProxyApi extends VideoRecordEventProxyApi {
  late final RecordingStatsProxyApi recordingStats;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent.Pause',
  ),
)
abstract class VideoRecordPauseEventProxyApi extends VideoRecordEventProxyApi {
  late final RecordingStatsProxyApi recordingStats;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent.Resume',
  ),
)
abstract class VideoRecordResumeEventProxyApi extends VideoRecordEventProxyApi {
  late final RecordingStatsProxyApi recordingStats;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent.Finalize',
  ),
)
abstract class VideoRecordFinalizeEventProxyApi
    extends VideoRecordEventProxyApi {
  late final RecordingStatsProxyApi recordingStats;
  late final List<Object?>? cause;
  late final VideoRecordFinalizeEventErrorApi error;
  late final OutputResultsProxyApi outputResults;
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
  @async
  void initialize();
  @async
  bool hasCamera(CameraSelectorProxyApi cameraSelector);
  @async
  CameraSelectorProxyApi getCameraSelector();
  @async
  void setCameraSelector(CameraSelectorProxyApi cameraSelector);
  @async
  CameraInfoProxyApi? getCameraInfo();
  @async
  CameraControlProxyApi? getCameraControl();
  @async
  TorchStateApi? getTorchState();
  @async
  void observeTorchState(TorchStateObserverProxyApi observer);
  @async
  void removeTorchStateObserver(TorchStateObserverProxyApi observer);
  @async
  void enableTorch(bool torchEnabled);
  @async
  ZoomStateProxyApi? getZoomState();
  @async
  void observeZoomState(ZoomStateObserverProxyApi observer);
  @async
  void removeZoomStateObserver(ZoomStateObserverProxyApi observer);
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
  void setEnabledUseCases(List<CameraControllerUseCaseApi> enabledUseCases);
  @async
  ResolutionSelectorProxyApi? getPreviewResolutionSelector();
  @async
  void setPreviewResolutionSelector(
    ResolutionSelectorProxyApi? resolutionSelector,
  );
  @async
  ResolutionSelectorProxyApi? getImageCaptureResolutionSelector();
  @async
  void setImageCaptureResolutionSelector(
    ResolutionSelectorProxyApi? resolutionSelector,
  );
  @async
  ImageCaptureCaptureModeApi getImageCaptureMode();
  @async
  void setImageCaptureMode(ImageCaptureCaptureModeApi captureMode);
  @async
  ImageCaptureFlashModeApi getImageCaptureFlashMode();
  @async
  void setImageCaptureFlashMode(ImageCaptureFlashModeApi flashMode);
  @async
  void takePicture(
    ImageCaptureOnImageCapturedCallbackProxyApi capturedCallback,
  );
  @async
  ResolutionSelectorProxyApi? getImageAnalysisResolutionSelector();
  @async
  void setImageAnalysisResolutionSelector(
    ResolutionSelectorProxyApi? resolutionSelector,
  );
  @async
  ImageAnalysisStrategyApi getImageAnalysisBackpressureStrategy();
  @async
  void setImageAnalysisBackpressureStrategy(ImageAnalysisStrategyApi strategy);
  @async
  int getImageAnalysisImageQueueDepth();
  @async
  void setImageAnalysisImageQueueDepth(int depth);
  @async
  ImageAnalysisOutputImageFormatApi getImageAnalysisOutputImageFormat();
  @async
  void setImageAnalysisOutputImageFormat(
    ImageAnalysisOutputImageFormatApi imageAnalysisOutputImageFormat,
  );
  @async
  void setImageAnalysisAnalyzer(ImageAnalysisAnalyzerProxyApi analyzer);
  @async
  void clearImageAnalysisAnalyzer();
  @async
  DynamicRangeProxyApi getVideoCaptureDynamicRange();
  @async
  void setVideoCaptureDynamicRange(DynamicRangeProxyApi dynamicRange);
  @async
  MirrorModeApi getVideoCaptureMirrorMode();
  @async
  void setVideoCaptureMirrorMode(MirrorModeApi mirrorMode);
  @async
  QualitySelectorProxyApi getVideoCaptureQualitySelector();
  @async
  void setVideoCaptureQualitySelector(QualitySelectorProxyApi qualitySelector);
  @async
  RangeProxyApi getVideoCaptureTargetFrameRate();
  @async
  void setVideoCaptureTargetFrameRate(RangeProxyApi targetFrameRate);
  @async
  bool isRecording();
  @async
  RecordingProxyApi startRecording(
    FileOutputOptionsProxyApi outputOptions,
    AudioConfigProxyApi audioConfig,
    VideoRecordEventConsumerProxyApi listener,
  );
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

  @async
  CameraControllerProxyApi? getController();
  @async
  void setController(CameraControllerProxyApi? controller);
  @async
  PreviewViewScaleTypeApi getScaleType();
  @async
  void setScaleType(PreviewViewScaleTypeApi scaleType);
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
