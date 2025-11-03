// import 'package:camerax_ios/src/camerax_api.g.dart';
// import 'package:camerax_ios/src/common.dart';
// import 'package:camerax_ios/src/core.dart';
// import 'package:camerax_platform_interface/camerax_platform_interface.dart';

// final class Camera2CameraInfoImpl extends Camera2CameraInfo {
//   final Camera2CameraInfoApi api;

//   Camera2CameraInfoImpl.internal(this.api) : super.impl();

//   factory Camera2CameraInfoImpl.from(CameraInfo cameraInfo) {
//     final api = Camera2CameraInfoApi.from(cameraInfo: cameraInfo.api);
//     return Camera2CameraInfoImpl.internal(api);
//   }

//   @override
//   Future<Range<int>?> getSensorInfoExposureTimeRange() {
//     return api.getSensorInfoExposureTimeRange().then((e) => e?.impl);
//   }
// }
