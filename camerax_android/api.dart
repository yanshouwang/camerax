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

enum ScaleType {
  fillStart,
  fillCenter,
  fillEnd,
  fitStart,
  fitCenter,
  fitEnd,
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.core.PermissionManager',
  ),
)
abstract class PermissionManager {
  @static
  late PermissionManager instance;

  bool checkPermissioin(Permission permission);
  @async
  bool requestPermissions(List<Permission> permissions);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.core.CameraSelector',
  ),
)
abstract class CameraSelector {
  @static
  late CameraSelector front;
  @static
  late CameraSelector back;
  @static
  late CameraSelector external;

  CameraSelector(LensFacing? lensFacing);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.core.CameraStateLiveData.Wrapper',
  ),
)
abstract class CameraStateLiveData {
  CameraState? getValue();

  void observe(CameraStateObserver observer);
  void removeObserver(CameraStateObserver observer);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.core.CameraStateObserver.Wrapper',
  ),
)
abstract class CameraStateObserver {
  CameraStateObserver();

  late void Function(CameraState value) onChanged;
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

  late void Function(bool value) onChanged;
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

  late void Function(ZoomState value) onChanged;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.core.ExposureState',
  ),
)
abstract class ExposureState {
  int getExposureCompensationIndex();
  Range<int> getExposureCompensationRange();
  Rational getExposureCompensationStep();
  bool isExposureCompensationSupported();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.core.FocusMeteringAction',
  ),
)
abstract class FocusMeteringAction {}

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
  Set<CameraInfo> getPhysicalCameraInfos();
  int getSensorRotationDegrees();
  Set<Range<int>> getSupportedFrameRateRanges();
  bool isLogicalMultiCameraSupported();
  bool isZslSupported();
  bool hasFlashUnit();
  bool isFocusMeteringSupported(FocusMeteringAction action);
  Set<DynamicRange> querySupportedDynamicRanges(
      Set<DynamicRange> candidateDynamicRanges);
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
  void setExposureCompensationIndex(int value);
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
  CameraInfo getCameraInfo();
  @async
  CameraControl getCameraControl();
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
