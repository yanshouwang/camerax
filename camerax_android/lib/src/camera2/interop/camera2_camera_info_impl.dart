import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class Camera2CameraInfoImpl extends Camera2CameraInfoChannel {
  factory Camera2CameraInfoImpl.from(CameraInfo cameraInfo) {
    if (cameraInfo is! CameraInfoImpl) {
      throw TypeError();
    }
    final api = Camera2CameraInfoApi.from(
      cameraInfo: cameraInfo.api,
    );
    return Camera2CameraInfoImpl.impl(api);
  }

  final Camera2CameraInfoApi api;

  Camera2CameraInfoImpl.impl(this.api) : super.impl();

  @override
  Future<Range<int>?> getSensorInfoExposureTimeRange() {
    return api.getSensorInfoExposureTimeRange().then((e) => e?.impl);
  }
}
