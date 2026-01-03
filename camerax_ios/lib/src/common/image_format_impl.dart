import 'package:camerax_ios/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension ImageFormatApiX on ImageFormatApi {
  ImageFormat get impl => ImageFormat.values[index];
}
