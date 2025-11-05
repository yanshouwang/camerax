import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'camera_info_api.dart';

enum CameraSelectorLensFacing { unknown, front, back, external }

abstract base class CameraSelectorApi {
  static CameraSelectorApi get defaultBackCamera =>
      CameraXPlugin.instance.$CameraSelectorApiDefaultBackCamera;
  static CameraSelectorApi get defaultFrontCamera =>
      CameraXPlugin.instance.$CameraSelectorApiDefaultFrontCamera;

  CameraSelectorApi.impl();

  factory CameraSelectorApi({CameraSelectorLensFacing? lensFacing}) =>
      CameraXPlugin.instance.$CameraSelectorApi(lensFacing: lensFacing);

  Future<List<CameraInfoApi>> filter(List<CameraInfoApi> cameraInfos);
  Future<String?> getPhysicalCameraId();
}
