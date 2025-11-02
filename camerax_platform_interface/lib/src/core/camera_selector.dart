import 'package:camerax_platform_interface/src/camerax_plugin.dart';

enum CameraSelectorLensFacing { unknown, front, back, external }

abstract base class CameraSelector {
  static CameraSelector get front =>
      CameraXPlugin.instance.$CameraSelectorFront;
  static CameraSelector get back => CameraXPlugin.instance.$CameraSelectorBack;
  static CameraSelector get external =>
      CameraXPlugin.instance.$CameraSelectorExternal;

  CameraSelector.impl();

  factory CameraSelector({CameraSelectorLensFacing? lensFacing}) =>
      CameraXPlugin.instance.newCameraSelector(lensFacing: lensFacing);
}
