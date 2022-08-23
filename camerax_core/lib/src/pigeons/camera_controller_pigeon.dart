import 'dart:async';

import 'package:camerax_core/camerax_core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pigeons.dart';

abstract class CameraControllerPigeon extends PlatformInterface {
  /// Constructs a [CameraControllerPigeon].
  CameraControllerPigeon() : super(token: _token);

  static final Object _token = Object();

  static CameraControllerPigeon _instance = _CameraControllerPigeon();

  /// The default instance of [CameraControllerPigeon] to use.
  ///
  /// Defaults to [_CameraControllerPigeon].
  static CameraControllerPigeon get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CameraControllerPigeon] when
  /// they register themselves.
  static set instance(CameraControllerPigeon instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Stream<TorchStateArguments> get torchStateStream;

  Future<void> create(String id, CameraSelector cameraSelector);
  Future<void> bind(String id);
  Future<void> enableTorch(String id, bool state);
  Future<void> setCameraSelector(String id, CameraSelector cameraSelector);
  Future<void> setImageAnalyzer(String id, String analyzerId);
  Future<void> clearImageAnalyzer(String id);
  Future<void> unbind(String id);
  Future<void> dispose(String id);
}

class _CameraControllerPigeon extends CameraControllerPigeon
    implements CameraControllerFlutterPigeion {
  final CameraControllerHostPigeon host;
  final StreamController<TorchStateArguments> torchStateStreamController;

  _CameraControllerPigeon()
      : host = CameraControllerHostPigeon(),
        torchStateStreamController = StreamController.broadcast() {
    CameraControllerFlutterPigeion.setup(this);
  }

  @override
  Stream<TorchStateArguments> get torchStateStream =>
      torchStateStreamController.stream;

  @override
  Future<void> create(String id, CameraSelector cameraSelector) {
    final cameraSelectorBuffer = cameraSelector.writeToBuffer();
    return host.create(id, cameraSelectorBuffer);
  }

  @override
  Future<void> bind(String id) {
    return host.bind(id);
  }

  @override
  Future<void> enableTorch(String id, bool state) {
    return host.enableTorch(id, state);
  }

  @override
  Future<void> setCameraSelector(String id, CameraSelector cameraSelector) {
    final cameraSelectorBuffer = cameraSelector.writeToBuffer();
    return host.setCameraSelector(id, cameraSelectorBuffer);
  }

  @override
  Future<void> setImageAnalyzer(String id, String imageAnalyzerId) {
    return host.setImageAnalyzer(id, imageAnalyzerId);
  }

  @override
  Future<void> clearImageAnalyzer(String id) {
    return host.clearImageAnalyzer(id);
  }

  @override
  Future<void> unbind(String id) {
    return host.unbind(id);
  }

  @override
  Future<void> dispose(String id) {
    return host.dispose(id);
  }

  @override
  void onTorchStateChanged(String id, bool state) {
    final torchStateArguments = TorchStateArguments(id: id, state: state);
    torchStateStreamController.add(torchStateArguments);
  }
}
