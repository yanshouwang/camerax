import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension ImageInfoApiX on ImageInfoApi {
  ImageInfo get impl =>
      ImageInfo(timestamp: timestamp, rotationDegrees: rotationDegrees);
}
