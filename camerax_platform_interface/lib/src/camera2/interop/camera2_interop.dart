import 'package:camerax_platform_interface/src/camera2.dart';
import 'package:camerax_platform_interface/src/core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class Camera2Interop$Extender<T> {
  factory Camera2Interop$Extender(ExtendableBuilder<T> baseBuilder) =>
      Camera2InteropChannel.instance.createExtender(baseBuilder);

  Future<Camera2Interop$Extender<T>> setCaptureRequestOption<ValueT>(
    CaptureRequest$Key<ValueT> key,
    ValueT value,
  );
  // Future<Camera2Interop$Extender<T>> setDeviceStateCallback(
  //   CameraDevice$StateCallback stateCallback,
  // );
  Future<Camera2Interop$Extender<T>> setPhysicalCameraId(String cameraId);
  Future<Camera2Interop$Extender<T>> setSessionCaptureCallback(
    CameraCaptureSession$CaptureCallback captureCallback,
  );
  Future<Camera2Interop$Extender<T>> setSessionStateCallback(
    CameraCaptureSession$StateCallback stateCallback,
  );
  // Future<Camera2Interop$Extender<T>> setStreamUseCase(int streamUseCase);
}

abstract base class Camera2InteropChannel extends PlatformInterface {
  Camera2InteropChannel() : super(token: _token);

  static final _token = Object();

  static Camera2InteropChannel? _instance;

  static Camera2InteropChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(Camera2InteropChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  Camera2Interop$Extender<T> createExtender<T>(
    ExtendableBuilder<T> baseBuilder,
  );
}
