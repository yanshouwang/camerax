import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension CoordinateSystemX on CoordinateSystem {
  CoordinateSystemApi get api {
    switch (this) {
      case CoordinateSystem.original:
        return CoordinateSystemApi.original;
      case CoordinateSystem.sensor:
        return CoordinateSystemApi.sensor;
      case CoordinateSystem.viewReferenced:
        return CoordinateSystemApi.viewReferenced;
    }
  }
}
