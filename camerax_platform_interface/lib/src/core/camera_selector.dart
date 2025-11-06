import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'camera_info.dart';

enum CameraSelectorLensFacing { unknown, front, back, external }

abstract base class CameraSelector {
  static CameraSelector get defaultBackCamera =>
      CameraXPlugin.instance.$CameraSelector$DefaultBackCamera;
  static CameraSelector get defaultFrontCamera =>
      CameraXPlugin.instance.$CameraSelector$DefaultFrontCamera;

  CameraSelector.impl();

  factory CameraSelector({CameraSelectorLensFacing? lensFacing}) =>
      CameraXPlugin.instance.$CameraSelector(lensFacing: lensFacing);

  Future<List<CameraInfo>> filter(List<CameraInfo> cameraInfos);
  Future<String?> getPhysicalCameraId();
}
