import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

base mixin DetectorImpl<T> on Detector<T> {
  DetectorApi get api;

  @override
  Future<void> close() => api.close();
}
