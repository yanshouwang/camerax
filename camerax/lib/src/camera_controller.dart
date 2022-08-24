import 'dart:async';

import 'package:camerax_core/camerax_core.dart' as core;
import 'package:flutter/foundation.dart';

import 'camera_selector.dart';
import 'extensions.dart';
import 'image_analyzer.dart';

abstract class CameraController {
  ValueListenable<bool> get torchState;

  CameraSelector get cameraSelector;
  set cameraSelector(CameraSelector value);
  set imageAnalyzer(ImageAnalyzer? value);
  Future<void> bind();
  Future<void> enableTorch(bool state);
  Future<void> unbind();
  void dispose();

  factory CameraController({
    CameraSelector cameraSelector = CameraSelector.back,
  }) =>
      _CameraController(cameraSelector);
}

class _CameraController implements CameraController {
  CameraSelector _cameraSelector;
  ImageAnalyzer? _imageAnalyzer;
  @override
  final ValueNotifier<bool> torchState;

  late StreamSubscription<bool> torchStateSubscription;

  _CameraController(this._cameraSelector) : torchState = ValueNotifier(false) {
    core.CameraControllerPigeon.instance.create(
      id,
      core.CameraSelector(
        facing: core.CameraFacing.valueOf(cameraSelector.facing.index),
      ),
    );
    torchStateSubscription = core
        .CameraControllerPigeon.instance.torchStateStream
        .where((e) => e.id == id)
        .map((e) => e.state)
        .listen((e) => torchState.value = e);
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
  set imageAnalyzer(ImageAnalyzer? value) {
    if (_imageAnalyzer == value) {
      return;
    }
    if (value == null) {
      core.CameraControllerPigeon.instance.clearImageAnalyzer(id);
    } else {
      core.CameraControllerPigeon.instance.setImageAnalyzer(id, value.id);
    }
    _imageAnalyzer = value;
  }

  @override
  Future<void> bind() {
    return core.CameraControllerPigeon.instance.bind(id);
  }

  @override
  Future<void> enableTorch(bool state) {
    return core.CameraControllerPigeon.instance.enableTorch(id, state);
  }

  @override
  Future<void> unbind() {
    return core.CameraControllerPigeon.instance.unbind(id);
  }

  @override
  void dispose() {
    torchStateSubscription.cancel();
    torchState.dispose();
    core.CameraControllerPigeon.instance.dispose(id);
  }
}
