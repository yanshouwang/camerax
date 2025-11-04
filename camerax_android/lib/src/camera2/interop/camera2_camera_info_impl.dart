import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class Camera2CameraInfoImpl extends Camera2CameraInfoApi {
  final Camera2CameraInfoProxyApi api;

  Camera2CameraInfoImpl.internal(this.api) : super.impl();

  factory Camera2CameraInfoImpl.from(CameraInfoApi cameraInfo) {
    final api = Camera2CameraInfoProxyApi.from(cameraInfo: cameraInfo.api);
    return Camera2CameraInfoImpl.internal(api);
  }

  @override
  Future<RangeApi?> getSensorInfoExposureTimeRange() {
    return api.getSensorInfoExposureTimeRange().then((e) => e?.impl);
  }
}
