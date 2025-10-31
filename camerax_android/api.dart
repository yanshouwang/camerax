// Run with `dart run pigeon --input api.dart`.
import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/camerax.g.dart',
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
abstract class Camera2CameraControlApi {
  Camera2CameraControlApi.from(CameraControlApi cameraControl);

  @async
  void addCaptureRequestOptions(CaptureRequestOptionsApi bundle);
  @async
  void clearCaptureRequestOptions();
  CaptureRequestOptionsApi getCaptureRequestOptions();
  @async
  void setCaptureRequestOptions(CaptureRequestOptionsApi bundle);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.camera2.interop.Camera2CameraInfo',
  ),
)
abstract class Camera2CameraInfoApi {
  Camera2CameraInfoApi.from(CameraInfoApi cameraInfo);

  LongRangeApi? getSensorInfoExposureTimeRange();
  String getCameraId();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.camera2.interop.CaptureRequestOptions',
  ),
)
abstract class CaptureRequestOptionsApi {
  CaptureRequestOptionsApi.build({
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
  yCbCr420Sp,
  yCbCr422I,
  yCbCr422Sp,
}

enum PermissionApi { video, audio }

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'java.lang.AutoCloseable',
  ),
)
abstract class AutoCloseableApi {
  void close();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(fullClassName: 'java.io.Closeable'),
)
abstract class CloseableApi extends AutoCloseableApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'android.location.Location',
  ),
)
abstract class LocationApi {
  LocationApi();

  late final double latitude;
  late final double longitude;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.common.CameraStateObserver',
  ),
)
abstract class CameraStateObserverApi {
  CameraStateObserverApi();

  late final void Function(CameraStateApi value) onChanged;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.common.TorchStateObserver',
  ),
)
abstract class TorchStateObserverApi {
  TorchStateObserverApi();

  late final void Function(TorchStateApi value) onChanged;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.common.ZoomStateObserver',
  ),
)
abstract class ZoomStateObserverApi {
  ZoomStateObserverApi();

  late final void Function(ZoomStateApi value) onChanged;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.common.VideoRecordEventConsumer',
  ),
)
abstract class VideoRecordEventConsumerApi {
  VideoRecordEventConsumerApi();

  late final void Function(VideoRecordEventApi value) accept;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.zeekr.camerax_android.common.MlKitAnalyzerResultConsumer',
  ),
)
abstract class MlKitAnalyzerResultConsumerApi {
  MlKitAnalyzerResultConsumerApi();

  late final void Function(MlKitAnalyzerResultApi value) accept;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.common.PermissionManager',
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
  kotlinOptions: KotlinProxyApiOptions(fullClassName: 'android.graphics.Point'),
)
abstract class PointApi {
  PointApi();

  late final int x;
  late final int y;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'android.graphics.PointF',
  ),
)
abstract class PointFApi {
  PointFApi();

  late final double x;
  late final double y;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(fullClassName: 'android.graphics.Rect'),
)
abstract class RectApi {
  RectApi();

  late final int left;
  late final int top;
  late final int right;
  late final int bottom;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(fullClassName: 'android.util.Size'),
)
abstract class SizeApi {
  SizeApi();

  late final int width;
  late final int height;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.common.IntRange',
  ),
)
abstract class IntRangeApi {
  IntRangeApi();

  late final int lower;
  late final int upper;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.common.LongRange',
  ),
)
abstract class LongRangeApi {
  LongRangeApi();

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

enum DynamicRangeBitDepthApi {
  bitDepthUnspecified,
  bitDepth8Bit,
  bitDepth10Bit,
}

enum ImageAnalysisStrategyApi { keepOnlyLatest, blockProducer }

enum ImageAnalysisCoordinateSystemApi { original, sensor, viewReferenced }

enum ImageAnalysisOutputImageFormatApi { yuv_420_888, rgba_8888, nv21 }

enum ImageCaptureCaptureModeApi {
  maximizeQuality,
  minimizeLatency,
  zeroShutterLag,
}

enum ImageCaptureFlashModeApi { auto, on, off, screen }

enum MeteringModeApi { af, ae, awb }

enum MirrorModeApi { off, on, onFrontOnly }

enum TorchStateApi { off, on }

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'androidx.camera.core.resolutionselector.AspectRatioStrategy',
  ),
)
abstract class AspectRatioStrategyApi {
  AspectRatioStrategyApi();

  late final AspectRatioApi preferredAspectRatio;
  late final AspectRatioStrategyFallbackRuleApi fallbackRule;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.resolutionselector.ResolutionFilter',
  ),
)
abstract class ResolutionFilterApi {
  ResolutionFilterApi();

  late final List<SizeApi> Function(
    List<SizeApi> supportedSizes,
    int rotationDegrees,
  )
  filter;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.resolutionselector.ResolutionStrategy',
  ),
)
abstract class ResolutionStrategyApi {
  ResolutionStrategyApi();

  late final SizeApi? boundSize;
  late final ResolutionStrategyFallbackRuleApi fallbackRule;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.resolutionselector.ResolutionSelector',
  ),
)
abstract class ResolutionSelectorApi {
  ResolutionSelectorApi();

  late final ResolutionSelectorModeApi allowedResolutionMode;
  late final AspectRatioStrategyApi aspectRatioStrategy;
  late final ResolutionFilterApi? resolutionFilter;
  late final ResolutionStrategyApi? resolutionStrategy;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.CameraControl',
  ),
)
abstract class CameraControlApi {
  @async
  void enableTorch(bool torch);
  @async
  void setZoomRatio(double ratio);
  @async
  void setLinearZoom(double linearZoom);
  @async
  FocusMeteringResultApi startFocusAndMetering(FocusMeteringActionApi action);
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
  ExposureStateApi getExposureState();
  double getIntrinsticZoomRatio();
  CameraSelectorLensFacingApi getLensFacing();
  List<CameraInfoApi> getPhysicalCameraInfos();
  int getSensorRotationDegrees();
  List<IntRangeApi> getSupportedFrameRateRanges();
  bool isLogicalMultiCameraSupported();
  bool isZslSupported();
  bool hasFlashUnit();
  bool isFocusMeteringSupported(FocusMeteringActionApi action);
  List<DynamicRangeApi> querySupportedDynamicRanges(
    List<DynamicRangeApi> candidateDynamicRanges,
  );
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.CameraSelector',
  ),
)
abstract class CameraSelectorApi {
  @static
  late final CameraSelectorApi front;
  @static
  late final CameraSelectorApi back;
  @static
  late final CameraSelectorApi external;

  CameraSelectorApi(CameraSelectorLensFacingApi? lensFacing);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.DynamicRange',
  ),
)
abstract class DynamicRangeApi {
  DynamicRangeApi();

  late final DynamicRangeEncodingApi encoding;
  late final DynamicRangeBitDepthApi bitDepth;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ExposureState',
  ),
)
abstract class ExposureStateApi {
  late final int exposureCompensationIndex;
  late final IntRangeApi exposureCompensationRange;
  late final double exposureCompensationStep;
  late final bool isExposureCompensationSupported;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.core.MeteringPointTuple',
  ),
)
abstract class MeteringPointTupleApi {
  MeteringPointTupleApi(MeteringPointApi point, {List<MeteringModeApi>? modes});
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.core.DurationTuple',
  ),
)
abstract class DurationTupleApi {
  DurationTupleApi(int duration, TimeUnitApi timeUnit);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.FocusMeteringAction',
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
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.FocusMeteringResult',
  ),
)
abstract class FocusMeteringResultApi {
  late final bool isFocusSuccessful;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ImageAnalysis.Analyzer',
  ),
)
abstract class ImageAnalysisAnalyzerApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ImageAnalysis.Analyzer',
  ),
)
abstract class ImageAnalyzerApi implements ImageAnalysisAnalyzerApi {
  ImageAnalyzerApi();

  late final void Function(ImageProxyApi image) analyze;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ImageCapture.OnImageCapturedCallback',
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

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ImageInfo',
  ),
)
abstract class ImageInfoApi {
  late final int timestamp;
  late final int rotationDegrees;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ImageProxy.PlaneProxy',
  ),
)
abstract class ImageProxyPlaneProxyApi {
  late final Uint8List value;
  late final int pixelStride;
  late final int rowStride;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ImageProxy',
  ),
)
abstract class ImageProxyApi extends AutoCloseableApi {
  late final ImageFormatApi format;
  late final int width;
  late final int height;
  late final List<ImageProxyPlaneProxyApi> planes;
  late final ImageInfoApi imageInfo;

  RectApi getCropRect();
  void setCropRect(RectApi? rect);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.MeteringPoint',
  ),
)
abstract class MeteringPointApi {
  late final double size;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.MeteringPointFactory',
  ),
)
abstract class MeteringPointFactoryApi {
  MeteringPointApi createPoint(double x, double y, {double? size});
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.SurfaceOrientedMeteringPointFactory',
  ),
)
abstract class SurfaceOrientedMeteringPointFactoryApi
    extends MeteringPointFactoryApi {
  SurfaceOrientedMeteringPointFactoryApi(double width, double height);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ZoomState',
  ),
)
abstract class ZoomStateApi {
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

enum BarcodeValueTypeApi {
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

enum AddressTypeApi { unknown, work, home }

enum EmailTypeApi { unknown, work, home }

enum PhoneTypeApi { unknown, work, home, fax, mobile }

enum WiFiEncryptionTypeApi { open, wpa, wep }

enum FaceClassificationModeApi { none, all }

enum FaceContourModeApi { none, all }

enum FaceLandmarkModeApi { none, all }

enum FacePerformanceModeApi { fast, accurate }

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
abstract class MlKitAnalyzerResultApi {
  late final int timestamp;

  List<BarcodeApi>? getBarcodes(BarcodeScannerApi detector);
  List<FaceApi>? getFaces(FaceDetectorApi detector);
  List<Object?>? getThrowable(DetectorApi detector);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.mlkit.vision.MlKitAnalyzer',
  ),
)
abstract class MlKitAnalyzerApi implements ImageAnalysisAnalyzerApi {
  MlKitAnalyzerApi({
    required List<DetectorApi> detectors,
    required ImageAnalysisCoordinateSystemApi targetCoordinateSystem,
    required MlKitAnalyzerResultConsumerApi consumer,
  });
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.ml.Detector',
  ),
)
abstract class DetectorApi extends CloseableApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.Address',
  ),
)
abstract class AddressApi {
  late final AddressTypeApi type;
  late final List<String> addressLines;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'com.google.mlkit.vision.barcode.common.Barcode.CalendarDateTime',
  ),
)
abstract class CalendarDateTimeApi {
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
abstract class CalendarEventApi {
  late final CalendarDateTimeApi? start;
  late final CalendarDateTimeApi? end;
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
abstract class ContactInfoApi {
  late final List<AddressApi> addresses;
  late final List<EmailApi> emails;
  late final PersonNameApi? name;
  late final String? organization;
  late final List<PhoneApi> phones;
  late final String? title;
  late final List<String> urls;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'com.google.mlkit.vision.barcode.common.Barcode.DriverLicense',
  ),
)
abstract class DriverLicenseApi {
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
abstract class EmailApi {
  late final EmailTypeApi type;
  late final String? address;
  late final String? subject;
  late final String? body;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.GeoPoint',
  ),
)
abstract class GeoPointApi {
  late final double lat;
  late final double lng;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.PersonName',
  ),
)
abstract class PersonNameApi {
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
abstract class PhoneApi {
  late final PhoneTypeApi type;
  late final String? number;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.Sms',
  ),
)
abstract class SmsApi {
  late final String? phoneNumber;
  late final String? message;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.UrlBookmark',
  ),
)
abstract class UrlBookmarkApi {
  late final String? title;
  late final String? url;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.WiFi',
  ),
)
abstract class WiFiApi {
  late final WiFiEncryptionTypeApi encryptionType;
  late final String? ssid;
  late final String? password;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode',
  ),
)
abstract class BarcodeApi {
  late final RectApi? boundingBox;
  late final List<PointApi>? cornerPoints;
  late final BarcodeFormatApi format;
  late final BarcodeValueTypeApi valueType;
  late final Uint8List? rawBytes;
  late final String? rawValue;
  late final String? displayValue;
  late final CalendarEventApi? calendarEvent;
  late final ContactInfoApi? contactInfo;
  late final DriverLicenseApi? driverLicense;
  late final EmailApi? email;
  late final GeoPointApi? geoPoint;
  late final PhoneApi? phone;
  late final SmsApi? sms;
  late final UrlBookmarkApi? url;
  late final WiFiApi? wifi;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'com.google.mlkit.vision.barcode.ZoomSuggestionOptions.ZoomCallback',
  ),
)
abstract class ZoomSuggestionOptionsZoomCallbackApi {
  ZoomSuggestionOptionsZoomCallbackApi();

  late final bool Function(double zoomRatio) setZoom;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.ZoomSuggestionOptions',
  ),
)
abstract class ZoomSuggestionOptionsApi {
  ZoomSuggestionOptionsApi.build({
    required ZoomSuggestionOptionsZoomCallbackApi zoomCallback,
    double? maxSupportedZoomRatio,
  });
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.BarcodeScannerOptions',
  ),
)
abstract class BarcodeScannerOptionsApi {
  BarcodeScannerOptionsApi.build({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormatApi>? formats,
    ZoomSuggestionOptionsApi? zoomSuggestionOptions,
  });
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.ml.barcode.BarcodeScanner',
  ),
)
abstract class BarcodeScannerApi extends DetectorApi {
  BarcodeScannerApi({BarcodeScannerOptionsApi? options});
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.face.FaceContour',
  ),
)
abstract class FaceContourApi {
  late final FaceContourTypeApi type;
  late final List<PointFApi> points;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.face.FaceLandmark',
  ),
)
abstract class FaceLandmarkApi {
  late final FaceLandmarkTypeApi type;
  late final PointFApi position;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.face.Face',
  ),
)
abstract class FaceApi {
  late final RectApi boundingBox;
  late final List<FaceContourApi> allContours;
  late final List<FaceLandmarkApi> allLandmarks;
  late final double headEulerAngleX;
  late final double headEulerAngleY;
  late final double headEulerAngleZ;
  late final double? leftEyeOpenProbability;
  late final double? rightEyeOpenProbability;
  late final double? smilingProbability;
  late final int? trackingId;

  FaceContourApi? getContour(FaceContourTypeApi contourType);
  FaceLandmarkApi? getLandmark(FaceLandmarkTypeApi landmarkType);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.face.FaceDetectorOptions',
  ),
)
abstract class FaceDetectorOptionsApi {
  FaceDetectorOptionsApi.build({
    bool? enableTracking,
    FaceClassificationModeApi? classificationMode,
    FaceContourModeApi? contourMode,
    FaceLandmarkModeApi? landmarkMode,
    double? minFaceSize,
    FacePerformanceModeApi? performanceMode,
  });
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.ml.face.FaceDetector',
  ),
)
abstract class FaceDetectorApi extends DetectorApi {
  FaceDetectorApi({FaceDetectorOptionsApi? options});
}

// @ProxyApi(
//   kotlinOptions: KotlinProxyApiOptions(
//     fullClassName: 'dev.zeekr.camerax_android.ml.ImageLabeler',
//   ),
// )
// abstract class ImageLabelerApi extends DetectorApi {}

// @ProxyApi(
//   kotlinOptions: KotlinProxyApiOptions(
//     fullClassName: 'dev.zeekr.camerax_android.ml.ObjectDetector',
//   ),
// )
// abstract class ObjectDetectorApi extends DetectorApi {}

// @ProxyApi(
//   kotlinOptions: KotlinProxyApiOptions(
//     fullClassName: 'dev.zeekr.camerax_android.ml.PoseDetector',
//   ),
// )
// abstract class PoseDetectorApi extends DetectorApi {}

// @ProxyApi(
//   kotlinOptions: KotlinProxyApiOptions(
//     fullClassName: 'dev.zeekr.camerax_android.ml.Segmenter',
//   ),
// )
// abstract class SegmenterApi extends DetectorApi {}

// @ProxyApi(
//   kotlinOptions: KotlinProxyApiOptions(
//     fullClassName: 'dev.zeekr.camerax_android.ml.TextRecognizer',
//   ),
// )
// abstract class TextRecognizerApi extends DetectorApi {}

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
abstract class AudioStatsApi {
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
abstract class FallbackStrategyApi {
  FallbackStrategyApi.higherQualityOrLowerThan(QualityApi quality);
  FallbackStrategyApi.higherQualityThan(QualityApi quality);
  FallbackStrategyApi.lowerQualityOrHigherThan(QualityApi quality);
  FallbackStrategyApi.lowerQualityThan(QualityApi quality);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.OutputOptions',
  ),
)
abstract class OutputOptionsApi {
  int getDurationLimitMillis();
  int getFileSizeLimit();
  LocationApi? getLocation();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.FileOutputOptions',
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
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.OutputResults',
  ),
)
abstract class OutputResultsApi {
  late final String? outputUri;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.QualitySelector',
  ),
)
abstract class QualitySelectorApi {
  QualitySelectorApi.from(
    QualityApi quality, {
    FallbackStrategyApi? fallbackStrategy,
  });

  QualitySelectorApi.fromOrderedList(
    List<QualityApi> qualities, {
    FallbackStrategyApi? fallbackStrategy,
  });

  @static
  SizeApi? getResolution(CameraInfoApi cameraInfo, QualityApi quality);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.Quality',
  ),
)
abstract class QualityApi {
  @static
  late final QualityApi fhd;
  @static
  late final QualityApi hd;
  @static
  late final QualityApi highest;
  @static
  late final QualityApi lowest;
  @static
  late final QualityApi sd;
  @static
  late final QualityApi uhd;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.RecordingStats',
  ),
)
abstract class RecordingStatsApi {
  late final AudioStatsApi audioStats;
  late final int numBytesRecorded;
  late final int recordedDurationNanos;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.Recording',
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
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent',
  ),
)
abstract class VideoRecordEventApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent.Status',
  ),
)
abstract class VideoRecordStatusEventApi extends VideoRecordEventApi {
  late final RecordingStatsApi recordingStats;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent.Start',
  ),
)
abstract class VideoRecordStartEventApi extends VideoRecordEventApi {
  late final RecordingStatsApi recordingStats;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent.Pause',
  ),
)
abstract class VideoRecordPauseEventApi extends VideoRecordEventApi {
  late final RecordingStatsApi recordingStats;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent.Resume',
  ),
)
abstract class VideoRecordResumeEventApi extends VideoRecordEventApi {
  late final RecordingStatsApi recordingStats;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent.Finalize',
  ),
)
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

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.view.video.AudioConfig',
  ),
)
abstract class AudioConfigApi {
  @static
  late final AudioConfigApi audioDisabled;

  AudioConfigApi.create(bool enableAudio);

  bool getAudioEnabled();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.view.CameraController',
  ),
)
abstract class CameraControllerApi {
  @async
  void initialize();
  @async
  bool hasCamera(CameraSelectorApi cameraSelector);
  @async
  CameraSelectorApi getCameraSelector();
  @async
  void setCameraSelector(CameraSelectorApi cameraSelector);
  @async
  CameraInfoApi? getCameraInfo();
  @async
  CameraControlApi? getCameraControl();
  @async
  TorchStateApi? getTorchState();
  @async
  void observeTorchState(TorchStateObserverApi observer);
  @async
  void removeTorchStateObserver(TorchStateObserverApi observer);
  @async
  void enableTorch(bool torchEnabled);
  @async
  ZoomStateApi? getZoomState();
  @async
  void observeZoomState(ZoomStateObserverApi observer);
  @async
  void removeZoomStateObserver(ZoomStateObserverApi observer);
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
  ResolutionSelectorApi? getPreviewResolutionSelector();
  @async
  void setPreviewResolutionSelector(ResolutionSelectorApi? resolutionSelector);
  @async
  ResolutionSelectorApi? getImageCaptureResolutionSelector();
  @async
  void setImageCaptureResolutionSelector(
    ResolutionSelectorApi? resolutionSelector,
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
  void takePicture(ImageCaptureOnImageCapturedCallbackApi capturedCallback);
  @async
  ResolutionSelectorApi? getImageAnalysisResolutionSelector();
  @async
  void setImageAnalysisResolutionSelector(
    ResolutionSelectorApi? resolutionSelector,
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
  void setImageAnalysisAnalyzer(ImageAnalysisAnalyzerApi analyzer);
  @async
  void clearImageAnalysisAnalyzer();
  @async
  DynamicRangeApi getVideoCaptureDynamicRange();
  @async
  void setVideoCaptureDynamicRange(DynamicRangeApi dynamicRange);
  @async
  MirrorModeApi getVideoCaptureMirrorMode();
  @async
  void setVideoCaptureMirrorMode(MirrorModeApi mirrorMode);
  @async
  QualitySelectorApi getVideoCaptureQualitySelector();
  @async
  void setVideoCaptureQualitySelector(QualitySelectorApi qualitySelector);
  @async
  IntRangeApi getVideoCaptureTargetFrameRate();
  @async
  void setVideoCaptureTargetFrameRate(IntRangeApi targetFrameRate);
  @async
  bool isRecording();
  @async
  RecordingApi startRecording(
    FileOutputOptionsApi outputOptions,
    AudioConfigApi audioConfig,
    VideoRecordEventConsumerApi listener,
  );
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.view.LifecycleCameraController',
  ),
)
abstract class LifecycleCameraControllerApi extends CameraControllerApi {
  LifecycleCameraControllerApi();

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
abstract class PreviewViewApi {
  PreviewViewApi();

  @async
  CameraControllerApi? getController();
  @async
  void setController(CameraControllerApi? controller);
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
abstract class RotationProviderListenerApi {
  RotationProviderListenerApi();

  late final void Function(int rotation) onRotationChanged;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.view.RotationProvider',
  ),
)
abstract class RotationProviderApi {
  RotationProviderApi();

  bool addListener(RotationProviderListenerApi listener);
  void removeListener(RotationProviderListenerApi listener);
}
