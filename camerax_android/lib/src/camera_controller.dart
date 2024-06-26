import 'dart:async';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:jni/jni.dart';

import 'jni.dart';
import 'jni.g.dart' as jni;
import 'permissions_manager.dart';

class JNICameraController implements CameraController {
  static final _permissionsManager = PermissionsManager();

  final jni.LifecycleCameraController jniValue;
  late final StreamController<ZoomState?> _zoomStateChagnedController;
  late jni.Observer<jni.ZoomState> _zoomStateObserver;

  @override
  Stream<ZoomState?> get zoomStateChanged => _zoomStateChagnedController.stream;

  JNICameraController()
      : jniValue = jni.LifecycleCameraController(JNI.activity) {
    _zoomStateChagnedController = StreamController.broadcast(
      onListen: _observeZoomState,
      onCancel: _removeZoomStateObserver,
    );
  }

  @override
  Future<bool> requestPermissions({
    bool enableAudio = false,
  }) async {
    final granted = await _permissionsManager.requestPermissions(enableAudio);
    return granted;
  }

  @override
  Future<void> bindToLifecycle() async {
    final lifecycleOwner = JNI.activity.castTo(jni.LifecycleOwner.type);
    await jniValue.bindToLifecycleOnMainThread(lifecycleOwner);
  }

  @override
  Future<void> unbind() async {
    await jniValue.unbindOnMainThread();
  }

  @override
  Future<bool> hasCamera(CameraSelector cameraSelector) async {
    final hasCamera =
        await jniValue.hasCameraOnMainThread(cameraSelector.jniValue);
    return hasCamera;
  }

  @override
  Future<void> setCameraSelector(CameraSelector cameraSelector) async {
    await jniValue.setCameraSelectorOnMainThread(cameraSelector.jniValue);
  }

  @override
  Future<bool> isTapToFocusEnabled() async {
    final isTapToFocusEnabled =
        await jniValue.isTapToFocusEnabledOnMainThread();
    return isTapToFocusEnabled;
  }

  @override
  Future<void> setTapToFocusEnabled(bool enabled) async {
    await jniValue.setTapToFocusEnabledOnMainThread(enabled);
  }

  @override
  Future<bool> isPinchToZoomEnabled() async {
    final isPinchToZoomEnabled =
        await jniValue.isPinchToZoomEnabledOnMainThread();
    return isPinchToZoomEnabled;
  }

  @override
  Future<void> setPinchToZoomEnabled(bool enabled) async {
    await jniValue.setPinchToZoomEnabledOnMainThread(enabled);
  }

  @override
  Future<ZoomState?> getZoomState() async {
    final zoomStateData = await jniValue.getZoomStateOnMainThread();
    final zoomState = zoomStateData.getValue();
    return zoomState.dartValue;
  }

  @override
  Future<void> setLinearZoom(double linearZoom) async {
    final lisentalbeFuture =
        await jniValue.setLinearZoomOnMainThread(linearZoom);
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
    final lisentalbeFuture = await jniValue.setZoomRatioOnMainThread(zoomRatio);
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

  void _observeZoomState() async {
    final zoomStateData = await jniValue.getZoomStateOnMainThread();
    final lifecycleOwner = JNI.activity.castTo(jni.LifecycleOwner.type);
    final observer = jni.Observer.implement(jni.$ObserverImpl(
      T: jni.ZoomState.type,
      onChanged: (zoomState) {
        _zoomStateChagnedController.add(zoomState.dartValue);
      },
    ));
    zoomStateData.observeOnMainThread(
      lifecycleOwner,
      observer.T,
      observer.reference,
    );
    _zoomStateObserver = observer;
  }

  void _removeZoomStateObserver() async {
    final zoomStateData = await jniValue.getZoomStateOnMainThread();
    final observer = _zoomStateObserver;
    zoomStateData.removeObserverOnMainThread(
      observer.T,
      observer.reference,
    );
  }
}
