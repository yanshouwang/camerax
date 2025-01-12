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

enum TorchState {
  on,
  off,
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

enum AspectRatio {
  ratioDefault,
  ratio4_3,
  ratio16_9,
}

enum BitDepth {
  bitDepthUnspecified,
  bitDepth8Bit,
  bitDepth10Bit,
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

enum CoordinateSystem {
  original,
  sensor,
  viewReferenced,
}

enum ImageFormat {
  yuv420_888,
  rgba8888,
  jpeg,
  jpegR,
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
  invalidOuputOptions,
  encodingFailed,
  recorderError,
  noValidData,
  durationLimitReached,
  recordingGarbageCollected,
}

enum BarcodeFormat {
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

enum BarcodeValueType {
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

enum AddressType {
  unknown,
  work,
  home,
}

enum EmailType {
  unknown,
  work,
  home,
}

enum PhoneType {
  unknown,
  work,
  home,
  fax,
  mobile,
}

enum WiFiEncryptionType {
  open,
  wpa,
  wep,
}

enum FaceClassificationMode {
  none,
  all,
}

enum FaceContourMode {
  none,
  all,
}

enum FaceLandmarkMode {
  none,
  all,
}

enum FacePerformanceMode {
  fast,
  accurate,
}

enum FaceContourType {
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

enum FaceLandmarkType {
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
    fullClassName: 'java.lang.AutoCloseable',
  ),
)
abstract class AutoCloseable {
  void close();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'java.io.Closeable',
  ),
)
abstract class Closeable extends AutoCloseable {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'android.net.Uri',
  ),
)
abstract class Uri {
  Uri.parse(String uriString);

  String? getPath();
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
    fullClassName: 'android.graphics.Point',
  ),
)
abstract class Point {
  Point();

  late final int x;
  late final int y;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'android.graphics.PointF',
  ),
)
abstract class PointF {
  PointF();

  late final double x;
  late final double y;
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
    fullClassName: 'dev.hebei.camerax_android.legacy.IntRange.Stub',
  ),
)
abstract class IntRange {
  IntRange(int lower, int upper);

  int getLower();
  int getUpper();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.CameraSelector',
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
    fullClassName: 'dev.hebei.camerax_android.legacy.CameraStateLiveData.Stub',
  ),
)
abstract class CameraStateLiveData {
  CameraState? getValue();

  void observe(CameraStateObserver observer);
  void removeObserver(CameraStateObserver observer);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.legacy.CameraStateObserver.Impl',
  ),
)
abstract class CameraStateObserver {
  CameraStateObserver();

  late final void Function(CameraState value) onChanged;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.legacy.TorchStateLiveData.Stub',
  ),
)
abstract class TorchStateLiveData {
  TorchState? getValue();

  void observe(TorchStateObserver observer);
  void removeObserver(TorchStateObserver observer);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.legacy.TorchStateObserver.Impl',
  ),
)
abstract class TorchStateObserver {
  TorchStateObserver();

  late final void Function(TorchState value) onChanged;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ZoomState',
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
    fullClassName: 'dev.hebei.camerax_android.legacy.ZoomStateLiveData.Stub',
  ),
)
abstract class ZoomStateLiveData {
  ZoomState? getValue();

  void observe(ZoomStateObserver observer);
  void removeObserver(ZoomStateObserver observer);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.legacy.ZoomStateObserver.Impl',
  ),
)
abstract class ZoomStateObserver {
  ZoomStateObserver();

  late final void Function(ZoomState value) onChanged;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ExposureState',
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
    fullClassName: 'androidx.camera.core.MeteringPoint',
  ),
)
abstract class MeteringPoint {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.hebei.camerax_android.legacy.core.MeteringPointArgs.Stub',
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
    fullClassName: 'dev.hebei.camerax_android.legacy.core.DurationArgs.Stub',
  ),
)
abstract class DurationArgs {
  DurationArgs(int duration, TimeUnit timeUnit);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.FocusMeteringAction',
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
    fullClassName: 'androidx.camera.core.FocusMeteringResult',
  ),
)
abstract class FocusMeteringResult {
  bool isFocusSuccessful();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.DynamicRange',
  ),
)
abstract class DynamicRange {
  DynamicRange(Encoding encoding, BitDepth bitDepth);

  Encoding getEncoding();
  BitDepth getBitDepth();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.CameraInfo',
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
    fullClassName: 'androidx.camera.core.CameraControl',
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
  FocusMeteringResult startFocusAndMetering(FocusMeteringAction action);
  @async
  void cancelFocusAndMetering();
  @async
  int setExposureCompensationIndex(int value);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'androidx.camera.core.resolutionselector.AspectRatioStrategy',
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
    fullClassName: 'androidx.camera.core.resolutionselector.ResolutionFilter',
  ),
)
abstract class ResolutionFilter {
  ResolutionFilter();

  late final List<Size> Function(List<Size> supportedSizes, int rotationDegrees)
      filter;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.resolutionselector.ResolutionStrategy',
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
    fullClassName: 'androidx.camera.core.resolutionselector.ResolutionSelector',
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
    fullClassName: 'androidx.camera.core.ImageInfo',
  ),
)
abstract class ImageInfo {
  int getTimestamp();
  int getRotationDegrees();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
      fullClassName: 'androidx.camera.core.ImageProxy.PlaneProxy'),
)
abstract class PlaneProxy {
  Uint8List getBuffer();
  int getPixelStride();
  int getRowStride();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ImageProxy',
  ),
)
abstract class ImageProxy extends AutoCloseable {
  ImageFormat getFormat();
  int getWidth();
  int getHieght();
  List<PlaneProxy> getPlanes();
  ImageInfo getImageInfo();
  Rect getCropRect();
  void setCropRect(Rect? rect);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.ImageAnalysis.Analyzer',
  ),
)
abstract class Analyzer {
  Analyzer();

  late final void Function(ImageProxy image) analyze;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.legacy.ml.Detector.Stub',
  ),
)
abstract class Detector extends Closeable {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.Address',
  ),
)
abstract class Address {
  AddressType getType();
  List<String> getAddressLines();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'com.google.mlkit.vision.barcode.common.Barcode.CalendarDateTime',
  ),
)
abstract class CalendarDateTime {
  String? getRawValue();
  int getYear();
  int getMonth();
  int getDay();
  int getHours();
  int getMinutes();
  int getSeconds();
  bool isUtc();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'com.google.mlkit.vision.barcode.common.Barcode.CalendarEvent',
  ),
)
abstract class CalendarEvent {
  CalendarDateTime? getStart();
  CalendarDateTime? getEnd();
  String? getLocation();
  String? getOrganizer();
  String? getSummary();
  String? getDescription();
  String? getStatus();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.ContactInfo',
  ),
)
abstract class ContactInfo {
  List<Address> getAddresses();
  List<Email> getEmails();
  PersonName? getName();
  String? getOrganization();
  List<Phone> getPhones();
  String? getTitle();
  List<String> getUrls();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'com.google.mlkit.vision.barcode.common.Barcode.DriverLicense',
  ),
)
abstract class DriverLicense {
  String? getLicenseNumber();
  String? getDocumentType();
  String? getExpiryDate();
  String? getFirstName();
  String? getMiddleName();
  String? getLastName();
  String? getGender();
  String? getBirthDate();
  String? getIssueDate();
  String? getIssuingCountry();
  String? getAddressState();
  String? getAddressCity();
  String? getAddressStreet();
  String? getAddressZip();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.Email',
  ),
)
abstract class Email {
  EmailType getType();
  String? getAddress();
  String? getSubgect();
  String? getBody();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.GeoPoint',
  ),
)
abstract class GeoPoint {
  double getLat();
  double getLng();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.PersonName',
  ),
)
abstract class PersonName {
  String? getFormattedName();
  String? getPronunciation();
  String? getPrefix();
  String? getFirst();
  String? getMiddle();
  String? getLast();
  String? getSuffix();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.Phone',
  ),
)
abstract class Phone {
  PhoneType getType();
  String? getNumber();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.Sms',
  ),
)
abstract class Sms {
  String? getPhoneNumber();
  String? getMessage();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.UrlBookmark',
  ),
)
abstract class UrlBookmark {
  String? getTitle();
  String? getUrl();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode.WiFi',
  ),
)
abstract class WiFi {
  WiFiEncryptionType getEncryptionType();
  String? getSsid();
  String? getPassword();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.common.Barcode',
  ),
)
abstract class Barcode {
  Rect? getBoundingBox();
  List<Point>? getCornerPoints();
  BarcodeFormat getFormat();
  BarcodeValueType getValueType();
  Uint8List? getRawBytes();
  String? getRawValue();
  String? getDisplayValue();
  CalendarEvent? getCalendarEvent();
  ContactInfo? getContactInfo();
  DriverLicense? getDriverLicense();
  Email? getEmail();
  GeoPoint? getGeoPoint();
  Phone? getPhone();
  Sms? getSms();
  UrlBookmark? getUrl();
  WiFi? getWifi();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'com.google.mlkit.vision.barcode.ZoomSuggestionOptions.ZoomCallback',
  ),
)
abstract class ZoomCallback {
  ZoomCallback();

  late final bool Function(double zoomRatio) setZoom;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.ZoomSuggestionOptions',
  ),
)
abstract class ZoomSuggestionOptions {
  ZoomSuggestionOptions.build({
    required ZoomCallback zoomCallback,
    double? maxSupportedZoomRatio,
  });
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.BarcodeScannerOptions',
  ),
)
abstract class BarcodeScannerOptions {
  BarcodeScannerOptions.build({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptions? zoomSuggestionOptions,
  });
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.android.odml.image.MlImage',
  ),
)
abstract class MlImage {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.common.InputImage',
  ),
)
abstract class InputImage {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.legacy.ml.BarcodeScanner.Stub',
  ),
)
abstract class BarcodeScanner extends Detector {
  @async
  List<Barcode> process0(MlImage image);
  @async
  List<Barcode> process1(InputImage image);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.BarcodeScanning',
  ),
)
abstract class BarcodeScanning {
  @static
  BarcodeScanner getClient({
    BarcodeScannerOptions? options,
  });
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.face.FaceDetectorOptions',
  ),
)
abstract class FaceDetectorOptions {
  FaceDetectorOptions.build({
    bool? enableTracking,
    FaceClassificationMode? classificationMode,
    FaceContourMode? contourMode,
    FaceLandmarkMode? landmarkMode,
    double? minFaceSize,
    FacePerformanceMode? performanceMode,
  });
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.face.FaceContour',
  ),
)
abstract class FaceContour {
  FaceContourType getType();
  List<PointF> getPoints();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.face.FaceLandmark',
  ),
)
abstract class FaceLandmark {
  FaceLandmarkType getType();
  PointF getPosition();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.face.Face',
  ),
)
abstract class Face {
  Rect getBoundingBox();
  List<FaceContour> getAllContours();
  List<FaceLandmark> getAllLandmarks();
  FaceContour? getContour(FaceContourType contourType);
  FaceLandmark? getLandmark(FaceLandmarkType landmarkType);
  double getHeadEulerAngleX();
  double getHeadEulerAngleY();
  double getHeadEulerAngleZ();
  double? getLeftEyeOpenProbability();
  double? getRightEyeOpenProbability();
  double? getSmilingProbability();
  int? getTrackingId();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.legacy.ml.FaceDetector.Stub',
  ),
)
abstract class FaceDetector extends Detector {
  @async
  List<Face> process0(MlImage image);
  @async
  List<Face> process1(InputImage image);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.face.FaceDetection',
  ),
)
abstract class FaceDetection {
  @static
  FaceDetector getClient({
    FaceDetectorOptions? options,
  });
}

// @ProxyApi(
//   kotlinOptions: KotlinProxyApiOptions(
//     fullClassName: 'dev.hebei.camerax_android.legacy.ml.ImageLabeler.Stub',
//   ),
// )
// abstract class ImageLabeler extends Detector {}

// @ProxyApi(
//   kotlinOptions: KotlinProxyApiOptions(
//     fullClassName: 'dev.hebei.camerax_android.legacy.ml.ObjectDetector.Stub',
//   ),
// )
// abstract class ObjectDetector extends Detector {}

// @ProxyApi(
//   kotlinOptions: KotlinProxyApiOptions(
//     fullClassName: 'dev.hebei.camerax_android.legacy.ml.PoseDetector.Stub',
//   ),
// )
// abstract class PoseDetector extends Detector {}

// @ProxyApi(
//   kotlinOptions: KotlinProxyApiOptions(
//     fullClassName: 'dev.hebei.camerax_android.legacy.ml.Segmenter.Stub',
//   ),
// )
// abstract class Segmenter extends Detector {}

// @ProxyApi(
//   kotlinOptions: KotlinProxyApiOptions(
//     fullClassName: 'dev.hebei.camerax_android.legacy.ml.TextRecognizer.Stub',
//   ),
// )
// abstract class TextRecognizer extends Detector {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.mlkit.vision.MlKitAnalyzer.Result',
  ),
)
abstract class MlkitAnalyzerResult {
  int getTimestamp();
  List<Object?>? getThrowable(Detector detector);
  List<Barcode>? getBarcodes(BarcodeScanner detector);
  List<Face>? getFaces(FaceDetector detector);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.hebei.camerax_android.legacy.MlKitAnalyzerResultConsumer.Impl',
  ),
)
abstract class MlKitAnalyzerResultConsumer {
  MlKitAnalyzerResultConsumer();

  late final void Function(MlkitAnalyzerResult value) accept;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.mlkit.vision.MlKitAnalyzer',
  ),
)
abstract class MlKitAnalyzer {
  MlKitAnalyzer({
    required List<Detector> detectors,
    required CoordinateSystem targetCoordinateSystem,
    required MlKitAnalyzerResultConsumer consumer,
  });
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.Quality',
  ),
)
abstract class Quality {
  @static
  late final Quality fhd;
  @static
  late final Quality hd;
  @static
  late final Quality highest;
  @static
  late final Quality lowest;
  @static
  late final Quality sd;
  @static
  late final Quality uhd;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.FallbackStrategy',
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
    fullClassName: 'androidx.camera.video.QualitySelector',
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

  @static
  Size? getResolution(CameraInfo cameraInfo, Quality quality);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.view.video.AudioConfig',
  ),
)
abstract class AudioConfig {
  @static
  late final AudioConfig audioDisabled;

  AudioConfig.create(bool enableAudio);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.AudioStats',
  ),
)
abstract class AudioStats {
  double getAudioAmplitude();
  AudioState getAudioState();
  List<Object?>? getErrorCause();
  bool hasAudio();
  bool hasError();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.RecordingStats',
  ),
)
abstract class RecordingStats {
  AudioStats getAudioStats();
  int getNumBytesRecorded();
  int getRecordedDurationNanos();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent',
  ),
)
abstract class VideoRecordEvent {
  RecordingStats getRecordingStats();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent.Status',
  ),
)
abstract class VideoRecordStatusEvent extends VideoRecordEvent {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent.Start',
  ),
)
abstract class VideoRecordStartEvent extends VideoRecordEvent {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent.Pause',
  ),
)
abstract class VideoRecordPauseEvent extends VideoRecordEvent {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent.Resume',
  ),
)
abstract class VideoRecordResumeEvent extends VideoRecordEvent {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent.Finalize',
  ),
)
abstract class VideoRecordFinalizeEvent extends VideoRecordEvent {
  List<Object?>? getCause();
  VideoRecordFinalizeEventError getError();
  VideoOutputResults getOutputResults();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.OutputResults',
  ),
)
abstract class VideoOutputResults {
  Uri getOutputUri();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.hebei.camerax_android.legacy.VideoRecordEventConsumer.Impl',
  ),
)
abstract class VideoRecordEventConsumer {
  VideoRecordEventConsumer();

  late final void Function(VideoRecordEvent value) accept;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.Recording',
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
    fullClassName: 'androidx.camera.view.CameraController',
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
  // @async
  // Uint8List takePicture();
  @async
  ResolutionSelector? getImageAnalysisResolutionSelector();
  @async
  void setImageAnalysisResolutionSelector(
      ResolutionSelector? resolutionSelector);
  @async
  BackpressureStrategy getImageAnalysisBackpressureStrategy();
  @async
  void setImageAnalysisBackpressureStrategy(BackpressureStrategy strategy);
  @async
  int getImageAnalysisImageQueueDepth();
  @async
  void setImageAnalysisImageQueueDepth(int depth);
  @async
  ImageFormat getImageAnalysisOutputImageFormat();
  @async
  void setImageAnalysisOutputImageFormat(
      ImageFormat imageAnalysisOutputImageFormat);
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
  // @async
  // Recording startRecording({
  //   required String uri,
  //   required AudioConfig audioConfig,
  //   required VideoRecordEventConsumer listener,
  // });
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.view.LifecycleCameraController',
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
    fullClassName: 'androidx.camera.view.PreviewView',
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
