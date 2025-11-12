import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension ImageFormatApiX on ImageFormatApi {
  ImageFormat get impl => ImageFormat.values[index];
}
