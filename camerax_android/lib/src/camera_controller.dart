import 'dart:async';
import 'dart:ui';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:jni/jni.dart';

import 'jni.dart';
import 'jni.g.dart' as jni;
import 'permissions_manager.dart';

class AndroidCameraController implements CameraController {
  static final _permissionsManager = PermissionsManager();

  final jni.LifecycleCameraController jniValue;

  @override
  // TODO: implement zoomStateChanged
  Stream<ZoomState?> get zoomStateChanged => throw UnimplementedError();

  AndroidCameraController()
      : jniValue = jni.LifecycleCameraController(JNI.activity);

  @override
  Future<bool> requestPermissions({
    bool enableAudio = false,
  }) async {
    final granted = await _permissionsManager.requestPermissions(enableAudio);
    return granted;
  }

  @override
  void bind() {
    final liefcycleOwner = JNI.activity.castTo(jni.LifecycleOwner.type);
    jniValue.bindToLifecycle(liefcycleOwner);
  }

  @override
  void unbind() {
    jniValue.unbind();
  }

  @override
  bool hasCamera(CameraSelector cameraSelector) {
    return jniValue.hasCamera(cameraSelector.jniValue);
  }

  @override
  void setCameraSelector(CameraSelector cameraSelector) {
    jniValue.setCameraSelector(cameraSelector.jniValue);
  }

  @override
  bool get isTapToFocusEnabled => jniValue.isTapToFocusEnabled();
  @override
  set isTapToFocusEnabled(bool value) => jniValue.setTapToFocusEnabled(value);

  @override
  bool get isPinchToZoomEnabled => jniValue.isPinchToZoomEnabled();
  @override
  set isPinchToZoomEnabled(bool value) => jniValue.setPinchToZoomEnabled(value);

  @override
  ZoomState? get zoomState => jniValue.getZoomState().getValue().dartValue;

  @override
  Future<void> setLinearZoom(double linearZoom) async {
    final completer = Completer<void>();
    final lisentalbeFuture = jniValue.setLinearZoom(linearZoom);
    final executor = jni.ContextCompat.getMainExecutor(JNI.activity);
    lisentalbeFuture.addListener(
      jni.Runnable.implement(jni.$RunnableImpl(
        run: () {
          try {
            final futureType = jni.Future.type(JObject.type);
            final future = lisentalbeFuture.castTo(futureType);
            future.get0();
            completer.complete();
          } catch (e) {
            completer.completeError(e);
          }
        },
      )),
      executor,
    );
  }

  @override
  Future<void> setZoomRatio(double zoomRatio) async {
    final completer = Completer<void>();
    final lisentalbeFuture = jniValue.setZoomRatio(zoomRatio);
    final executor = jni.ContextCompat.getMainExecutor(JNI.activity);
    lisentalbeFuture.addListener(
      jni.Runnable.implement(jni.$RunnableImpl(
        run: () {
          try {
            final futureType = jni.Future.type(JObject.type);
            final future = lisentalbeFuture.castTo(futureType);
            future.get0();
            completer.complete();
          } catch (e) {
            completer.completeError(e);
          }
        },
      )),
      executor,
    );
  }
}
