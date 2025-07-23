import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

base mixin VNDetectorImpl on VNDetector {
  VNDetectorApi get api;

  @override
  Future<void> close() => api.close();
}
