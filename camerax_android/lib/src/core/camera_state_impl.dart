import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension CameraStateApiX on CameraStateApi {
  CameraState get impl => CameraState.values[index];
}
