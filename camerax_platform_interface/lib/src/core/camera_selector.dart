import 'package:camerax_platform_interface/src/core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

enum CameraSelector$LensFacing { unknown, front, back, external }

abstract interface class CameraSelector$Builder {
  Future<CameraSelector$Builder> addCameraFilter(CameraFilter cameraFilter);
  Future<CameraSelector$Builder> requireLensFacing(
    CameraSelector$LensFacing lensFacing,
  );
  Future<CameraSelector$Builder> setPhysicalCameraId(String physicalCameraId);
  Future<CameraSelector> build();
}

abstract interface class CameraSelector {
  static CameraSelector get back => CameraSelectorChannel.instance.back;
  static CameraSelector get front => CameraSelectorChannel.instance.front;
  static CameraSelector get external => CameraSelectorChannel.instance.external;

  Future<List<CameraInfo>> filter(List<CameraInfo> cameraInfos);
  Future<String?> getPhysicalCameraId();
}

abstract base class CameraSelectorChannel extends PlatformInterface {
  CameraSelectorChannel() : super(token: _token);

  static final _token = Object();

  static CameraSelectorChannel? _instance;

  static CameraSelectorChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(CameraSelectorChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  CameraSelector get back;
  CameraSelector get front;
  CameraSelector get external;

  CameraSelector$Builder createBuilder();
}
