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
    fullClassName: 'kotlin.Any',
  ),
)
abstract class Any {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.hebei.camerax_android.core.ZoomState',
  ),
)
abstract class ZoomState extends Any {
  late double minZoomRatio;
  late double maxZoomRatio;
  late double zoomRatio;
  late double linearZoom;
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.lifecycle.LiveData<*>',
  ),
)
abstract class LiveData {
  Any getValue();

  void observe(Observer observer);
  void removeObserver(Observer observer);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'androidx.lifecycle.Observer<*>',
  ),
)
abstract class Observer {
  Observer();

  late void Function(Any value) onChanged;
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
  bool isTapToFocusEnabled();
  @async
  void setTapToFocusEnabled(bool enabled);
  @async
  bool isPinchToZoomEnabled();
  @async
  void setPinchToZoomEnabled(bool enabled);
  @async
  LiveData getZoomState();
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
