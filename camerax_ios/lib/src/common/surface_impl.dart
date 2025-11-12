import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension SurfaceRotationX on SurfaceRotation {
  SurfaceRotationApi get api => SurfaceRotationApi.values[index];
}

extension SurfaceRotationApiX on SurfaceRotationApi {
  SurfaceRotation get impl => SurfaceRotation.values[index];
}
