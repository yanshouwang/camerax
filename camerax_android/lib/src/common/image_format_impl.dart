import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension ImageFormatApiX on ImageFormatApi {
  ImageFormat get impl => ImageFormat.values[index];
}
