// Run with `dart run pigeon --input pigeon.dart`.
import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/pigeon.g.dart',
  dartTestOut: 'test/test_pigeon.g.dart',
  dartOptions: DartOptions(),
  kotlinOut: 'android/src/main/kotlin/dev/hebei/camerax_android/Pigeon.g.kt',
  kotlinOptions: KotlinOptions(
    package: 'dev.hebei.camerax_android',
  ),
))
enum LensFacingArgs {
  front,
  back,
  external,
}

enum ScaleTypeArgs {
  fillCenter,
  fillEnd,
  fillStart,
  fitCenter,
  fitEnd,
  fitStart,
}

class CameraSelectorArgs {
  final LensFacingArgs lensFacingArgs;

  CameraSelectorArgs({
    required this.lensFacingArgs,
  });
}

/// Host API for managing the native `InstanceManager`.
@HostApi(dartHostTestHandler: 'TestInstanceManagerHostAPI')
abstract class InstanceManagerHostAPI {
  /// Clear the native `InstanceManager`.
  ///
  /// This is typically only used after a hot restart.
  void clear();
}

/// Handles methods calls to the native Java Object class.
///
/// Also handles calls to remove the reference to an instance with `dispose`.
///
/// See https://docs.oracle.com/javase/7/docs/api/java/lang/Object.html.
@HostApi(dartHostTestHandler: 'TestJavaObjectHostAPI')
abstract class ObjectHostAPI {
  void dispose(int identifier);
}

/// Handles callbacks methods for the native Java Object class.
///
/// See https://docs.oracle.com/javase/7/docs/api/java/lang/Object.html.
@FlutterApi()
abstract class ObjectFlutterAPI {
  void dispose(int identifier);
}

@HostApi(dartHostTestHandler: 'TestPermissionsManagerHostAPI')
abstract class PermissionsManagerHostAPI {
  @async
  bool requestPermissions(bool enableAudioArgs);
}

@HostApi(dartHostTestHandler: 'TestCameraControllerHostAPI')
abstract class CameraControllerHostAPI {
  void create(int identifier);
  void bindToLifecycle(int identifier);
  void unbind(int identifier);
  void setCameraSelector(int identifier, CameraSelectorArgs cameraSelectorArgs);
  bool isPinchToZoomEnabled(int identifier);
  void setPinchToZoomEnabled(int identifier, bool enabledArgs);
  bool isTapToFocusEnabled(int identifier);
  void setTapToFocusEnabled(int identifier, bool enabledArgs);
  @async
  void setLinearZoom(int identifier, double linearZoomArgs);
  @async
  void setZoomRatio(int identifier, double zoomRatioArgs);
}

@HostApi(dartHostTestHandler: 'TestPreviewViewHostAPI')
abstract class PreviewViewHostAPI {
  void create(int identifier);
  void setController(int identifier, int controllerIdentifier);
  void setScaleType(int identifier, ScaleTypeArgs scaleTypeArgs);
}
