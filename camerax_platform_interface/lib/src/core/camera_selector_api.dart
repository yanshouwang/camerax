import 'package:camerax_platform_interface/src/camerax_plugin.dart';

enum CameraSelectorLensFacing { unknown, front, back, external }

abstract base class CameraSelectorApi {
  static CameraSelectorApi get front =>
      CameraXPlugin.instance.$CameraSelectorApiFront;
  static CameraSelectorApi get back =>
      CameraXPlugin.instance.$CameraSelectorApiBack;
  static CameraSelectorApi get external =>
      CameraXPlugin.instance.$CameraSelectorApiExternal;

  CameraSelectorApi.impl();

  factory CameraSelectorApi({CameraSelectorLensFacing? lensFacing}) =>
      CameraXPlugin.instance.$CameraSelectorApi(lensFacing: lensFacing);
}
