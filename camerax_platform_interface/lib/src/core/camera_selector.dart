import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'lens_facing.dart';

abstract base class CameraSelector {
  static CameraSelector get front =>
      CameraXPlugin.instance.getFrontCameraSelector();
  static CameraSelector get back =>
      CameraXPlugin.instance.getBackCameraSelector();
  static CameraSelector get external =>
      CameraXPlugin.instance.getExternalCameraSelector();

  CameraSelector.impl();

  factory CameraSelector({
    LensFacing? lensFacing,
  }) =>
      CameraXPlugin.instance.newCameraSelector(
        lensFacing: lensFacing,
      );
}
