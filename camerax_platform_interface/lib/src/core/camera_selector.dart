import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'lens_facing.dart';

abstract interface class CameraSelector {
  factory CameraSelector({
    LensFacing? lensFacing,
  }) =>
      CameraXPlugin.instance.createCameraSelector(
        lensFacing: lensFacing,
      );

  static CameraSelector get back => CameraSelector(
        lensFacing: LensFacing.back,
      );
  static CameraSelector get front => CameraSelector(
        lensFacing: LensFacing.front,
      );
  static CameraSelector get external => CameraSelector(
        lensFacing: LensFacing.external,
      );
}
