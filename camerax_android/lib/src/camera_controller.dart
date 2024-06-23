import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:flutter/foundation.dart';

import 'instance_manager.dart';
import 'object.dart';
import 'permissions_manager.dart';
import 'pigeon.dart';
import 'pigeon.g.dart';

class AndroidCameraController extends AndroidObject
    implements CameraController {
  static final _api = CameraControllerHostAPI();
  static final _permissionsManager = PermissionsManager();

  AndroidCameraController() : super.detached() {
    final identifier = InstanceManager.instance.addDartCreatedInstance(this);
    _api.create(identifier);
  }

  @protected
  AndroidCameraController.detached() : super.detached();

  @override
  AndroidCameraController copy() {
    return AndroidCameraController.detached();
  }

  @override
  Future<bool> requestPermissions({
    bool enableAudio = false,
  }) async {
    final granted = await _permissionsManager.requestPermissions(enableAudio);
    return granted;
  }

  @override
  Future<void> bind() async {
    await _api.bindToLifecycle(identifier);
  }

  @override
  Future<void> unbind() async {
    await _api.unbind(identifier);
  }

  @override
  Future<void> setCameraSelector(CameraSelector cameraSelector) async {
    final cameraSelectorArgs = cameraSelector.toArgs();
    await _api.setCameraSelector(identifier, cameraSelectorArgs);
  }

  @override
  Future<bool> isPinchToZoomEnabled() async {
    final enabledArgs = await _api.isPinchToZoomEnabled(identifier);
    return enabledArgs;
  }

  @override
  Future<void> setPinchToZoomEnabled(bool enabled) async {
    await _api.setPinchToZoomEnabled(identifier, enabled);
  }

  @override
  Future<bool> isTapToFocusEnabled() async {
    final enabledArgs = await _api.isTapToFocusEnabled(identifier);
    return enabledArgs;
  }

  @override
  Future<void> setTapToFocusEnabled(bool enabled) async {
    await _api.setTapToFocusEnabled(identifier, enabled);
  }

  @override
  Future<void> setLinearZoom(double linearZoom) async {
    await _api.setLinearZoom(identifier, linearZoom);
  }

  @override
  Future<void> setZoomRatio(double zoomRatio) async {
    await _api.setZoomRatio(identifier, zoomRatio);
  }
}
