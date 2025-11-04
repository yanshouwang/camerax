import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension ImageInfoApiX on ImageInfoApi {
  ImageInfoApi get impl =>
      ImageInfoApi(timestamp: timestamp, rotationDegrees: rotationDegrees);
}
