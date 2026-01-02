import 'package:camerax_android/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension ImageFormatApiX on ImageFormatApi {
  ImageFormat get impl => ImageFormat.values[index];
}
