import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension MeteringModeX on MeteringMode {
  MeteringModeApi get api {
    switch (this) {
      case MeteringMode.ae:
        return MeteringModeApi.ae;
      case MeteringMode.af:
        return MeteringModeApi.af;
      case MeteringMode.awb:
        return MeteringModeApi.awb;
    }
  }
}
