import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension CameraStateApiX on CameraStateApi {
  CameraState get impl => CameraState.values[index];
}
