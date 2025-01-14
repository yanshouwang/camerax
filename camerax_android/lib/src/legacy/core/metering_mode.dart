import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension MeteringModeArgs on $base.MeteringMode {
  $native.MeteringMode get obj {
    switch (this) {
      case $base.MeteringMode.ae:
        return $native.MeteringMode.ae;
      case $base.MeteringMode.af:
        return $native.MeteringMode.af;
      case $base.MeteringMode.awb:
        return $native.MeteringMode.awb;
    }
  }
}
