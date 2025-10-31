import 'package:camerax_platform_interface/src/camerax_plugin.dart';

enum CameraSelectorLensFacing { unknown, front, back, external }

abstract base class CameraSelector {
  static CameraSelector get front =>
      CameraXPlugin.instance.getFront$CameraSelector();
  static CameraSelector get back =>
      CameraXPlugin.instance.getBack$CameraSelector();
  static CameraSelector get external =>
      CameraXPlugin.instance.getExternal$CameraSelector();

  CameraSelector.impl();

  factory CameraSelector({CameraSelectorLensFacing? lensFacing}) =>
      CameraXPlugin.instance.newCameraSelector(lensFacing: lensFacing);
}
