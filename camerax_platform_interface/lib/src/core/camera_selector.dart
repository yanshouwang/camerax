import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'camera_info.dart';

enum CameraSelectorLensFacing { unknown, front, back, external }

abstract base class CameraSelector {
  static CameraSelector get back => CameraXPlugin.instance.$CameraSelector$Back;
  static CameraSelector get front =>
      CameraXPlugin.instance.$CameraSelector$Front;

  CameraSelector.impl();

  factory CameraSelector({CameraSelectorLensFacing? lensFacing}) =>
      CameraXPlugin.instance.$CameraSelector(lensFacing: lensFacing);

  Future<List<CameraInfo>> filter(List<CameraInfo> cameraInfos);
  Future<String?> getPhysicalCameraId();
}
