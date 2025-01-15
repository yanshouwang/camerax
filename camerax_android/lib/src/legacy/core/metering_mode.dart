import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension MeteringModeArgs on $interface.MeteringMode {
  $native.MeteringMode get obj {
    switch (this) {
      case $interface.MeteringMode.ae:
        return $native.MeteringMode.ae;
      case $interface.MeteringMode.af:
        return $native.MeteringMode.af;
      case $interface.MeteringMode.awb:
        return $native.MeteringMode.awb;
    }
  }
}
