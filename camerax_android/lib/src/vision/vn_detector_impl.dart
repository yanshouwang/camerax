import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

base mixin VNDetectorImpl on VNDetector {
  DetectorApi get api;

  @override
  Future<void> close() => api.close();
}
