import 'dart:async';

import 'package:camerax_core/camerax_core.dart' as core;
import 'package:flutter/foundation.dart';

import 'camera_selector.dart';
import 'image_analyzer.dart';

abstract class CameraController {
  ValueListenable<bool> get torchState;

  CameraSelector get cameraSelector;
  set cameraSelector(CameraSelector value);
  void bind();
  void enableTorch(bool state);
  void setImageAnalyzer(ImageAnalyzer imageAnalyzer);
  void clearImageAnalyzer();
  void unbind();
  void dispose();

  factory CameraController({
    CameraSelector cameraSelector = CameraSelector.back,
  }) =>
      _CameraController(cameraSelector);
}

class _CameraController implements CameraController {
  CameraSelector _cameraSelector;
  @override
  final ValueNotifier<bool> torchState;

  late StreamSubscription<core.TorchStateArguments> torchStateSubscription;

  _CameraController(this._cameraSelector) : torchState = ValueNotifier(false) {
    core.CameraControllerPigeon.instance.create(
      id,
      core.CameraSelector(
        facing: core.CameraFacing.valueOf(cameraSelector.facing.index),
      ),
    );
    torchStateSubscription = core
        .CameraControllerPigeon.instance.torchStateStream
        .listen(onTorchStateChanged);
  }

  void onTorchStateChanged(core.TorchStateArguments torchStateArguments) {
    if (torchStateArguments.id != id) {
      return;
    }
    torchState.value = torchStateArguments.state;
  }

  @override
  CameraSelector get cameraSelector => _cameraSelector;
  @override
  set cameraSelector(CameraSelector value) {
    _cameraSelector = value;
    core.CameraControllerPigeon.instance.setCameraSelector(
      id,
      core.CameraSelector(
        facing: core.CameraFacing.valueOf(cameraSelector.facing.index),
      ),
    );
  }

  @override
  void bind() {
    core.CameraControllerPigeon.instance.bind(id);
  }

  @override
  void enableTorch(bool state) {
    core.CameraControllerPigeon.instance.enableTorch(id, state);
  }

  @override
  void setImageAnalyzer(ImageAnalyzer imageAnalyzer) {
    core.CameraControllerPigeon.instance.setImageAnalyzer(id, imageAnalyzer.id);
  }

  @override
  void clearImageAnalyzer() {
    core.CameraControllerPigeon.instance.clearImageAnalyzer(id);
  }

  @override
  void unbind() {
    core.CameraControllerPigeon.instance.unbind(id);
  }

  @override
  void dispose() {
    torchStateSubscription.cancel();
    torchState.dispose();
    core.CameraControllerPigeon.instance.dispose(id);
  }
}

extension on CameraController {
  String get id => hashCode.toString();
}

extension on ImageAnalyzer {
  String get id => hashCode.toString();
}
