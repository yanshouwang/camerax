import 'package:camerax_platform_interface/src/camerax.dart';
import 'package:flutter/foundation.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'lens_facing.dart';

/// A set of requirements and priorities used to select a camera or return a
/// filtered set of cameras.
abstract base class CameraSelector extends PlatformInterface {
  static final _token = Object();

  static CameraSelector get front => CameraX.instance.getFrontCameraSelector();
  static CameraSelector get back => CameraX.instance.getBackCameraSelector();
  static CameraSelector get external =>
      CameraX.instance.getExternalCameraSelector();

  factory CameraSelector({
    LensFacing? lensFacing,
  }) {
    final instance = CameraX.instance.createCameraSelector(
      lensFacing: lensFacing,
    );
    PlatformInterface.verify(instance, _token);
    return instance;
  }

  @protected
  CameraSelector.impl() : super(token: _token);
}
