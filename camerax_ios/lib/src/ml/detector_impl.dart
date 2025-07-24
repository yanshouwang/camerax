import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

base mixin DetectorImpl<T> on Detector<T> {
  VNDetectorApi get api;

  @override
  Future<void> close() => api.close();
}
