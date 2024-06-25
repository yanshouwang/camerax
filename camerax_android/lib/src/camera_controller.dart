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
  Future<void> bind() async {
    final liefcycleOwner = JNI.activity.castTo(jni.LifecycleOwner.type);
    await runOnPlatformThread(() {
      jniValue.bindToLifecycle(liefcycleOwner);
    });
  }

  @override
  Future<void> unbind() async {
    await runOnPlatformThread(() {
      jniValue.unbind();
    });
  }

  @override
  Future<bool> hasCamera(CameraSelector cameraSelector) async {
    final hasCamera = await runOnPlatformThread(() {
      return jniValue.hasCamera(cameraSelector.jniValue);
    });
    return hasCamera;
  }

  @override
  Future<void> setCameraSelector(CameraSelector cameraSelector) async {
    await runOnPlatformThread(() {
      jniValue.setCameraSelector(cameraSelector.jniValue);
    });
  }

  @override
  Future<bool> isTapToFocusEnabled() async {
    final isTapToFocusEnabled = await runOnPlatformThread(() {
      return jniValue.isTapToFocusEnabled();
    });
    return isTapToFocusEnabled;
  }

  @override
  Future<void> setTapToFocusEnabled(bool enabled) async {
    await runOnPlatformThread(() {
      jniValue.setTapToFocusEnabled(enabled);
    });
  }

  @override
  Future<bool> isPinchToZoomEnabled() async {
    final isPinchToZoomEnabled = await runOnPlatformThread(() {
      return jniValue.isPinchToZoomEnabled();
    });
    return isPinchToZoomEnabled;
  }

  @override
  Future<void> setPinchToZoomEnabled(bool enabled) async {
    await runOnPlatformThread(() {
      jniValue.setPinchToZoomEnabled(enabled);
    });
  }

  @override
  Future<ZoomState?> getZoomState() async {
    final zoomStateData = await runOnPlatformThread(() {
      return jniValue.getZoomState();
    });
    final zoomState = zoomStateData.getValue();
    if (zoomState.isNull) {
      return null;
    } else {
      return zoomState.dartValue;
    }
  }

  @override
  Future<void> setLinearZoom(double linearZoom) async {
    final lisentalbeFuture = await runOnPlatformThread(() {
      return jniValue.setLinearZoom(linearZoom);
    });
    final completer = Completer<void>();
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
    await completer.future;
  }

  @override
  Future<void> setZoomRatio(double zoomRatio) async {
    final lisentalbeFuture = await runOnPlatformThread(() {
      return jniValue.setZoomRatio(zoomRatio);
    });
    final completer = Completer<void>();
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
    await completer.future;
  }
}
