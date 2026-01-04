// Run with `dart run pigeon --input api.dart`.
import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/api.g.dart',
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
enum CameraMetadataInfoSupportedHardwareLevelApi {
  limited, // 0
  full, // 1
  legacy, // 2
  level3, // 3
  external, // 4
}

enum CameraMetadataControlModeApi {
  off, // 0
  auto, // 1
  useSceneMode, // 2
  offKeepState, // 3
  useExtendedSceneMode, // 4
}

enum CameraMetadataControlAeModeApi {
  off, // 0
  on, // 1
  onAutoFlash, // 2
  onAlwaysFlash, // 3
  onAutoFlashRedeye, // 4
  onExternalFlash, // 5
  onLowLightBoostBrightnessPriority, // 6
}

enum CameraMetadataControlAfModeApi {
  off, // 0
  auto, // 1
  macro, // 2
  continuousVideo, // 3
  continuousPicture, // 4
  edof, // 5
}

enum CameraMetadataControlAwbModeApi {
  off, // 0
  auto, // 1
  incandesecent, // 2
  fluorescent, // 3
  warmFluorescent, // 4
  daylight, // 5
  cloudyDaylight, // 6
  twilight, // 7
  shade, // 8
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
  String? getStringCameraCharacteristic(
    CameraCharacteristicsStringKeyProxyApi key,
  );
  int? getIntCameraCharacteristic(CameraCharacteristicsIntKeyProxyApi key);
  bool? getBooleanCameraCharacteristic(
    CameraCharacteristicsBooleanKeyProxyApi key,
  );
  List<int>? getIntArrayCameraCharacteristic(
    CameraCharacteristicsIntArrayKeyProxyApi key,
  );
  List<double>? getFloatArrayCameraCharacteristic(
    CameraCharacteristicsFloatArrayKeyProxyApi key,
  );
  IntRangeProxyApi? getIntRangeCameraCharacteristic(
    CameraCharacteristicsIntRangeKeyProxyApi key,
  );
  LongRangeProxyApi? getLongRangeCameraCharacteristic(
    CameraCharacteristicsLongRangeKeyProxyApi key,
  );
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'androidx.camera.camera2.interop.CaptureRequestOptions.Builder',
  ),
)
abstract class CaptureRequestOptionsBuilderProxyApi {
  CaptureRequestOptionsBuilderProxyApi();

  CaptureRequestOptionsBuilderProxyApi setIntCaptureRequestOption(
    CaptureRequestIntKeyProxyApi key,
    int value,
  );
  CaptureRequestOptionsBuilderProxyApi setLongCaptureRequestOption(
    CaptureRequestLongKeyProxyApi key,
    int value,
  );
  CaptureRequestOptionsBuilderProxyApi setFloatCaptureRequestOption(
    CaptureRequestFloatKeyProxyApi key,
    double value,
  );
  CaptureRequestOptionsBuilderProxyApi setBooleanCaptureRequestOption(
    CaptureRequestBooleanKeyProxyApi key,
    bool value,
  );
  CaptureRequestOptionsProxyApi build();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.camera2.interop.CaptureRequestOptions',
  ),
)
abstract class CaptureRequestOptionsProxyApi {
  int? getIntCaptureRequestOption(CaptureRequestIntKeyProxyApi key);
  int? getLongCaptureRequestOption(CaptureRequestLongKeyProxyApi key);
  double? getFloatCaptureRequestOption(CaptureRequestFloatKeyProxyApi key);
  bool? getBooleanCaptureRequestOption(CaptureRequestBooleanKeyProxyApi key);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.zeekr.camerax_android.camera2.CameraCharacteristicsImpl.Key',
  ),
)
abstract class CameraCharacteristicsKeyProxyApi {
  String getName();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.zeekr.camerax_android.camera2.CameraCharacteristicsImpl.StringKey',
  ),
)
abstract class CameraCharacteristicsStringKeyProxyApi
    extends CameraCharacteristicsKeyProxyApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.zeekr.camerax_android.camera2.CameraCharacteristicsImpl.IntKey',
  ),
)
abstract class CameraCharacteristicsIntKeyProxyApi
    extends CameraCharacteristicsKeyProxyApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.zeekr.camerax_android.camera2.CameraCharacteristicsImpl.BooleanKey',
  ),
)
abstract class CameraCharacteristicsBooleanKeyProxyApi
    extends CameraCharacteristicsKeyProxyApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.zeekr.camerax_android.camera2.CameraCharacteristicsImpl.IntArrayKey',
  ),
)
abstract class CameraCharacteristicsIntArrayKeyProxyApi
    extends CameraCharacteristicsKeyProxyApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.zeekr.camerax_android.camera2.CameraCharacteristicsImpl.FloatArrayKey',
  ),
)
abstract class CameraCharacteristicsFloatArrayKeyProxyApi
    extends CameraCharacteristicsKeyProxyApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.zeekr.camerax_android.camera2.CameraCharacteristicsImpl.IntRangeKey',
  ),
)
abstract class CameraCharacteristicsIntRangeKeyProxyApi
    extends CameraCharacteristicsKeyProxyApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.zeekr.camerax_android.camera2.CameraCharacteristicsImpl.LongRangeKey',
  ),
)
abstract class CameraCharacteristicsLongRangeKeyProxyApi
    extends CameraCharacteristicsKeyProxyApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'android.hardware.camera2.CameraCharacteristics',
  ),
)
abstract class CameraCharacteristicsProxyApi {
  @static
  late final CameraCharacteristicsIntArrayKeyProxyApi controlAeAvailableModes;
  @static
  late final CameraCharacteristicsBooleanKeyProxyApi controlAeLockAvailable;
  @static
  late final CameraCharacteristicsIntArrayKeyProxyApi controlAfAvailableModes;
  @static
  late final CameraCharacteristicsIntArrayKeyProxyApi controlAvailableModes;
  @static
  late final CameraCharacteristicsIntArrayKeyProxyApi controlAwbAvailableModes;
  @static
  late final CameraCharacteristicsBooleanKeyProxyApi controlAwbLockAvailable;
  @static
  late final CameraCharacteristicsIntKeyProxyApi infoSupportedHardwareLevel;
  @static
  late final CameraCharacteristicsStringKeyProxyApi infoVersion;
  @static
  late final CameraCharacteristicsFloatArrayKeyProxyApi
  lensInfoAvailableApertures;
  @static
  late final CameraCharacteristicsLongRangeKeyProxyApi
  sensorInfoExposureTimeRange;
  @static
  late final CameraCharacteristicsIntRangeKeyProxyApi
  sensorInfoSensitivityRange;
  @static
  late final CameraCharacteristicsIntKeyProxyApi sensorOrientation;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.camera2.CameraMetadataUtil',
  ),
)
abstract class CameraMetadataUtilProxyApi {
  @static
  CameraMetadataInfoSupportedHardwareLevelApi fromInfoSupportedHardwareLevel(
    int value,
  );
  @static
  CameraMetadataControlModeApi fromControlMode(int value);
  @static
  CameraMetadataControlAeModeApi fromControlAeMode(int value);
  @static
  CameraMetadataControlAfModeApi fromControlAfMode(int value);
  @static
  CameraMetadataControlAwbModeApi fromControlAwbMode(int value);

  @static
  int toInfoSupportedHardwareLevel(
    CameraMetadataInfoSupportedHardwareLevelApi level,
  );
  @static
  int toControlMode(CameraMetadataControlModeApi mode);
  @static
  int toControlAeMode(CameraMetadataControlAeModeApi mode);
  @static
  int toControlAfMode(CameraMetadataControlAfModeApi mode);
  @static
  int toControlAwbMode(CameraMetadataControlAwbModeApi mode);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.camera2.CaptureRequestImpl.Key',
  ),
)
abstract class CaptureRequestKeyProxyApi {
  String getName();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.zeekr.camerax_android.camera2.CaptureRequestImpl.IntKey',
  ),
)
abstract class CaptureRequestIntKeyProxyApi extends CaptureRequestKeyProxyApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.zeekr.camerax_android.camera2.CaptureRequestImpl.LongKey',
  ),
)
abstract class CaptureRequestLongKeyProxyApi
    extends CaptureRequestKeyProxyApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.zeekr.camerax_android.camera2.CaptureRequestImpl.FloatKey',
  ),
)
abstract class CaptureRequestFloatKeyProxyApi
    extends CaptureRequestKeyProxyApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'dev.zeekr.camerax_android.camera2.CaptureRequestImpl.BooleanKey',
  ),
)
abstract class CaptureRequestBooleanKeyProxyApi
    extends CaptureRequestKeyProxyApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'android.hardware.camera2.CaptureRequest',
  ),
)
abstract class CaptureRequestProxyApi {
  @static
  late final CaptureRequestBooleanKeyProxyApi controlAeLock;
  @static
  late final CaptureRequestIntKeyProxyApi controlAeMode;
  @static
  late final CaptureRequestIntKeyProxyApi controlAfMode;
  @static
  late final CaptureRequestBooleanKeyProxyApi controlAwbLock;
  @static
  late final CaptureRequestIntKeyProxyApi controlAwbMode;
  @static
  late final CaptureRequestIntKeyProxyApi controlMode;
  @static
  late final CaptureRequestFloatKeyProxyApi lensAperture;
  @static
  late final CaptureRequestLongKeyProxyApi sensorExposureTime;
  @static
  late final CaptureRequestIntKeyProxyApi sensorSensitivity;
}

// common
enum BitmapCompressFormatApi { jpeg, png, webp, webpLossless, webpLossy }

enum BitmapConfigApi {
  alpha8,
  argb4444,
  argb8888,
  hardware,
  rgba1010102,
  rgbaF16,
  rgb565,
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

enum PermissionManagerPermissionApi { video, audio }

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
    fullClassName: 'android.graphics.Bitmap',
  ),
)
abstract class BitmapProxyApi {
  BitmapProxyApi.createBitmap1(
    BitmapProxyApi source,
    int x,
    int y,
    int width,
    int height,
  );
  BitmapProxyApi.createBitmap2(
    List<int> colors,
    int width,
    int height,
    BitmapConfigApi config,
  );
  // BitmapProxyApi.createBitmap3(
  //   BitmapProxyApi source,
  //   int x,
  //   int y,
  //   int width,
  //   int height,
  //   MatrixProxyApi m,
  //   bool filter,
  // );
  // BitmapProxyApi.createBitmap4(
  //   DisplayMetricsProxyApi display,
  //   int width,
  //   int height,
  //   BitmapConfigApi config,
  //   bool hasAlpha,
  //   ColorSpaceProxyApi colorSpace,
  // );
  BitmapProxyApi.createBitmap5(BitmapProxyApi src);
  // BitmapProxyApi.createBitmap6(PictureProxyApi source);
  // BitmapProxyApi.createBitmap7(
  //   DisplayMetricsProxyApi display,
  //   List<int> colors,
  //   int offset,
  //   int stride,
  //   int width,
  //   int height,
  //   BitmapConfigApi config,
  // );
  // BitmapProxyApi.createBitmap8(
  //   DisplayMetricsProxyApi display,
  //   List<int> colors,
  //   int width,
  //   int height,
  //   BitmapConfigApi config,
  // );
  // BitmapProxyApi.createBitmap9(
  //   DisplayMetricsProxyApi display,
  //   int width,
  //   int height,
  //   BitmapConfigApi config,
  // );
  BitmapProxyApi.createBitmap10(
    List<int> colors,
    int offset,
    int stride,
    int width,
    int height,
    BitmapConfigApi config,
  );
  // BitmapProxyApi.createBitmap11(
  //   PictureProxyApi source,
  //   int width,
  //   int height,
  //   BitmapConfigApi config,
  // );
  // BitmapProxyApi.createBitmap12(
  //   int width,
  //   int height,
  //   BitmapConfigApi config,
  //   bool hasAlpha,
  //   ColorSpaceProxyApi colorSpace,
  // );
  // BitmapProxyApi.createBitmap13(
  //   DisplayMetricsProxyApi display,
  //   int width,
  //   int height,
  //   BitmapConfigApi config,
  //   bool hasAlpha,
  // );
  BitmapProxyApi.createBitmap14(int width, int height, BitmapConfigApi config);
  BitmapProxyApi.createBitmap15(
    int width,
    int height,
    BitmapConfigApi config,
    bool hasAlpha,
  );
  BitmapProxyApi.createScaledBitmap(
    BitmapProxyApi src,
    int dstWidth,
    int dstHeight,
    bool filter,
  );
  // BitmapProxyApi.writeHardwareBuffer(
  //   HardwareBufferProxyApi hardwareBuffer,
  //   ColorSpaceProxyApi colorSpace,
  // );

  BitmapProxyApi asShared();
  bool compress(
    BitmapCompressFormatApi format,
    int quality,
    OutputStreamProxyApi stream,
  );
  BitmapProxyApi copy(BitmapConfigApi config, bool isMutalbe);
  void copyPixelsFromBuffer(BufferProxyApi src);
  void copyPixelsToBuffer(BufferProxyApi dst);
  void eraseColor(int color);
  BitmapProxyApi extractAlpha1();
  // BitmapProxyApi extractAlpha2(PaintProxyApi paint, List<int> offsetXY);
  int getAllocationByteCount();
  int getByteCount();
  // ColorProxyApi getColor(int x, int y);
  // ColorSpaceProxyApi getColorSpace();
  BitmapConfigApi? getConfig();
  int getDensity();
  // GainmapProxyApi getGainmap();
  int getGenerationId();
  // HardwareBufferProxyApi getHardwareBuffer();
  int getHeight();
  Uint8List? getNinePatchChunk();
  int getPixel(int x, int y);
  // void getPixels(
  //   List<int> pixels,
  //   int offset,
  //   int stride,
  //   int x,
  //   int y,
  //   int width,
  //   int height,
  // );
  int getRowBytes();
  int getScaledHeight1(int targetDensity);
  // int getScaledHeight2(CanvasProxyApi canvas);
  // int getScaledHeight3(DisplayMetricsProxyApi metrics);
  int getScaledWidth1(int targetDensity);
  // int getScaledWidth2(CanvasProxyApi canvas);
  // int getScaledWidth3(DisplayMetricsProxyApi metrics);
  int getWidth();
  bool hasAlpha();
  bool hasGainmap();
  bool hasMipMap();
  bool isMutable();
  bool isPremultiplied();
  bool isRecycled();
  void prepareToDraw();
  void reconfigure(int width, int height, BitmapConfigApi config);
  void recycle();
  bool sameAs(BitmapProxyApi other);
  // void setColorSpace(ColorSpaceProxyApi colorSpace);
  void setConfig(BitmapConfigApi config);
  void setDensity(int density);
  // void setGainmap(Gainmap gainmap);
  void setHasAlpha(bool hasAlpha);
  void sethasMipMap(bool hasMipMap);
  void setHeight(int height);
  void setPixel(int x, int y, int color);
  // void setPixels(
  //   List<int> pixels,
  //   int offset,
  //   int stride,
  //   int x,
  //   int y,
  //   int width,
  //   int height,
  // );
  void setPremultiplied(bool premultiplied);
  void setWidth(int width);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(fullClassName: 'java.nio.Buffer'),
)
abstract class BufferProxyApi {
  // ObjectProxyApi array();
  int arrayOffset();
  int capacity();
  BufferProxyApi clear();
  BufferProxyApi duplicate();
  BufferProxyApi flip();
  bool hasArray();
  bool hasRemaining();
  bool isDirect();
  bool isReadOnly();
  int limit1();
  BufferProxyApi limit2(int newLimit);
  BufferProxyApi mark();
  int position1();
  BufferProxyApi position2(int newPosition);
  int remaining();
  BufferProxyApi reset();
  BufferProxyApi rewind();
  BufferProxyApi slice1();
  BufferProxyApi slice2(int index, int length);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(fullClassName: 'java.nio.ByteBuffer'),
)
abstract class ByteBufferProxyApi extends BufferProxyApi {
  ByteBufferProxyApi.allocate(int capacity);
  ByteBufferProxyApi.allocateDirect(int capacity);
  ByteBufferProxyApi.wrap1(Uint8List array);
  ByteBufferProxyApi.wrap2(Uint8List array, int offset, int length);

  ByteBufferProxyApi alignedSlice(int unitSize);
  int alignmentOffset(int index, int unitSize);
  Uint8List array();
  // CharBufferProxyApi asCharBuffer();
  // DoubleBuffer asDoubleBuffer();
  // FloatBufferProxyAPi asFloatBuffer();
  // IntBuffer asIntBuffer();
  // LongBuffer asLongBuffer();
  ByteBufferProxyApi asReadOnlyBuffer();
  // ShortBufferProxyApi asShortBuffer();
  ByteBufferProxyApi compact();
  int compareTo(ByteBufferProxyApi that);
  @override
  ByteBufferProxyApi duplicate();
  int get1();
  int get2(int index);
  ByteBufferProxyApi get3(Uint8List dst);
  ByteBufferProxyApi get4(int index, Uint8List dst);
  ByteBufferProxyApi get5(Uint8List dst, int offset, int length);
  ByteBufferProxyApi get6(int index, Uint8List dst, int offset, int length);
  // CharProxyApi getChar1();
  // CharProxyApi getChar2(int index);
  double getDouble1();
  double getDouble2(int index);
  double getFloat1();
  double getFloat2(int index);
  int getInt1();
  int getInt2(int index);
  int getLong1();
  int getLong2(int index);
  int getShort1();
  int getShort2(int index);
  int mismatch(ByteBufferProxyApi that);
  // ByteOrderProxyApi order1();
  // ByteBufferProxyApi order2(ByteOrderProxyApi bo);
  ByteBufferProxyApi put1(int b);
  ByteBufferProxyApi put2(int index, int b);
  ByteBufferProxyApi put3(Uint8List src);
  ByteBufferProxyApi put4(int index, Uint8List src);
  ByteBufferProxyApi put5(Uint8List src, int offset, int length);
  ByteBufferProxyApi put6(int index, Uint8List src, int offset, int length);
  ByteBufferProxyApi put7(ByteBufferProxyApi src);
  ByteBufferProxyApi put8(
    int index,
    ByteBufferProxyApi src,
    int offset,
    int length,
  );
  // ByteBufferProxyApi putChar1(CharProxyApi value);
  // ByteBufferProxyApi putChar2(int index, CharProxyApi value);
  ByteBufferProxyApi putDouble1(double value);
  ByteBufferProxyApi putDouble2(int index, double value);
  ByteBufferProxyApi putFloat1(double value);
  ByteBufferProxyApi putFloat2(int index, double value);
  ByteBufferProxyApi putInt1(int value);
  ByteBufferProxyApi putInt2(int index, int value);
  ByteBufferProxyApi putLong1(int value);
  ByteBufferProxyApi putLong2(int index, int value);
  ByteBufferProxyApi putShort1(int value);
  ByteBufferProxyApi putShort2(int index, int value);
  @override
  ByteBufferProxyApi slice1();
  @override
  ByteBufferProxyApi slice2(int index, int length);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(fullClassName: 'java.io.OutputStream'),
)
abstract class OutputStreamProxyApi {
  void close();
  void flush();
  void write1(int b);
  void write2(Uint8List b);
  void write3(Uint8List b, int off, int len);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(fullClassName: 'java.io.OutputStream'),
)
abstract class NullOutputStreamProxyApi extends OutputStreamProxyApi {
  NullOutputStreamProxyApi();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'java.io.ByteArrayOutputStream',
  ),
)
abstract class ByteArrayOutputStreamProxyApi extends OutputStreamProxyApi {
  ByteArrayOutputStreamProxyApi();
  ByteArrayOutputStreamProxyApi.size(int size);

  void reset();
  int size();
  Uint8List toByteArray();
  String toString1();
  String toString2(String charsetName);
  // String toString3(CharsetProxyApi charset);
  String toString4(int hibyte);
  void writeBytes(Uint8List b);
  void writeTo(OutputStreamProxyApi out);
}

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

  bool checkPermissioin(PermissionManagerPermissionApi permission);
  @async
  bool requestPermissions(List<PermissionManagerPermissionApi> permissions);
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
    fullClassName: 'dev.zeekr.camerax_android.common.IntRange',
  ),
)
abstract class IntRangeProxyApi {
  IntRangeProxyApi();

  late final int lower;
  late final int upper;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.camerax_android.common.LongRange',
  ),
)
abstract class LongRangeProxyApi {
  LongRangeProxyApi();

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
  @static
  late final AspectRatioStrategyProxyApi ratio4_3FallbackAutoStrategy;
  @static
  late final AspectRatioStrategyProxyApi ratio16_9FallbackAutoStrategy;

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
  @static
  late final ResolutionStrategyProxyApi highestAvailableStrategy;

  ResolutionStrategyProxyApi(
    SizeProxyApi boundSize,
    ResolutionStrategyFallbackRuleApi fallbackRule,
  );

  SizeProxyApi? getBoundSize();
  ResolutionStrategyFallbackRuleApi getFallbackRule();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'androidx.camera.core.resolutionselector.ResolutionSelector.Builder',
  ),
)
abstract class ResolutionSelectorBuilderProxyApi {
  ResolutionSelectorBuilderProxyApi();

  ResolutionSelectorBuilderProxyApi setAllowedResolutionMode(
    ResolutionSelectorModeApi mode,
  );
  ResolutionSelectorBuilderProxyApi setAspectRatioStrategy(
    AspectRatioStrategyProxyApi aspectRatioStrategy,
  );
  ResolutionSelectorBuilderProxyApi setResolutionFilter(
    ResolutionFilterProxyApi resolutionFilter,
  );
  ResolutionSelectorBuilderProxyApi setResolutionStrategy(
    ResolutionStrategyProxyApi resolutionStrategy,
  );
  ResolutionSelectorProxyApi build();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.resolutionselector.ResolutionSelector',
  ),
)
abstract class ResolutionSelectorProxyApi {
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
  void setTorchStrengthLevel(int torchStrengthLevel);
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
  @async
  void enableLowLightBoostAsync(bool lowLightBoost);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.CameraFilter',
  ),
)
abstract class CameraFilterProxyApi {
  CameraFilterProxyApi();

  late final List<CameraInfoProxyApi> Function(
    List<CameraInfoProxyApi> cameraInfos,
  )
  filter;
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
  LowLightBoostStateApi? getLowLightBoostState();
  void observeLowLightBoostState(LowLightBoostStateObserverProxyApi observer);
  void removeLowLightBoostStateObserver(
    LowLightBoostStateObserverProxyApi observer,
  );
  int getMaxTorchStrengthLevel();
  List<CameraInfoProxyApi> getPhysicalCameraInfos();
  int getSensorRotationDegrees1();
  int getSensorRotationDegrees2(SurfaceRotationApi relativeRotation);
  List<IntRangeProxyApi> getSupportedFrameRateRanges1();
  // List<IntRangeProxyApi> getSupportedFrameRateRanges2(
  //   SessionConfigProxyApi sessionConfig,
  // );
  TorchStateApi? getTorchState();
  void observeTorchState(TorchStateObserverProxyApi observer);
  void removeTorchStateObserver(TorchStateObserverProxyApi observer);
  int? getTorchStrengthLevel();
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
    fullClassName: 'androidx.camera.core.CameraSelector.Builder',
  ),
)
abstract class CameraSelectorBuilderProxyApi {
  CameraSelectorBuilderProxyApi();

  CameraSelectorBuilderProxyApi addCameraFilter(
    CameraFilterProxyApi cameraFilter,
  );
  CameraSelectorBuilderProxyApi requireLensFacing(
    CameraSelectorLensFacingApi lensFacing,
  );
  CameraSelectorBuilderProxyApi setPhysicalCameraId(String physicalCameraId);
  CameraSelectorProxyApi build();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.CameraSelector',
  ),
)
abstract class CameraSelectorProxyApi {
  @static
  late final CameraSelectorProxyApi back;
  @static
  late final CameraSelectorProxyApi front;
  @static
  late final CameraSelectorProxyApi external;

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
  @static
  late final DynamicRangeProxyApi unspecifid;
  @static
  late final DynamicRangeProxyApi sdr;
  @static
  late final DynamicRangeProxyApi hdrUnspecified10Bit;
  @static
  late final DynamicRangeProxyApi hdr10_10Bit;
  @static
  late final DynamicRangeProxyApi hdr10Plus10Bit;
  @static
  late final DynamicRangeProxyApi hlg10Bit;
  @static
  late final DynamicRangeProxyApi dolbyVision8Bit;
  @static
  late final DynamicRangeProxyApi dolbyVision10Bit;

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
  late final int exposureCompensationIndex;
  late final IntRangeProxyApi exposureCompensationRange;
  late final double exposureCompensationStep;
  late final bool isExposureCompensationSupported;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.FocusMeteringAction.Builder',
  ),
)
abstract class FocusMeteringActionBuilderProxyApi {
  FocusMeteringActionBuilderProxyApi.new1(MeteringPointProxyApi point);

  FocusMeteringActionBuilderProxyApi.new2(
    MeteringPointProxyApi point,
    List<FocusMeteringActionMeteringModeApi> meteringModes,
  );

  FocusMeteringActionBuilderProxyApi addPoint1(MeteringPointProxyApi point);
  FocusMeteringActionBuilderProxyApi addPoint2(
    MeteringPointProxyApi point,
    List<FocusMeteringActionMeteringModeApi> meteringModes,
  );
  FocusMeteringActionBuilderProxyApi disableAutoCancel();
  FocusMeteringActionBuilderProxyApi setAutoCancelDuration(
    int duration,
    TimeUnitApi timeUnit,
  );
  FocusMeteringActionProxyApi build();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.core.FocusMeteringAction',
  ),
)
abstract class FocusMeteringActionProxyApi {
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

  late final void Function()? onCaptureStarted;
  late final void Function(int progress)? onCaptureProcessProgressed;
  late final void Function(BitmapProxyApi bitmap)? onPostviewBitmapAvailable;
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
  late final FlashStateApi flashState;
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
  late final ImageInfoProxyApi imageInfo;
  late final List<ImageProxyPlaneProxyProxyApi> planes;

  RectProxyApi getCropRect();
  // ImageProxyApi? getImage();
  void setCropRect(RectProxyApi? rect);
  BitmapProxyApi toBitmap();
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
  late final BarcodePersonNameProxyApi? name;
  late final String? organization;
  late final String? title;
  late final List<BarcodePhoneProxyApi> phones;
  late final List<BarcodeEmailProxyApi> emails;
  late final List<BarcodeAddressProxyApi> addresses;
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
  late final String? firstName;
  late final String? middleName;
  late final String? lastName;
  late final String? gender;
  late final String? birthDate;
  late final String? addressState;
  late final String? addressCity;
  late final String? addressStreet;
  late final String? addressZip;
  late final String? issuingCountry;
  late final String? issueDate;
  late final String? expiryDate;
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
  late final String? prefix;
  late final String? first;
  late final String? middle;
  late final String? last;
  late final String? suffix;
  late final String? formattedName;
  late final String? pronunciation;
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
  late final BarcodeFormatApi format;
  late final RectProxyApi? boundingBox;
  late final List<PointProxyApi>? cornerPoints;
  late final Uint8List? rawBytes;
  late final String? rawValue;
  late final String? displayValue;
  late final BarcodeTypeApi valueType;
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
    fullClassName: 'com.google.mlkit.vision.common.InputImage',
  ),
)
abstract class InputImageProxyApi {
  InputImageProxyApi.fromFilePath(String imageUri);

  int getWidth();
  int getHeight();
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
    fullClassName:
        'com.google.mlkit.vision.barcode.ZoomSuggestionOptions.Builder',
  ),
)
abstract class ZoomSuggestionOptionsBuilderProxyApi {
  ZoomSuggestionOptionsBuilderProxyApi(
    ZoomSuggestionOptionsZoomCallbackProxyApi zoomCallback,
  );

  ZoomSuggestionOptionsBuilderProxyApi setMaxSupportedZoomRatio(
    double maxSupportedZoomRatio,
  );
  ZoomSuggestionOptionsProxyApi build();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'com.google.mlkit.vision.barcode.ZoomSuggestionOptions',
  ),
)
abstract class ZoomSuggestionOptionsProxyApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName:
        'com.google.mlkit.vision.barcode.BarcodeScannerOptions.Builder',
  ),
)
abstract class BarcodeScannerOptionsBuilderProxyApi {
  BarcodeScannerOptionsBuilderProxyApi();

  BarcodeScannerOptionsBuilderProxyApi enableAllPotentialBarcodes();
  BarcodeScannerOptionsBuilderProxyApi setBarcodeFormats(
    List<BarcodeFormatApi> formats,
  );
  // BarcodeScannerOptionsBuilderProxyApi setExecutor(ExecutorProxyApi executor);
  BarcodeScannerOptionsBuilderProxyApi setZoomSuggestionOptions(
    ZoomSuggestionOptionsProxyApi zoomSuggestionOptions,
  );
  BarcodeScannerOptionsProxyApi build();
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

  @async
  List<BarcodeProxyApi> process(InputImageProxyApi image);
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
    fullClassName: 'com.google.mlkit.vision.face.FaceDetectorOptions.Builder',
  ),
)
abstract class FaceDetectorOptionsBuilderProxyApi {
  FaceDetectorOptionsBuilderProxyApi();

  FaceDetectorOptionsBuilderProxyApi enableTracking();
  FaceDetectorOptionsBuilderProxyApi setClassificationMode(
    FaceDetectorOptionsClassificationModeApi classificationMode,
  );
  FaceDetectorOptionsBuilderProxyApi setContourMode(
    FaceDetectorOptionsContourModeApi contourMode,
  );
  // FaceDetectorOptionsBuilderProxyApi setExecutor(ExecutorProxyApi executor);
  FaceDetectorOptionsBuilderProxyApi setLandmarkMode(
    FaceDetectorOptionsLandmarkModeApi landmarkMode,
  );
  FaceDetectorOptionsBuilderProxyApi setMinFaceSize(double minFaceSize);
  FaceDetectorOptionsBuilderProxyApi setPerformanceMode(
    FaceDetectorOptionsPerformanceModeApi performanceMode,
  );
  FaceDetectorOptionsProxyApi build();
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

  @async
  List<FaceProxyApi> process(InputImageProxyApi image);
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

enum VideoRecordEventFinalizeErrorApi {
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
    fullClassName: 'androidx.camera.video.FileOutputOptions.Builder',
  ),
)
abstract class FileOutputOptionsBuilderProxyApi extends OutputOptionsProxyApi {
  FileOutputOptionsBuilderProxyApi(String file);

  FileOutputOptionsBuilderProxyApi setDurationLimitMillis(
    int durationLimitMillis,
  );
  FileOutputOptionsBuilderProxyApi setFileSizeLimit(int fileSizeLimitBytes);
  FileOutputOptionsBuilderProxyApi setLocation(LocationProxyApi? location);
  FileOutputOptionsProxyApi build();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.FileOutputOptions',
  ),
)
abstract class FileOutputOptionsProxyApi extends OutputOptionsProxyApi {
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
abstract class VideoRecordEventStatusProxyApi extends VideoRecordEventProxyApi {
  late final OutputOptionsProxyApi outputOptions;
  late final RecordingStatsProxyApi recordingStats;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent.Start',
  ),
)
abstract class VideoRecordEventStartProxyApi extends VideoRecordEventProxyApi {
  late final OutputOptionsProxyApi outputOptions;
  late final RecordingStatsProxyApi recordingStats;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent.Pause',
  ),
)
abstract class VideoRecordEventPauseProxyApi extends VideoRecordEventProxyApi {
  late final OutputOptionsProxyApi outputOptions;
  late final RecordingStatsProxyApi recordingStats;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent.Resume',
  ),
)
abstract class VideoRecordEventResumeProxyApi extends VideoRecordEventProxyApi {
  late final OutputOptionsProxyApi outputOptions;
  late final RecordingStatsProxyApi recordingStats;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.video.VideoRecordEvent.Finalize',
  ),
)
abstract class VideoRecordEventFinalizeProxyApi
    extends VideoRecordEventProxyApi {
  late final OutputOptionsProxyApi outputOptions;
  late final RecordingStatsProxyApi recordingStats;
  late final List<Object?>? cause;
  late final VideoRecordEventFinalizeErrorApi error;
  late final OutputResultsProxyApi outputResults;
  late final bool hasError;
}

// view
enum CameraControllerTapToFocusApi {
  notStarted,
  started,
  focused,
  notFocused,
  failed,
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
  // void getInitializeFuture();
  bool hasCamera(CameraSelectorProxyApi cameraSelector);
  CameraSelectorProxyApi getCameraSelector();
  void setCameraSelector(CameraSelectorProxyApi cameraSelector);
  CameraInfoProxyApi? getCameraInfo();
  CameraControlProxyApi? getCameraControl();
  TorchStateApi? getTorchState();
  void observeTorchState(TorchStateObserverProxyApi observer);
  void removeTorchStateObserver(TorchStateObserverProxyApi observer);
  @async
  void enableTorch(bool torchEnabled);
  ZoomStateProxyApi? getZoomState();
  void observeZoomState(ZoomStateObserverProxyApi observer);
  void removeZoomStateObserver(ZoomStateObserverProxyApi observer);
  @async
  void setZoomRatio(double zoomRatio);
  @async
  void setLinearZoom(double linearZoom);
  bool isPinchToZoomEnabled();
  void setPinchToZoomEnabled(bool enabled);
  TapToFocusInfoProxyApi? getTapToFocusInfoState();
  void observeTapToFocusInfoState(TapToFocusInfoObserverProxyApi observer);
  void removeTapToFocusInfoStateObserver(
    TapToFocusInfoObserverProxyApi observer,
  );
  bool isTapToFocusEnabled();
  void setTapToFocusEnabled(bool enabled);
  void setTapToFocusAutoCancelDuration(int duration, TimeUnitApi timeUnit);
  bool isImageCaptureEnabled();
  bool isImageAnalysisEnabled();
  bool isVideoCaptureEnabled();
  void setEnabledUseCases(List<CameraControllerUseCaseApi> enabledUseCases);
  ResolutionSelectorProxyApi? getPreviewResolutionSelector();
  void setPreviewResolutionSelector(
    ResolutionSelectorProxyApi? resolutionSelector,
  );
  ResolutionSelectorProxyApi? getImageCaptureResolutionSelector();
  void setImageCaptureResolutionSelector(
    ResolutionSelectorProxyApi? resolutionSelector,
  );
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
  QualitySelectorProxyApi getVideoCaptureQualitySelector();
  void setVideoCaptureQualitySelector(QualitySelectorProxyApi qualitySelector);
  DynamicRangeProxyApi getVideoCaptureDynamicRange();
  void setVideoCaptureDynamicRange(DynamicRangeProxyApi dynamicRange);
  MirrorModeApi getVideoCaptureMirrorMode();
  void setVideoCaptureMirrorMode(MirrorModeApi mirrorMode);
  IntRangeProxyApi getVideoCaptureTargetFrameRate();
  void setVideoCaptureTargetFrameRate(IntRangeProxyApi targetFrameRate);
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

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.view.LifecycleCameraController',
  ),
)
abstract class LifecycleCameraControllerProxyApi
    extends CameraControllerProxyApi {
  LifecycleCameraControllerProxyApi();

  void bindToLifecycle();
  void unbind();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.view.PreviewView',
  ),
)
abstract class PreviewViewProxyApi {
  PreviewViewProxyApi();

  BitmapProxyApi? getBitmap();
  CameraControllerProxyApi? getController();
  void setController(CameraControllerProxyApi? controller);
  PreviewViewScaleTypeApi getScaleType();
  void setScaleType(PreviewViewScaleTypeApi scaleType);
  PreviewViewImplementationModeApi getImplementationMode();
  void setImplementationMode(
    PreviewViewImplementationModeApi implementationMode,
  );
  MeteringPointFactoryProxyApi getMeteringPointFactory();
  // OutputTransformProxyApi? getOutputTransform();
  PreviewViewStreamStateApi? getPreviewStreamState();
  void observePreviewStreamState(
    PreviewViewStreamStateObserverProxyApi observer,
  );
  void removePreviewStreamStateObserver(
    PreviewViewStreamStateObserverProxyApi observer,
  );
  // ImageCaptureScreenFalshProxyApi? getScreenFlash();
  // void setScreenFlashWindow(WindowProxyApi? screenFlashWindow);
  void setScreenFlashOverlayColor(int color);
  // MatrixProxyApi? getSensorToViewTransform();
  // PreviewSurfaceProviderProxyApi getSurfaceProvider();
  // VidePortProxyApi? getViewPort1();
  // VidePortProxyApi? getViewPort2(SurfaceRotationApi targetRotation);
  // bool onTouchEvent(MotionEventProxyApi event);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.camera.view.RotationProvider.Listener',
  ),
)
abstract class RotationProviderListenerProxyApi {
  RotationProviderListenerProxyApi();

  late final void Function(SurfaceRotationApi rotation) onRotationChanged;
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
  TapToFocusInfoProxyApi();

  late final CameraControllerTapToFocusApi focusState;
  late final PointFProxyApi? tapPoint;
}
