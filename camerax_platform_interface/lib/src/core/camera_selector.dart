import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:flutter/widgets.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'lens_facing.dart';

/// A set of requirements and priorities used to select a camera or return a
/// filtered set of cameras.
abstract base class CameraSelector extends PlatformInterface {
  static final _token = Object();

  factory CameraSelector({
    LensFacing? lensFacing,
  }) {
    final instance = CameraXPlugin.instance.createCameraSelector(
      lensFacing: lensFacing,
    );
    PlatformInterface.verify(instance, _token);
    return instance;
  }

  @protected
  CameraSelector.impl() : super(token: _token);

  static CameraSelector get front => CameraSelector(
        lensFacing: LensFacing.front,
      );
  static CameraSelector get back => CameraSelector(
        lensFacing: LensFacing.back,
      );
  static CameraSelector get external => CameraSelector(
        lensFacing: LensFacing.external,
      );
}
