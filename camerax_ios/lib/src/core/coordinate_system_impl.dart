import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension CoordinateSystemX on ImageAnalysisCoordinateSystem {
  CoordinateSystemApi get api {
    switch (this) {
      case ImageAnalysisCoordinateSystem.original:
        return CoordinateSystemApi.original;
      case ImageAnalysisCoordinateSystem.sensor:
        return CoordinateSystemApi.sensor;
      case ImageAnalysisCoordinateSystem.viewReferenced:
        return CoordinateSystemApi.viewReferenced;
    }
  }
}
